[CmdletBinding()]
param([string]$Root = (Split-Path -Parent $PSScriptRoot))

$ErrorActionPreference = 'Stop'
$Root = [IO.Path]::GetFullPath($Root)
$sandbox = Join-Path ([IO.Path]::GetTempPath()) ('agent-standards-fixtures-' + [Guid]::NewGuid().ToString('N'))
$validator = Join-Path $Root 'scripts/Validate-Standards.ps1'
$passed = 0

function Set-FixtureText($Fixture, $Path, $Text) {
    [IO.File]::WriteAllText((Join-Path $Fixture $Path), $Text, (New-Object Text.UTF8Encoding($false)))
}
function Replace-FixtureText($Fixture, $Path, $Old, $New) {
    $text = [IO.File]::ReadAllText((Join-Path $Fixture $Path))
    if (-not $text.Contains($Old)) { throw "Fixture setup missing expected text: $Path" }
    Set-FixtureText $Fixture $Path ($text.Replace($Old, $New))
}
function Set-FixtureMetadata($Fixture, $State, $OnlyPath, $Version) {
    if (-not $Version) { $Version = ([IO.File]::ReadAllText((Join-Path $Fixture 'VERSION'))).Trim() }
    $candidate = $State -eq 'candidate'
    $readmeState = 'Release'; $headingState = 'Released'; $manifestState = 'release'
    if ($candidate) { $readmeState = 'Candidate'; $headingState = 'Candidate'; $manifestState = 'candidate' }
    foreach ($item in @(
        @{ Path = 'README.md'; Pattern = '(?m)^\*\*(Candidate|Release) version:\*\* `[^`\r\n]+`[^\r\n]*'; Text = ('**' + $readmeState + ' version:** `' + $Version + '` -- metadata only; publication requires separate evidence.') },
        @{ Path = 'CHANGELOG.md'; Pattern = '(?m)^## \d+\.\d+\.\d+ [^\r\n]*'; Text = ('## ' + $Version + ' -- ' + $headingState + ' (fixture; no remote verification)') },
        @{ Path = 'STANDARD_MANIFEST.txt'; Pattern = '(?m)^# Files that form portable (candidate|release) version [^\r\n]*'; Text = ('# Files that form portable ' + $manifestState + ' version ' + $Version + '; metadata only, not publication evidence.') }
    )) {
        if ($OnlyPath -and $item.Path -ne $OnlyPath) { continue }
        $text = [IO.File]::ReadAllText((Join-Path $Fixture $item.Path))
        $regex = New-Object regex($item.Pattern)
        if (-not $regex.IsMatch($text)) { throw "Fixture setup missing metadata: $($item.Path)" }
        Set-FixtureText $Fixture $item.Path ($regex.Replace($text, $item.Text, 1))
    }
}
function Test-Case($Name, $Mutation, $Expected) {
    $fixture = Join-Path $sandbox ($sourceState + '-' + $Name)
    New-Item -ItemType Directory -Path $fixture | Out-Null
    foreach ($directory in @('.claude', '.github', 'docs', 'templates')) {
        Copy-Item -LiteralPath (Join-Path $Root $directory) -Destination $fixture -Recurse
    }
    foreach ($file in @('VERSION', 'README.md', 'CLAUDE.md', 'CHANGELOG.md', 'STANDARD_MANIFEST.txt')) {
        Copy-Item -LiteralPath (Join-Path $Root $file) -Destination $fixture
    }
    Set-FixtureMetadata $fixture $sourceState
    & $Mutation $fixture
    $failure = $null
    try { & $validator -Root $fixture | Out-Null } catch { $failure = $_.Exception.Message }
    if ($Expected) {
        if (-not $failure -or $failure -notmatch $Expected) { throw "FAIL ${Name}: expected '$Expected', got '$failure'" }
    } elseif ($failure) { throw "FAIL ${Name}: $failure" }
    $script:passed++
    Write-Output "PASS $sourceState/$Name"
}

