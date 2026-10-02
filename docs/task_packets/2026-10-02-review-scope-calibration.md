# Approved Task — Review Scope Calibration

## Source and approval

The user approved the preceding shared-standards calibration proposal on 2026-10-02 and requested delegated implementation and independent review using the currently selected model. Exact approval time/timezone is not available; do not invent it. Consumer adoption is a separate task. No commit, push, PR, merge, or tag is authorized.

## Goal

Deliver reusable, evidence-based review calibration without weakening mandatory consumer safeguards: classify finding provenance and relevance, distinguish implementation acceptance from validation limitations and finalization readiness, and bound correction reviews.

## Baseline and review stage

- Fetched `origin/main` and clean initial HEAD: `1f23e1ebd010d6a824cae4fb92bc35546d3db79e`.
- Working branch: `feature/review-scope-calibration`.
- Review stage: implementation/documentation review of tracked and newly added task files against that baseline; finalization remains unauthorized.
- Candidate identity: uncommitted working-tree diff; identify exact reviewed files and evidence, not a nonexistent candidate commit.

## Allowed paths and responsibilities

- `.claude/agents/senior-reviewer.md`: provenance, scope/authority/impact, impact-based severity, separate conclusions, proportionate investigation, bounded re-review.
- `.claude/agents/sprint-architect.md`: exact review handoff, reconciliation before repair, no scope expansion by finding alone.
- `.github/agents/senior-reviewer.agent.md`, `.github/agents/sprint-architect.agent.md`, `.github/ORCHESTRATION_ADDENDUM.md`: align routing/handoff with portable authority, no competing policy.
- `templates/task_packets/TASK_PACKET.md`: review range/stage, explicit debt dispositions and evidence validity fields.
- `docs/CONSUMER_ADOPTION.md`: calibration migration guidance, preserving local safeguards and explicit gate exceptions.
- `docs/REVIEW_CALIBRATION.md`: concise policy explanation and scenario checks.
- `README.md`, `VERSION`, `CHANGELOG.md`, `STANDARD_MANIFEST.txt`: prepare backward-compatible 1.3.0 release metadata; clearly distinguish working candidate from published release.
- `docs/task_packets/2026-10-02-review-scope-calibration.md`: factual task/evidence updates only.

## Dependency map and exclusions

Portable role contracts own behavior; Copilot adapters route to those contracts; the packet carries bounded review inputs; adoption guidance explains consumer reconciliation. The new policy document is reusable manifest-controlled guidance. The task record is repository-local, not consumer baseline content. Consumers retain their operating manuals, local validation commands, domain rules and history. No runtime or application behavior changes.

All other paths and all consumer repositories (including ll_pipeline) are forbidden. No dependency installs, model metadata changes, source/data access, generic validation framework, historical sprint rewrites, or automatic gate waivers.

## Acceptance criteria

1. Every blocker establishes origin, scope connection, governing requirement, concrete impact and smallest necessary correction. Unknown provenance does not automatically escalate or excuse a defect.
2. Inherited unrelated debt is advisory unless a demonstrably applicable mandatory safeguard requires blocking; assigned debt distinguishes correction, disposition-only and deferred/excluded.
3. Implementation verdict, validation limitations and finalization readiness are separate. A mandatory gate may prevent finalization without establishing a sprint regression. No consumer gate is silently weakened.
4. Severity depends on demonstrated impact, not scanner labels or exit status alone; independently evidenced material defects still block.
5. Re-review verifies prior corrections and repair delta/dependencies, reusing valid evidence. Scope/target drift or material new evidence justifies broader review; new real defects are never suppressed.
6. Review handoffs identify exact range/candidate (including uncommitted changes), scope, exclusions, requirements, debt dispositions, evidence/limitations and stage. Findings cannot authorize expanded repairs.
7. Scenario checks cover new regression, inherited unrelated lint/security debt, inherited affected dependency, assigned debt, unknown provenance, unavailable validation, mandatory gate failure, repair re-review and stale evidence.
8. Version/changelog/readme/manifest are internally consistent for a prepared 1.3.0 candidate, without claiming publication. Existing manifest content remains preserved.

## Validation and evidence

