[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$required = @(
    'VERSION',
    'STANDARD_MANIFEST.txt',
    'README.md',
    'CLAUDE.md',
    '.claude/CLAUDE.md',
    'CHANGELOG.md',
    '.claude/agents/sprint-architect.md',
    '.claude/agents/sprint-coder.md',
    '.claude/agents/senior-reviewer.md',
    '.claude/skills/finalize-branch-work/SKILL.md',
    '.claude/skills/planning-package-review/SKILL.md',
    '.claude/skills/evidence-gated-planning/SKILL.md',
    '.claude/skills/source-context-and-artifact-propagation-audit/SKILL.md',
    '.claude/agents/data-analyst.md',
    '.claude/skills/generic-data-analysis/SKILL.md',
    '.claude/agents/cross-repo-std-orchestrator.md',
    '.claude/skills/cross-repo-standards-orchestration/SKILL.md',
    '.github/agents/sprint-architect.agent.md',
    '.github/agents/sprint-coder.agent.md',
    '.github/agents/senior-reviewer.agent.md',
    '.github/agents/data-analyst.agent.md',
    '.github/agents/cross-repo-std-orchestrator.agent.md',
    '.github/skills/generic-data-analysis/SKILL.md',
    '.github/skills/cross-repo-standards-orchestration/SKILL.md',
    '.github/copilot-instructions.md',
    '.github/ORCHESTRATION_ADDENDUM.md',
    'templates/task_packets/TASK_PACKET.md',
    'templates/task_packets/SMALL_TASK_PACKET.md',
    'templates/task_packets/EXECUTION_CHECKPOINT.md',
    'docs/BOUNDED_EXECUTION.md',
    'docs/REVIEW_CALIBRATION.md',
    'docs/DELEGATION_ROUTING.md',
    'templates/direct_push_authorizations/DIRECT_PUSH_AUTHORIZATION.md',
    'templates/LOCAL_OVERLAY.md',
    'templates/data-analysis/analysis-request.md',
    'templates/data-analysis/data-contract.md',
    'templates/data-analysis/run-manifest.md',
    'templates/data-analysis/analysis-report.md',
    'docs/packs/DATA_ANALYSIS_PACK.md',
    'templates/cross-repo-standards/PRACTICE_PROMOTION_REVIEW.md',
    'docs/packs/CROSS_REPO_STANDARDS_ORCHESTRATOR.md'
)

$Root = [IO.Path]::GetFullPath($Root).TrimEnd('\', '/')
$missing = $required | Where-Object { -not (Test-Path -LiteralPath (Join-Path $Root $_) -PathType Leaf) }
if ($missing) { throw "Missing required files:`n$($missing -join "`n")" }

$manifest = @(Get-Content -LiteralPath (Join-Path $Root 'STANDARD_MANIFEST.txt') | ForEach-Object { $_.Trim() } | Where-Object { $_ -and -not $_.StartsWith('#') })
if ($manifest.Count -eq 0) { throw 'Manifest has no entries.' }
$seen = @{}
foreach ($entry in $manifest) {
    $key = $entry.Replace('\', '/')
    if ($seen.ContainsKey($key)) { throw "Duplicate manifest entry: $entry" }
    $seen[$key] = $true
    if ([IO.Path]::IsPathRooted($entry) -or $entry -match '(^|[\\/])\.\.([\\/]|$)') { throw "Unbounded manifest entry: $entry" }
    if (-not (Test-Path -LiteralPath (Join-Path $Root $entry) -PathType Leaf)) { throw "Missing manifest file: $entry" }
}

# Deliberately bounded top-level fields, not arbitrary YAML parsing.
$frontmatterFiles = @(Get-ChildItem (Join-Path $Root '.claude/agents'), (Join-Path $Root '.github/agents') -Filter '*.md' -File)
$frontmatterFiles += @(Get-ChildItem (Join-Path $Root '.claude/skills'), (Join-Path $Root '.github/skills') -Filter 'SKILL.md' -File -Recurse)
$headers = @{}
foreach ($file in $frontmatterFiles) {
    $lines = @(Get-Content -LiteralPath $file.FullName)
    if ($lines[0] -ne '---') { throw "Missing frontmatter opening marker: $($file.FullName)" }
    $end = -1
    for ($i = 1; $i -lt [Math]::Min($lines.Count, 100); $i++) {
        if ($lines[$i] -eq '---') { $end = $i; break }
    }
    if ($end -lt 0) { throw "Missing frontmatter closing marker within 100 lines: $($file.FullName)" }
    $fields = @{}
    for ($i = 1; $i -lt $end; $i++) {
        if ($lines[$i] -match '^([A-Za-z][A-Za-z0-9-]*):\s*(.*)$') {
            $key = $Matches[1]; $value = $Matches[2].Trim()
            if ($fields.ContainsKey($key)) { throw "Duplicate frontmatter key ${key}: $($file.FullName)" }
            $fields[$key] = $value
        }
    }
    foreach ($key in @('name', 'description')) {
        if (-not $fields.ContainsKey($key) -or $fields[$key] -match '^(\s*|""|''''|#.*)$') { throw "Missing frontmatter field ${key}: $($file.FullName)" }
    }
    $headers[$file.FullName] = $fields
}

foreach ($file in @(Get-ChildItem (Join-Path $Root '.github/agents') -Filter '*.agent.md' -File)) {
    $fields = $headers[$file.FullName]
    foreach ($key in @('tools', 'model', 'user-invocable')) {
        if (-not $fields.ContainsKey($key) -or -not $fields[$key]) { throw "Missing adapter metadata ${key}: $($file.Name)" }
    }
    if ($fields['user-invocable'] -notmatch '^(true|false)$') { throw "Invalid adapter visibility: $($file.Name)" }
}
foreach ($worker in @('sprint-coder', 'senior-reviewer')) {
    $fields = $headers[(Join-Path $Root ".github/agents/$worker.agent.md")]
    if ($fields['user-invocable'] -ne 'false' -or $fields['disable-model-invocation'] -ne 'false') {
        throw "Hidden worker lacks explicit delegation metadata: $worker"
    }
}
$architect = $headers[(Join-Path $Root '.github/agents/sprint-architect.agent.md')]
if ($architect['user-invocable'] -ne 'true' -or $architect['agents'] -cnotmatch '^\[\s*sprint-coder\s*,\s*senior-reviewer\s*\]$') { throw 'Invalid core architect delegation metadata.' }
# Exact core identifiers only; accept bounded bare or paired-quoted name scalars.
# This proves structural alignment, not runtime registration or discovery.
foreach ($worker in @('sprint-coder', 'senior-reviewer')) {
    $fields = $headers[(Join-Path $Root ".github/agents/$worker.agent.md")]
    $namePattern = '^(?:' + [regex]::Escape($worker) + '|"' + [regex]::Escape($worker) + '"|''' + [regex]::Escape($worker) + ''')$'
    if ($fields['name'] -cnotmatch $namePattern) { throw "Core worker name/allowlist mismatch: $worker" }
}

# Supported inline Markdown links outside fenced blocks; validate file targets,
# not anchors, reference-style links, arbitrary Markdown, or external URLs.
$markdownPaths = @($required + $manifest | Where-Object { $_ -like '*.md' } | Sort-Object -Unique)
foreach ($relative in $markdownPaths) {
    $file = Join-Path $Root $relative
    $fenced = $false
    foreach ($line in Get-Content -LiteralPath $file) {
        if ($line -match '^\s*(`{3,}|~{3,})') { $fenced = -not $fenced; continue }
        if ($fenced) { continue }
        foreach ($match in [regex]::Matches($line, '\[[^\]\r\n]+\]\(([^\s()]+)\)')) {
            $link = $match.Groups[1].Value
            if ($link -match '^(#|[A-Za-z][A-Za-z0-9+.-]*:|//|<)') { continue }
            $target = [Uri]::UnescapeDataString(($link -split '[#?]', 2)[0])
            $resolved = [IO.Path]::GetFullPath((Join-Path (Split-Path -Parent $file) $target))
            if (-not $resolved.StartsWith($Root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) { throw "Local link escapes root in ${relative}: $link" }
            if (-not (Test-Path -LiteralPath $resolved)) { throw "Missing local link target in ${relative}: $link" }
        }
    }
}

$version = (Get-Content -LiteralPath (Join-Path $Root 'VERSION') -Raw).Trim()
if ($version -notmatch '^\d+\.\d+\.\d+$') { throw "VERSION is not semantic versioning: $version" }
# Validate structural state only; a release label does not prove remote publication.
$states = @()
foreach ($check in @(
        @{ Path = 'README.md'; Pattern = '(?m)^\*\*(?<State>Candidate|Release) version:\*\* `(?<Version>[^`\r\n]+)`[^\r\n]*\r?$' },
        @{ Path = 'CHANGELOG.md'; Pattern = '(?m)^## (?<Version>\d+\.\d+\.\d+) [^\r\n]*\r?$' },
        @{ Path = 'STANDARD_MANIFEST.txt'; Pattern = '(?m)^# Files that form portable (?<State>candidate|release) version (?<Version>[^;\s]+);[^\r\n]*\r?$' }
    )) {
    $text = Get-Content -LiteralPath (Join-Path $Root $check.Path) -Raw
    $declarations = [regex]::Matches($text, $check.Pattern)
    if ($declarations.Count -eq 0 -or ($check.Path -ne 'CHANGELOG.md' -and $declarations.Count -ne 1)) {
        throw "Invalid current release metadata declaration: $($check.Path)"
    }
    # Historical CHANGELOG entries remain valid; the first version heading is current.
    $current = $declarations[0]
    if ($current.Groups['Version'].Value -ne $version) { throw "Inconsistent release metadata version: $($check.Path)" }
    if ($check.Path -eq 'CHANGELOG.md') {
        if ($current.Value -match '^## \d+\.\d+\.\d+\s+[^A-Za-z\r\n]+(?<State>Candidate|Released|Release(?: finalization)?)\b') {
            $state = $Matches['State']
        }
        else { throw 'Invalid current release metadata state: CHANGELOG.md' }
    }
    else { $state = $current.Groups['State'].Value }
    if ($state -eq 'Candidate') { $states += 'candidate' } else { $states += 'released' }
}
if (@($states | Sort-Object -Unique).Count -ne 1) { throw 'Mixed candidate/released metadata states.' }
Write-Output "Standards validation passed for version $version ($($states[0]) metadata only; remote publication not verified)."
Write-Output 'Supported: required inventory; manifest existence/duplicates/bounds; bounded frontmatter; inline local file links; coherent candidate/released metadata versions/states; core delegation names/allowlist. Not full YAML/Markdown, remote publication, runtime discovery/model availability, client enforcement, or runtime validation.'