try {
    New-Item -ItemType Directory -Path $sandbox | Out-Null
    foreach ($sourceState in @('candidate', 'released')) {
    Test-Case 'positive-candidate' { param($f) Set-FixtureMetadata $f 'candidate' } $null
    Test-Case 'positive-released' { param($f) Set-FixtureMetadata $f 'released' } $null
    Test-Case 'required-missing' { param($f) Remove-Item -LiteralPath (Join-Path $f 'templates/task_packets/SMALL_TASK_PACKET.md') } 'Missing required files'
    Test-Case 'manifest-missing' { param($f) Add-Content -LiteralPath (Join-Path $f 'STANDARD_MANIFEST.txt') -Value 'docs/not-present.md' } 'Missing manifest file'
    Test-Case 'manifest-duplicate' { param($f) Add-Content -LiteralPath (Join-Path $f 'STANDARD_MANIFEST.txt') -Value '.claude/agents/sprint-coder.md' } 'Duplicate manifest entry'
    Test-Case 'manifest-unbounded' { param($f) Add-Content -LiteralPath (Join-Path $f 'STANDARD_MANIFEST.txt') -Value '../outside.md' } 'Unbounded manifest entry'
    Test-Case 'frontmatter-opening' { param($f) Set-FixtureText $f '.claude/agents/sprint-coder.md' 'name: invalid' } 'Missing frontmatter opening'
    Test-Case 'frontmatter-closing' { param($f) Set-FixtureText $f '.claude/agents/sprint-coder.md' "---`nname: coder`ndescription: test" } 'Missing frontmatter closing'
    Test-Case 'frontmatter-field' { param($f) Set-FixtureText $f '.claude/agents/sprint-coder.md' "---`nname: coder`n---" } 'Missing frontmatter field description'
    Test-Case 'frontmatter-duplicate' { param($f) Set-FixtureText $f '.claude/agents/sprint-coder.md' "---`nname: coder`nname: duplicate`ndescription: test`n---" } 'Duplicate frontmatter key'
    Test-Case 'local-link' { param($f) Add-Content -LiteralPath (Join-Path $f 'README.md') -Value '[missing](docs/not-present.md)' } 'Missing local link target'
    Test-Case 'link-boundary' { param($f) Add-Content -LiteralPath (Join-Path $f 'README.md') -Value '[outside](../outside.md)' } 'Local link escapes root'
    Test-Case 'worker-delegation' { param($f) Replace-FixtureText $f '.github/agents/sprint-coder.agent.md' 'disable-model-invocation: false' 'disable-model-invocation: true' } 'Hidden worker lacks explicit delegation'
    Test-Case 'body-not-metadata' { param($f) Replace-FixtureText $f '.github/agents/sprint-coder.agent.md' 'disable-model-invocation: false' '# removed'; Add-Content -LiteralPath (Join-Path $f '.github/agents/sprint-coder.agent.md') -Value 'disable-model-invocation: false' } 'Hidden worker lacks explicit delegation'
    Test-Case 'architect-delegation' { param($f) Replace-FixtureText $f '.github/agents/sprint-architect.agent.md' 'agents: [sprint-coder, senior-reviewer]' 'agents: [sprint-coder]' } 'Invalid core architect delegation'
    Test-Case 'positive-core-identifiers' { param($f) } $null
    Test-Case 'positive-bare-identifiers' { param($f) Replace-FixtureText $f '.github/agents/sprint-coder.agent.md' 'name: "sprint-coder"' 'name: sprint-coder'; Replace-FixtureText $f '.github/agents/senior-reviewer.agent.md' 'name: "senior-reviewer"' 'name: senior-reviewer' } $null
    Test-Case 'coder-name-mismatch' { param($f) Replace-FixtureText $f '.github/agents/sprint-coder.agent.md' 'name: "sprint-coder"' 'name: "Sprint Coder"' } 'Core worker name/allowlist mismatch: sprint-coder'
    Test-Case 'reviewer-name-mismatch' { param($f) Replace-FixtureText $f '.github/agents/senior-reviewer.agent.md' 'name: "senior-reviewer"' 'name: "Senior Reviewer"' } 'Core worker name/allowlist mismatch: senior-reviewer'
    Test-Case 'body-not-identifier' { param($f) Replace-FixtureText $f '.github/agents/sprint-coder.agent.md' 'name: "sprint-coder"' 'name: "other"'; Add-Content -LiteralPath (Join-Path $f '.github/agents/sprint-coder.agent.md') -Value 'name: "sprint-coder"' } 'Core worker name/allowlist mismatch: sprint-coder'
    Test-Case 'allowlist-identifier-case' { param($f) Replace-FixtureText $f '.github/agents/sprint-architect.agent.md' 'agents: [sprint-coder, senior-reviewer]' 'agents: [Sprint-Coder, senior-reviewer]' } 'Invalid core architect delegation'
    Test-Case 'adapter-metadata' { param($f) Replace-FixtureText $f '.github/agents/sprint-architect.agent.md' 'user-invocable: true' 'user-invocable: maybe' } 'Invalid adapter visibility'
    Test-Case 'version-format' { param($f) Set-FixtureText $f 'VERSION' 'not-a-version' } 'VERSION is not semantic'
    Test-Case 'version-consistency' { param($f) Set-FixtureText $f 'VERSION' '9.9.9' } 'Inconsistent release metadata version'
    foreach ($metadataPath in @('README.md', 'CHANGELOG.md', 'STANDARD_MANIFEST.txt')) {
        Test-Case ('mixed-' + $metadataPath.Replace('.', '-')) {
            param($f)
            $otherState = 'candidate'; if ($sourceState -eq 'candidate') { $otherState = 'released' }
            Set-FixtureMetadata $f $otherState $metadataPath
        } 'Mixed candidate/released metadata states'
        Test-Case ('version-' + $metadataPath.Replace('.', '-')) {
            param($f) Set-FixtureMetadata $f $sourceState $metadataPath '9.9.9'
        } 'Inconsistent release metadata version'
    }
    Test-Case 'unsupported-links-not-fetched' { param($f) Add-Content -LiteralPath (Join-Path $f 'README.md') -Value "[web](https://invalid.example/test)`n[anchor](#not-validated)" } $null
    }
    Write-Output "Fixture tests passed: $passed. Disposable sandbox: $sandbox (removed in finally)."
} finally {
    # Delete only the GUID directory created by this invocation, never Root.
    if (Test-Path -LiteralPath $sandbox) { Remove-Item -LiteralPath $sandbox -Recurse -Force }
}