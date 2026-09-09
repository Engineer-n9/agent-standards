[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$required = @(
    'VERSION',
    'README.md',
    'CHANGELOG.md',
    '.claude/agents/sprint-architect.md',
    '.claude/agents/sprint-coder.md',
    '.claude/agents/senior-reviewer.md',
    '.claude/skills/finalize-branch-work/SKILL.md',
    '.claude/skills/planning-package-review/SKILL.md',
    '.claude/skills/evidence-gated-planning/SKILL.md',
    '.claude/skills/source-context-and-artifact-propagation-audit/SKILL.md',
    '.github/agents/sprint-architect.agent.md',
    '.github/agents/sprint-coder.agent.md',
    '.github/agents/senior-reviewer.agent.md',
    '.github/copilot-instructions.md',
    '.github/ORCHESTRATION_ADDENDUM.md',
    'templates/task_packets/TASK_PACKET.md',
    'templates/direct_push_authorizations/DIRECT_PUSH_AUTHORIZATION.md',
    'templates/LOCAL_OVERLAY.md'
)

$missing = $required | Where-Object { -not (Test-Path (Join-Path $Root $_)) }
if ($missing) { throw "Missing required files:`n$($missing -join "`n")" }

$frontmatterFiles = Get-ChildItem (Join-Path $Root '.claude/agents'), (Join-Path $Root '.github/agents') -Filter '*.md' -File
foreach ($file in $frontmatterFiles) {
    $first = Get-Content -LiteralPath $file.FullName -TotalCount 1
    if ($first -ne '---') { throw "Missing YAML frontmatter opening marker: $($file.FullName)" }
}

$workerFiles = @(
    (Join-Path $Root '.github/agents/sprint-coder.agent.md'),
    (Join-Path $Root '.github/agents/senior-reviewer.agent.md')
)
foreach ($file in $workerFiles) {
    if (-not (Select-String -LiteralPath $file -Pattern '^disable-model-invocation: false$' -Quiet)) {
        throw "Hidden worker lacks explicit delegation metadata: $file"
    }
}

$version = (Get-Content -LiteralPath (Join-Path $Root 'VERSION') -Raw).Trim()
if ($version -notmatch '^\d+\.\d+\.\d+$') { throw "VERSION is not semantic versioning: $version" }
Write-Output "Standards validation passed for version $version."
