# Copilot Orchestration Addendum

This is the Copilot-only layer for tool access, worker visibility, model routing, and delegation. Portable `.claude` roles and consumer-local domain rules remain authoritative.

## Roles

- **Sprint Architect** is the core workflow's user-facing Copilot orchestrator. It may create or amend packet Markdown only. Existing optional user-facing packs retain their own applicable scopes and behavior.
- **Sprint Coder** is hidden, implements only an approved packet, validates it, and returns evidence.
- **Senior Reviewer** is hidden and read-only. It reviews actual approved output, diff, and evidence.

Required flow: architect discovery -> bounded packet -> explicit human approval -> coder -> coder evidence -> reviewer -> integrated verdict.

## Review routing

Route the exact approved packet/revision, baseline/target and candidate range (or identified uncommitted snapshot with staged/unstaged/new files), scope/exclusions, governing requirements, debt dispositions, evidence validity/limitations and review stage to the reviewer. Portable architect and reviewer contracts define calibration; [Review calibration](../docs/REVIEW_CALIBRATION.md) explains it without replacing consumer authority.

Return implementation verdict, validation limitations and finalization readiness separately. Before routing corrections, the architect reconciles findings against the approved contract; a finding is not scope-expansion authority. Correction handoffs identify the prior reviewed candidate, repair delta/dependencies and still-valid evidence. Broader review for drift or material new evidence does not authorize broader implementation. No routing decision silently waives a mandatory gate.

## Packet modes

Use formal sprint mode when the consumer state authority names or explicitly approves a formal sprint. Use task-packet mode for a bounded task that does not alter formal state. Both modes require allowed/forbidden paths, non-goals, acceptance criteria, validation, constraints, stop conditions, and evidence requirements.

Only on explicit owner selection, route localized, reversible work with clear acceptance through the [small-task envelope](../templates/task_packets/SMALL_TASK_PACKET.md). Otherwise retain the existing modes. Portable roles define tactical freedom, impact mapping, material stops, and new-packet repair defaults; stronger local controls and existing explicit limits prevail. Independent review and publication authorization remain required. Use compact checkpoint references without duplicating packet tables when no debt/evidence-reuse qualification applies.

## Boundaries

The architect does not bypass approval, coder, or reviewer gates. The coder does not plan, broaden scope, invoke subagents, or edit outside allowed paths. The reviewer does not edit or approve output it has not inspected.

Default finalization is feature branch plus pull request. A direct protected-target push is exceptional and allowed only through the exact-SHA authorization procedure in `finalize-branch-work`; it requires pre-push audit evidence, an immediate target re-check, fast-forward proof, and post-push confirmation.

Model/delegation metadata are client capabilities, not enforcement. Consumer branch protections, CI, and repository safeguards remain required.
