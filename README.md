# Agent Standards

Versioned, reusable operating standards for repositories that use Claude Code roles and VS Code GitHub Copilot custom-agent orchestration.

**Candidate version:** `1.4.1` — implementation candidate; independent review and publication authorization remain pending. Consumer adoption remains separate.

**Publication status:** The remote `v1.4.0` annotated tag object `0124ee1bd4aeb04ea91931c5ec9ea034b7ba49d3` was verified on 2026-10-07 resolving to `3f09b67f79281afc6263bf94e207593e3760da15`. Its immutable tagged bytes retain pre-publication prose; this subsequent documentation-branch correction does not change the tag or pinned release payload. Historically, `v1.3.0` is verified published: annotated tag object `3cd0131ae61743d5842278246de0d14c2fb08c8a` resolves to `d2fd121b1c7314ad14a9ad521a6ce3fe7df27f45`. Consumers stay pinned to a released immutable tag/commit until separately approved adoption; `VERSION` alone never authorizes a pin change.

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

The backward-compatible 1.3.0 release adds [Review calibration](docs/REVIEW_CALIBRATION.md): provenance/impact-based findings, exact scoped handoffs and debt dispositions, bounded correction review, and separate implementation, validation and finalization conclusions. Portable roles remain authoritative, adapters stay thin, and mandatory consumer safeguards are unchanged.

The 1.4.0 release adds [Bounded execution](docs/BOUNDED_EXECUTION.md): impact-based mapping, material stops, explicit opt-in small tasks, new-packet repair defaults, compact checkpoints, and bounded PowerShell 5.1 structural fixtures. Existing approvals, explicit limits, optional packs and stronger consumer controls remain unchanged. Run both `scripts/Validate-Standards.ps1` and `scripts/Test-Validate-Standards.ps1`; supported checks and limitations are documented in that guidance.

The 1.4.1 candidate corrects core worker names and clarifies [delegation routing](docs/DELEGATION_ROUTING.md): registered identifiers preferred, generic role-guided fallback only where available/permitted and required controls survive. Registration, model selection and tool enforcement are distinct; Markdown cannot bypass runtime allowlists or apply frontmatter. Model preferences, tools, visibility, delegation flags, optional packs and portable Claude handoffs are unchanged. The published 1.4.0 facts above remain historical provenance, not 1.4.1 publication evidence.

## Scope boundary

- Shared standard: packet approval, architect -> coder -> reviewer sequence, worker visibility, review evidence, branch discipline, direct-target exception, and generic evidence/context controls.
- Local overlay: project paths, naming, data systems, destructive-operation rules, quality commands, CI/PR policy, models permitted by the repository, and domain-specific acceptance criteria.

The standard is guidance and workflow configuration. Repository branch protections and CI remain the enforceable controls.
