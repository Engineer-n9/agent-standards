# Bounded Execution (1.4.0 candidate)

Guidance for the authoritative [Architect](../.claude/agents/sprint-architect.md), [Coder](../.claude/agents/sprint-coder.md), and [Reviewer](../.claude/agents/senior-reviewer.md), not a competing approval contract. Consumer authority and stronger safeguards prevail. Benefits are hypotheses, not measured token savings or cross-repository performance proof.

## Boundaries

- Stop for unresolved material authorization, safety, domain correctness, scope, or acceptance uncertainty. Record only non-material administrative omissions as `not applicable` with reasons. Never invent approval, requirements, or external-data facts. Use established precedence, not an invented hierarchy; code/requirement differences may be the approved defect.
- Impact, not file count, triggers dependency mapping: shared contracts, persisted formats, domain semantics, external-data access, or multiple independently owned surfaces. Localized work names owner/consumers briefly; all scope still needs approval.
- The [small-task lane](../templates/task_packets/SMALL_TASK_PACKET.md) is explicitly opt-in for localized reversible work. Approval bounds tactical freedom and related tests to explicit areas. New capabilities/assumptions or work outside the envelope require approval. Without selection, retain existing workflows.
- New packets without explicit limits default to one repair pass plus one delta review. Existing approvals and explicit limits remain valid; stronger consumer controls prevail. Exhaustion and severe findings escalate, never grant extra repair authority or waive defects.
- Use a compact [checkpoint](../templates/task_packets/EXECUTION_CHECKPOINT.md) with approval/candidate, completed/next, evidence/limitations, blockers, remaining budget. Follow state pointers, reuse unchanged context, load relevant material on demand, and refresh on authority/scope/candidate/target or relevant evidence drift. Markdown is not an agent runtime.
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

## Structural validation coverage

`scripts/Validate-Standards.ps1` checks required inventory, manifest file existence/duplicates and bounded paths, bounded top-level frontmatter markers/keys and required fields, supported inline relative Markdown file targets, release-version consistency, and core adapter visibility/delegation metadata. `scripts/Test-Validate-Standards.ps1` exercises positive and negative disposable fixtures under the OS temp directory, not consumers.

README's current `Candidate version` or `Release version`, the first version heading in CHANGELOG (`Candidate`, `Released`, or `Release finalization`), and the manifest's `portable candidate version` or `portable release version` must agree with VERSION and with each other. Historical changelog entries do not set current state. Both coherent metadata states are supported; mixed states and version mismatches fail. A released metadata label is structural state, not verified publication or adoption authorization; the current 1.4.0 files remain candidate until separately authorized publication with actual evidence.

This is not a complete YAML parser, semantic Markdown/anchor validator, reference-link/code-path resolver, client capability enforcer, remote-tag verifier, or application/runtime test suite. External URLs and anchor-only links are not fetched; arbitrary YAML, multiline values, and unsupported link forms are outside claimed coverage. Publication facts require separate remote evidence; metadata alone is not publication.