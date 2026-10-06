# Task Packet — <short goal>

## Task source

<user request, issue, or approved decision>

## Goal

<one bounded, measurable outcome>

## Allowed paths

- `<path>`

## Forbidden paths

- `<path>` — <reason>

## Non-goals

- <explicit exclusion>

## Constraints and evidence

- <architecture, data, external-system, destructive-operation, or security constraint>
- <required evidence and sanitization boundary>

## Acceptance criteria

- <checkable condition>

## Validation

- `<command or manual verification>`

## Review boundary and stage

- Approved packet revision: `<identifier/date>`
- Stage: `<planning / implementation-documentation / correction / finalization>`
- Baseline and target: `<exact refs and SHAs; fetched remote state where applicable>`
- Candidate: `<exact commit range, or uncommitted working-tree snapshot identifier>`
- Actual review files: `<tracked staged/unstaged and newly added files; evidence snapshot location>`
- Scope and exclusions: `<allowed paths and affected dependencies; explicit excluded surfaces>`
- Governing requirements: `<acceptance criteria and applicable mandatory local safeguards/gates>`
- Correction review, if applicable: `<prior reviewed candidate, findings to verify, repair delta/dependencies, permitted pass limit>`

## Debt dispositions

| Item / origin evidence | Scope connection / governing requirement | Treatment | Required outcome / evidence | Owner / follow-up / approval |
| --- | --- | --- | --- | --- |
| `<assigned or inherited item; unknown if not established>` | `<affected dependency, unrelated, or applicable safeguard>` | `<correction / disposition-only / deferred-excluded>` | `<bounded fix, documented disposition, or explicit exclusion and reason>` | `<owner, follow-up where applicable, approval>` |

Use `none identified` when applicable. Disposition-only does not authorize code cleanup; deferred/excluded debt never waives a mandatory safeguard. Any gate exception needs explicit authorized approval, reason and replacement control under consumer authority, or the gate remains binding.

## Evidence validity and limitations

| Evidence / result | Candidate / relevant files and dependencies | Command / configuration / environment | Validity or refresh trigger | Limitations |
| --- | --- | --- | --- | --- |
| `<artifact/check; passed, failed, unavailable or stale>` | `<exact reviewed snapshot/range>` | `<how and where obtained>` | `<what remains valid; drift requiring refresh>` | `<unproved behavior or missing check>` |

For reused evidence, identify its original candidate and justify validity for the current delta. Do not infer correctness or regression from an unavailable check.

## Stop conditions

- <material uncertainty affecting authorization, safety, domain correctness, scope, or acceptance; required amendment or human direction>
- Non-material administrative omissions: record `not applicable` with reason; never invent approval, requirements, or external-data facts.

## Execution budget and checkpoint

- New-packet default without an explicit limit: one implementation repair pass and one delta review. Explicit packet limits and stronger consumer controls prevail; existing approvals are not reinterpreted.
- Exhaustion or severe findings: report unresolved material findings and escalate; no automatic extra repair authority or gate waiver.
- Update the [execution checkpoint](EXECUTION_CHECKPOINT.md) in place; reference this approved packet rather than duplicate it. Detailed logs remain separate.
- Run affected development checks; mandatory consumer pre-commit gates still apply. Reuse evidence only where policy permits and relevant candidate, configuration, environment, dependencies, and inputs remain valid.
- Independent review of the exact candidate precedes publication; acceptance never authorizes commit, push, PR, merge, or tag.

## Required implementation evidence

- Files changed, validation outcome, scope adherence, and blockers.

## Required review evidence

- Exact baseline/target, candidate snapshot/range and actual files/diff reviewed, including new files; review stage, scope/exclusions and evidence inspected/reused with validity and limitations.
- Findings with origin evidence, scope connection, governing requirement, demonstrated impact and smallest necessary correction; severity based on impact, not scanner labels or exit status alone.
- Separate implementation verdict, validation status/limitations and finalization readiness; no silent mandatory-gate waiver. See [Review calibration](../../docs/REVIEW_CALIBRATION.md).

## Approval

- Approved by: `<name>`
- Approval date/time: `<as actually supplied; record date only if exact time/timezone is unknown>`
