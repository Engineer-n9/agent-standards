# Bounded Execution (1.4.2 candidate)

Guidance for the authoritative [Architect](../.claude/agents/sprint-architect.md), [Coder](../.claude/agents/sprint-coder.md), and [Reviewer](../.claude/agents/senior-reviewer.md), not a competing approval contract. Consumer authority and stronger safeguards prevail. Benefits are hypotheses, not measured token savings or cross-repository performance proof.

## Boundaries

- Stop for unresolved material authorization, safety, domain correctness, scope, or acceptance uncertainty. Record only non-material administrative omissions as `not applicable` with reasons. Never invent approval, requirements, or external-data facts. Use established precedence, not an invented hierarchy; code/requirement differences may be the approved defect.
- Impact, not file count, triggers dependency mapping: shared contracts, persisted formats, domain semantics, external-data access, or multiple independently owned surfaces. Localized work names owner/consumers briefly; all scope still needs approval.
- The [small-task lane](../templates/task_packets/SMALL_TASK_PACKET.md) is explicitly opt-in for localized reversible work. Approval bounds tactical freedom and related tests to explicit areas. New capabilities/assumptions or work outside the envelope require approval. Without selection, retain existing workflows.
- New packets without explicit limits default to one implementation pass, one named validation pass, one independent exact-candidate review, and at most one owner-authorized correction plus one delta-and-affected-dependency review. Explicit packet limits and stronger consumer controls prevail. This default never supplies approval for a correction.
- A missing or incomplete coder evidence envelope permits one bounded evidence-recovery pass only: recover the required evidence for the existing candidate and report its limitations. It does not authorize implementation, rediscovery, a replacement worker, a reset budget, or another repair loop.
- After a reviewed correction, review the repair delta and affected dependencies by default. Refresh the full relevant review only when authority, scope, candidate, target, or material evidence drifts. A broader refresh does not authorize broader implementation.
- Use repository-defined workspace custom agents as the normal Copilot worker route. Their adapters direct workers to read the portable role and local authorities in place; handoffs carry only packet/candidate/evidence/budget deltas. Generic role-guided sessions are a permitted fallback only where the packet and runtime allow them; Markdown is not an agent runtime.
- Use a compact [checkpoint](../templates/task_packets/EXECUTION_CHECKPOINT.md) with approval/candidate, completed/next, evidence/limitations, blockers, and remaining budget. Follow state pointers, reuse unchanged context, load relevant material on demand, and refresh on authority/scope/candidate/target or relevant evidence drift. When an allowance is exhausted, persist the checkpoint and request owner direction; never silently reset a budget or replace a worker.
- Affected development checks are fast feedback, not replacements for mandatory consumer pre-commit gates. Reuse evidence only where policy permits and relevant candidate/configuration/environment/dependencies/inputs remain valid. Exact-candidate independent review precedes publication; repairs receive delta/affected-dependency review. Acceptance never authorizes commit, push, PR, merge, or tag. Exact-SHA protected-target controls are unchanged.

## Policy scenarios

These are requirement walkthroughs, not runtime-enforcement tests. Review [calibration scenarios](REVIEW_CALIBRATION.md#scenario-checks) too.

| ID | Given | Required outcome |
| --- | --- | --- |
| B1 | Five localized documentation files; no impact trigger | Brief owner/consumer statement; no file-count escalation; scope approval still required. |
| B2 | One file changes a persisted format or external-data access | Dependency map and applicable evidence safeguards before approval. |
| B3 | Administrative time field unknown; authorization/acceptance established | Record date/reason without invented timezone; continue. |
| B4 | Unknown units, absent approval, forbidden path, or unresolved material authority | Stop; administrative treatment cannot excuse it. |
| B5 | Code differs from approved requirements; established authority resolves stale text | Fix only the approved defect; report stale text, not automatic conflict escalation. |
| B6 | Small task but no explicit lane selection | Existing packet workflow; no inferred approval. |
| B7 | Selected lane; related test inside explicit test area / new capability outside | Test tactics allowed / new capability stops for approval. |
| B8 | New packet lacks limit / existing explicit two-pass limit / stronger zero-pass control | One repair plus delta review / preserve two / preserve zero; no retroactive default. |
| B9 | Repair budget exhausted or severe new finding | Report/escalate; no extra repair authority and no suppressed defect. |
| B10 | Candidate, target, configuration, environment, dependency, or input drifts | Refresh affected context/evidence; unchanged evidence reused only with justified governing permission. |
| B11 | Development checks pass but mandatory gate fails or publication not authorized | Report separately; no commit-gate substitution or publication. |
| B12 | Optional user-facing pack installed; checkpoint persists | Pack behavior/metadata unchanged; checkpoint supplies no runtime, approval, or expanded scope. |
| B13 | Coder envelope is missing or incomplete | One evidence-recovery pass for the existing candidate only; no implementation retry, rediscovery loop, replacement worker, or budget reset. |
| B14 | Reviewed correction has no authority/scope/candidate/target/material-evidence drift | Review the repair delta and affected dependencies; retain still-valid evidence with its justification. |
| B15 | Allowance is exhausted | Persist a compact checkpoint and request owner direction; do not silently spawn a replacement worker or reset allowance. |
| B16 | Repository custom worker is available | Invoke its configured identifier; its adapter reads portable/local Markdown in place and the handoff supplies only the bounded delta. |

## Structural validation coverage

`scripts/Validate-Standards.ps1` checks required inventory, manifest file existence/duplicates and bounded paths, bounded top-level frontmatter markers/keys and required fields, supported inline relative Markdown file targets, release-version consistency, and core adapter visibility/delegation metadata. `scripts/Test-Validate-Standards.ps1` exercises positive and negative disposable fixtures under the OS temp directory, not consumers.

README's current `Candidate version` or `Release version`, the first version heading in CHANGELOG (`Candidate`, `Released`, or `Release finalization`), and the manifest's `portable candidate version` or `portable release version` must agree with VERSION and with each other. Historical changelog entries do not set current state. Both coherent metadata states are supported; mixed states and version mismatches fail. A released metadata label is structural state, not verified publication or adoption authorization; the current 1.4.0 files remain candidate until separately authorized publication with actual evidence.

This is not a complete YAML parser, semantic Markdown/anchor validator, reference-link/code-path resolver, client capability enforcer, remote-tag verifier, or application/runtime test suite. External URLs and anchor-only links are not fetched; arbitrary YAML, multiline values, and unsupported link forms are outside claimed coverage. Publication facts require separate remote evidence; metadata alone is not publication.