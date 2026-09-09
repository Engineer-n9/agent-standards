# Copilot Orchestration Addendum

This is the Copilot-only layer for tool access, worker visibility, model routing, and delegation. Portable `.claude` roles and consumer-local domain rules remain authoritative.

## Roles

- **Sprint Architect** is the only user-facing Copilot agent. It may create or amend packet Markdown only.
- **Sprint Coder** is hidden, implements only an approved packet, validates it, and returns evidence.
- **Senior Reviewer** is hidden and read-only. It reviews actual approved output, diff, and evidence.

Required flow: architect discovery -> bounded packet -> explicit human approval -> coder -> coder evidence -> reviewer -> integrated verdict.

## Packet modes

Use formal sprint mode when the consumer state authority names or explicitly approves a formal sprint. Use task-packet mode for a bounded task that does not alter formal state. Both modes require allowed/forbidden paths, non-goals, acceptance criteria, validation, constraints, stop conditions, and evidence requirements.

## Boundaries

The architect does not bypass approval, coder, or reviewer gates. The coder does not plan, broaden scope, invoke subagents, or edit outside allowed paths. The reviewer does not edit or approve output it has not inspected.

Default finalization is feature branch plus pull request. A direct protected-target push is exceptional and allowed only through the exact-SHA authorization procedure in `finalize-branch-work`; it requires pre-push audit evidence, an immediate target re-check, fast-forward proof, and post-push confirmation.

Model/delegation metadata are client capabilities, not enforcement. Consumer branch protections, CI, and repository safeguards remain required.