Run `scripts/Validate-Standards.ps1` and `git diff --check`; inspect changed frontmatter, relative references, manifest entries, metadata consistency and scenario outcomes. Report actual scope and limitations; structural validation does not prove runtime enforcement. Independent read-only review must inspect the actual output and evidence.

## Stop conditions

Stop for authority conflict, necessary forbidden edit, safeguard weakening, unknown model-routing capability, or broader scope. At most one bounded correction pass following independent review; further repair requires owner direction. Do not infer release authorization from implementation approval.

## Required delivery

Changed files, validation results, scenario evidence, scope adherence, independent verdict and remaining limitations. Prepare a user-facing ll_pipeline warm-up identifying exactly which candidate files to reconcile and requiring a released immutable tag/commit before updating its standards pin.

## Coder implementation evidence — 2026-10-02

- Executed as Sprint Coder under the explicit invocation; no subagents, model overrides, dependency installs, consumer access/edits or finalization operations. Existing model/tool/delegation frontmatter was preserved byte-for-byte modulo line-ending normalization used only for comparison.
- Fetch confirmed branch `feature/review-scope-calibration`; HEAD and `origin/main` both remain `1f23e1ebd010d6a824cae4fb92bc35546d3db79e`. No staged changes or candidate commit. Stage: implementation/documentation, not finalization.
- Candidate identity: uncommitted tracked diff against that baseline plus new `docs/REVIEW_CALIBRATION.md` and this pre-existing untracked task record. The twelve implementation-file SHA256 values below identify the inspected content; this factual record is excluded from its own hash list to avoid self-reference. Independent review must inspect this record too and refresh identity if content changes.
- Assigned debt: none identified in this bounded standards task. Unrelated repository/consumer debt and historical sprint rewrites remain excluded; no gate exceptions requested or granted.

| Implementation file | SHA256 |
| --- | --- |
| `.claude/agents/senior-reviewer.md` | `D0EA48AF085FDE46D2E0E9DFFE68FCBD4CD29599236E6D8C567B2A70E57BA63F` |
| `.claude/agents/sprint-architect.md` | `7B2024BE26DCDF17BF4275CA5A080BA3A0870A563E0222BBB210728FB69FD51A` |
| `.github/agents/senior-reviewer.agent.md` | `6B7694B2AEA439CDA7FC309AD06640EE7334DBA7679B56DE45B133D1F66FCC56` |
| `.github/agents/sprint-architect.agent.md` | `9DE8F07050C3E707087BAB4025622F87DB8E9EF076A915DAECB9C9E0122FA62B` |
| `.github/ORCHESTRATION_ADDENDUM.md` | `7AECC9EB3CC0D40F902466C87ECFCA1BA3C7669C72E659A0AE928708D78B45BB` |
| `templates/task_packets/TASK_PACKET.md` | `98CE487EED85ACF5AA7ECAD54916415C2466387632241560904CDA32AD5B64EE` |
| `docs/CONSUMER_ADOPTION.md` | `117A68899704A95799F616E62F97B1FD037A7CAC648763260C1D1A5458FD9623` |
| `docs/REVIEW_CALIBRATION.md` | `15A3AB5807AB9C070932160003058597DD1564EFC7B3B94AAB22CB03CE3A45D2` |
| `README.md` | `F5400C8B4361134A122EC85CE1F9CD763CD00A08BCACDD1D52DF89777903CE3F` |
| `VERSION` | `3C85C66D06C31DF0C6511AD18B7E8576FCF8E76A011C5C28BBD66C57F3ED851E` |
| `CHANGELOG.md` | `7C359BEB1B5D54864F9A6C0427CE63FD6D9DDCE55C1CA4BA545FF6BAC032EE9F` |
| `STANDARD_MANIFEST.txt` | `0C54093D83BA7B29E9F101415358E469D3D5ACB90740FC4BDD944B1B789CB0AF` |

### Validation and acceptance walkthrough

