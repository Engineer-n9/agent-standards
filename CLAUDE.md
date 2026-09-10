# Agent Standards — Operating Manual

> **Canonical reusable workflow authority.**
> This repository defines shared agent-workflow behavior for consumer repositories. It does not define any product repository's domain behavior.

## Purpose and scope

Use this repository to maintain versioned, portable baseline behavior for Claude Code roles and VS Code GitHub Copilot custom-agent adapters.

Keep here:

- reusable architect -> approved packet -> coder -> reviewer workflow;
- generic planning, evidence, context/artifact, and branch-finalization safeguards;
- Copilot worker visibility and delegation metadata;
- templates and consumer-adoption governance.

Do **not** put here:

- product source code, tests, data, credentials, or customer material;
- repository-specific paths, validation commands, Azure DevOps identifiers, or branch-policy claims;
- product architecture, physics, schemas, external-system behavior, or operator-local settings;
- consumer sprint state, backlog, or historical delivery records.

## Authority model

- `VERSION`, tagged releases, `STANDARD_MANIFEST.txt`, and this manual define the released reusable baseline.
- Consumer repositories pin a release in `.agent-standards-version`.
- A consumer repository's operating manual, active packet, local overlay, architecture documentation, and domain safeguards remain authoritative for that repository.
- `Documentation/agent-governance/LOCAL_OVERLAY.md` in each consumer records intentional local adaptations.
- A local adaptation may strengthen a standard. It must not silently weaken one; an approved deviation needs a reason and replacement control.

## Required workflow invariant

The standard workflow is:

1. Architect gathers required authority and current remote state.
2. Architect creates or validates a bounded sprint or task packet.
3. A human explicitly approves that packet.
4. Coder implements only approved scope and returns validation evidence.
5. Reviewer inspects actual output, diff, and evidence, then returns a ranked verdict.
6. Finalization uses a feature branch and pull request by default.

Copilot adapters provide client routing and delegation only. They do not replace repository branch protections, CI, review, external-data safeguards, or local validation.

## Direct protected-target updates

A direct push to `main`, `master`, or a consumer's protected target is exceptional. The portable `finalize-branch-work` skill requires exact source/target SHAs, clean review, named human authorization, pre-push audit record, immediate remote target re-check, fast-forward proof, and post-push confirmation. Consumers may impose stricter controls.

## Working in this repository

Before changing standards:

1. Read `README.md`, `docs/GOVERNANCE.md`, `docs/RELEASE_PROCESS.md`, and `STANDARD_MANIFEST.txt`.
2. Identify whether the proposal is reusable rather than product-specific.
3. Preserve the authority split: portable `.claude` behavior; Copilot-only `.github` adapters; consumer-local overlay for domain details.
4. Update both portable and Copilot layers when a shared invariant requires both.
5. Update `VERSION`, `CHANGELOG.md`, and the manifest when release-controlled content changes.
6. Run `scripts/Validate-Standards.ps1`.
7. Finalize through a feature branch and pull request, then tag the released merge commit as `v<version>`.

## Safety and quality rules

- Do not modify a consumer repository while making a standards release unless the user explicitly requests a separate consumer-adoption task.
- Do not copy a consumer's external-data, domain, security, or validation rules into the shared baseline without first generalizing them and preserving their stronger local form in that consumer.
- Do not remove or replace consumer-local Markdown authority during standards adoption without a separate approved packet proving redundancy and preserving required history.
- Treat the standard kit as documentation/configuration. Validate frontmatter, manifest completeness, cross-references, and release metadata; do not claim runtime validation that this repository cannot perform.
