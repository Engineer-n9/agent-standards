# Review Calibration

Reusable guidance for the authoritative [Senior Reviewer](../.claude/agents/senior-reviewer.md) and [Sprint Architect](../.claude/agents/sprint-architect.md) contracts. Copilot adapters route to those contracts; consumer operating manuals, approved packets and mandatory local safeguards retain authority. This guidance adds no automatic gate exception or repair permission.

## Evidence and scope

Review the exact approved baseline/target and candidate range, including staged/unstaged and newly added files for an uncommitted snapshot. Record scope, exclusions, requirements, assigned debt dispositions, evidence validity/limitations and stage in the [packet](../templates/task_packets/TASK_PACKET.md) or bounded handoff. Identify the actual inspected output, not a nonexistent candidate commit or a summary alone.

Classify provenance as introduced regression, inherited affected dependency, inherited unrelated debt, assigned debt, or unknown. Every blocker needs origin evidence (including uncertainty), scope connection, governing requirement, concrete impact and the smallest necessary correction. Unknown origin is neither automatic escalation nor an excuse. Investigate proportionately; scanner labels and exit status are signals, not sufficient impact evidence. Independently evidenced material defects still block.

Assigned debt has an explicit treatment: **correction** requires the approved bounded fix; **disposition-only** requires the stated documented outcome, not cleanup; **deferred/excluded** records reason, owner and follow-up where applicable, without waiving mandatory safeguards. Unrelated inherited debt is advisory unless a demonstrably applicable mandatory safeguard requires blocking. Any out-of-scope repair stops for owner approval; findings alone never expand implementation authority.

## Three conclusions, not one gate

- **Implementation:** clean within inspected scope, changes required for evidenced P0/P1 blockers, or advisory for P2-only findings. Acceptance is not merge authorization.
- **Validation:** report passed, failed, unavailable and stale checks, their applicability, and what remains unproved. Missing evidence is not proof of correctness or regression.
- **Finalization:** ready only with applicable mandatory gates and required authorization satisfied; otherwise not ready or not assessed with the outstanding requirement. A gate failure need not establish a sprint regression. Independent review and branch/PR/exact-SHA safeguards remain mandatory where applicable.

On correction review, verify prior fixes and the repair delta/affected dependencies against the prior candidate. Reuse evidence only with justified source/target, relevant file/dependency, command/configuration and environment validity. Refresh stale evidence or report the limitation. Explain broader review for scope/target drift or material new evidence; never suppress new real defects or silently authorize their repair. Respect the approved correction-pass limit.

## Scenario checks

These are policy walkthroughs, not runtime-enforcement tests. Each assumes the stated evidence; consumer authority decides actual applicable gates.

| Scenario / evidence | Implementation conclusion | Validation / finalization and correction boundary |
| --- | --- | --- |
| New regression: baseline comparison proves the candidate breaks an approved requirement with material impact. | Changes required; cite origin, requirement, impact and bounded correction. | Validate the fix; finalization waits for applicable gates and authorization. |
| Inherited unrelated lint/security debt: unchanged, no affected dependency or applicable blocking safeguard established. | Advisory; do not demand unrelated cleanup from scanner label alone. | Report debt and check limits; no invented gate. An applicable mandatory security safeguard changes the gate outcome below. |
| Inherited affected dependency: unchanged dependency demonstrably makes the approved output materially incorrect or unsafe. | Changes required despite inherited origin; identify the dependency and impact. | Repair only within approved scope; otherwise seek amendment, not silent expansion. |
| Assigned debt: packet requires correction, disposition-only, or explicitly deferred/excluded treatment. | Judge the specified outcome; missing required material correction blocks, documented disposition can satisfy disposition-only. | Record deferred owner/reason/follow-up; no mandatory-gate waiver or automatic cleanup. |
| Unknown provenance: origin cannot yet be established. | Investigate and label uncertainty; neither automatic block nor excuse. Independently evidenced material defect blocks. | Missing origin evidence remains a limitation; route necessary out-of-scope repair for approval. |
| Unavailable validation: required environment/tool is unavailable, no regression independently shown. | Do not manufacture a regression; state acceptance limits or unresolved evidence. | Report unavailable check; if mandatory, finalization is not ready until satisfied or explicitly authorized exception under local authority. |
| Mandatory gate failure: inherited issue fails a demonstrably applicable consumer gate, without evidence of candidate regression. | Do not relabel as introduced regression; record the requirement and impact separately. | Finalization not ready. Reconcile authorized debt treatment or explicit local exception; never silently waive the gate. |
| Repair re-review: prior finding corrected; delta and affected dependencies unchanged otherwise. | Verify corrections and delta, not unrelated repository debt. | Reuse justified valid evidence; new material defects still reported, with repair authority reconciled. |
| Stale evidence: target, relevant dependency, configuration or environment changed since prior check. | Do not approve on stale proof; assess actual delta and material new evidence. | Refresh affected checks or report limitation; explain any wider review and keep repairs approval-bounded. |

## Adoption boundary

See [Consumer adoption](CONSUMER_ADOPTION.md#review-calibration-migration-130-candidate). Reconcile stronger local safeguards rather than replace them; use a released immutable tag/commit before changing a consumer pin. Working-tree release metadata is not publication evidence.

## Bounded execution compatibility

See [bounded execution scenarios](BOUNDED_EXECUTION.md#policy-scenarios). New-packet repair defaults never reinterpret historical approvals or explicit limits; stronger consumer safeguards prevail. Small-task mode needs explicit selection and retains independent review/publication boundaries. Concise references may replace duplicated tables only when no debt or evidence-reuse qualification applies. Input drift invalidates relevant evidence just as target/configuration/environment drift does. Budget exhaustion or severe findings escalate, not suppress defects or expand repair authority.