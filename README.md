# Agent Standards

Versioned, reusable operating standards for repositories that use Claude Code roles and VS Code GitHub Copilot custom-agent orchestration.

**Current release:** `1.2.1`

Start with [CLAUDE.md](CLAUDE.md), the operating manual for maintaining this standards repository.

This repository owns generic workflow behavior. It deliberately does **not** own a product repository's domain rules, secrets, data boundaries, test commands, paths, Azure DevOps identifiers, or architecture decisions.

## Standard layout

```text
.claude/CLAUDE.md                      Claude Code entry wrapper
.claude/agents/                         Portable role behavior
.claude/skills/                         Portable workflow safeguards
.github/agents/                         Copilot-only adapters
.github/copilot-instructions.md         Copilot entry wrapper
.github/ORCHESTRATION_ADDENDUM.md        Copilot delegation policy
templates/                              Core and optional-pack consumer templates
docs/                                   Governance, adoption, and pack guidance
scripts/                                Local validation and sync helpers
```

## Optional packs

The core baseline is suitable for general repository work. Install optional packs only when a consumer needs their capability.

- [Data Analysis Pack](docs/packs/DATA_ANALYSIS_PACK.md): user-facing generic dataset exploration and consequential-analysis safeguards, with reusable request, contract, manifest, and report templates.
- [Cross Repo Std Orchestrator](docs/packs/CROSS_REPO_STANDARDS_ORCHESTRATOR.md): user-facing capability stewardship for standards drift, reusable-practice promotion, releases, and consumer adoption.

## Consumer model

A consuming repository installs a pinned copy of this kit and keeps only its domain-specific additions in a local overlay.

1. Record the installed release in `.agent-standards-version`.
2. Create `Documentation/agent-governance/LOCAL_OVERLAY.md` from the supplied template.
3. Copy standard-controlled files into the repository.
4. Keep repository-specific instructions, skills, validation commands, and domain protections outside standard-controlled files, or document approved deviations in the overlay.
5. Before an upgrade, compare the installed release to the new release, apply the update in a feature branch, and have the repository reviewer inspect the resulting diff.

Read [Consumer adoption](docs/CONSUMER_ADOPTION.md), [Governance](docs/GOVERNANCE.md), and [Release process](docs/RELEASE_PROCESS.md) before adopting or changing standards.

## Scope boundary

- Shared standard: packet approval, architect -> coder -> reviewer sequence, worker visibility, review evidence, branch discipline, direct-target exception, and generic evidence/context controls.
- Local overlay: project paths, naming, data systems, destructive-operation rules, quality commands, CI/PR policy, models permitted by the repository, and domain-specific acceptance criteria.

The standard is guidance and workflow configuration. Repository branch protections and CI remain the enforceable controls.