- `scripts/Validate-Standards.ps1`: passed, reporting version `1.3.0`; structural checks only.
- `git diff --check`: passed; tracked diff whitespace check only. Newly added files were additionally inspected as actual Markdown output, not assumed covered by Git's tracked diff.
- Inline read-only PowerShell inspection: all 13 changed/new paths allowlisted; four complete role/adapter frontmatter blocks unchanged; 32 previous manifest entries preserved with only `docs/REVIEW_CALIBRATION.md` added, no duplicates/missing paths; 16 relative Markdown targets/anchors valid; candidate metadata consistent and explicitly unpublished, with README retaining `1.2.1` as current release.
- Editor diagnostics: no errors reported in the twelve implementation files. Actual tracked diff and new guidance inspected by coder; not independent review.
- Acceptance 1–6: portable reviewer establishes origin/scope/requirement/impact/correction and impact-based severity; architect reconciles before repair; template records exact review inputs, debt treatments and evidence validity; conclusions and re-review are separated/bounded. Adapters only route to these contracts. Mandatory safeguards remain binding.
- Acceptance 7: all nine rows in `docs/REVIEW_CALIBRATION.md` manually walked through: new regression blocks; unrelated inherited lint/security debt advisory absent applicable blocking safeguard; inherited materially affected dependency blocks; assigned debt judged by correction/disposition-only/deferred treatment; unknown provenance investigated without automatic escalation/excuse; unavailable validation reported without fabricated regression; applicable mandatory gate failure prevents finalization; repair review checks fixes/delta and valid reused evidence without suppressing new defects; stale evidence refreshed or limited with explained expansion. Outcomes match the approved criteria under the rows' stated assumptions.
- Acceptance 8: `VERSION`, README, changelog and manifest consistently prepare backward-compatible `1.3.0`, not publication; existing manifest content preserved.
- Evidence validity: applies to the listed hashes/baseline and current PowerShell/editor environment. Refresh affected checks after relevant content, target, dependencies, configuration or environment changes. No runtime enforcement, live agent execution, consumer validation/adoption or independent verdict is proved.

### Delivery gates and limitations

- Implementation: coder reports approved scope implemented and self-checks passed; no implementation blocker discovered. This is not a reviewer verdict.
- Validation: structural/manual evidence above; policy walkthroughs are not executable behavioral tests or a full YAML parser check.
- Independent review: pending separate read-only inspection of actual diff, both new files and evidence. This invocation prohibits subagents, so no independent verdict was obtained or fabricated. At most one bounded correction pass after that review; further repair needs owner direction.
- Finalization: not ready; independent review and explicit finalization/release authorization are outstanding. No commits, pushes, PRs, merges or tags authorized or performed. Candidate remains unpublished.

### User-facing ll_pipeline warm-up (no consumer action performed)

Prepare a separate approved adoption packet after standards release. Reconcile exactly the twelve implementation files listed in the hash table against the installed immutable baseline and consumer overlay. Portable architect/reviewer contracts own behavior; adapters remain thin and retain consumer model/tool metadata. Use the task template for future handoffs without historical rewrites, install manifest-controlled calibration guidance, and use adoption/README/version/changelog/manifest as release context rather than replacing local authority. Do not adopt this repository-local task record.

Preserve ll_pipeline operating manuals, domain/data/security safeguards, local validation/gates, history and overlays. No consumer files or data were inspected in this task. Require a released immutable tag and its exact commit before updating `.agent-standards-version`; the branch, working-tree hashes and prepared `VERSION` are not a released pin. Consumer validation, independent review and PR approval remain separate requirements.

## Independent review and integrated disposition — 2026-10-02

The preceding pending statements describe coder delivery before review. A separate read-only Senior Reviewer invocation subsequently inspected all thirteen changed files against the named baseline, including both new documents, and returned implementation verdict **clean**, with no material defects and no corrections requested. Neither invocation requested a model override; actual service-side model identity was not independently observable.

The reviewer independently reran standards validation and tracked whitespace checks, verified twelve implementation hashes, all thirty-two preserved manifest entries plus the added guidance, unchanged four frontmatter blocks/model metadata, sixteen relative links/anchors, new-file whitespace and all nine manual scenarios. Review evidence applies to the implementation hashes above and the task record before this append (SHA256 `9FE81D39DD7CBB4667E0DF615FC16D653F549818B59EF3124E39C1B66557020B`). This append records the review result only; it is not itself independently reviewed policy content.

Integrated result: implementation accepted within the approved standards scope; validation remains structural/manual, not runtime enforcement, full YAML parsing or consumer compatibility. Finalization remains unauthorized and the 1.3.0 candidate unpublished. No correction pass was needed. Consumer adoption requires a separate task and released immutable provenance. No consumer edit or Git finalization was performed.