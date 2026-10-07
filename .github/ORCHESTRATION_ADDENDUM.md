# Copilot Orchestration Addendum

This is the Copilot-only layer for tool access, worker visibility, model routing, and delegation. Portable `.claude` roles and consumer-local domain rules remain authoritative.

## Roles

- **Sprint Architect** is the core workflow's user-facing Copilot orchestrator. It may create or amend packet Markdown only. Existing optional user-facing packs retain their own applicable scopes and behavior.
- **Sprint Coder** is hidden, implements only an approved packet, validates it, and returns evidence.
- **Senior Reviewer** is hidden and read-only. It reviews actual approved output, diff, and evidence.

Required flow: architect discovery -> bounded packet -> explicit human approval -> coder -> coder evidence -> reviewer -> integrated verdict.

## Capability-aware delegation (canonical policy)

There are no platform-wide "standard Copilot agents" supplied by this kit. The normal Copilot route is a repository-defined workspace custom agent from `.github/agents/`, invoked by its exact configured identifier. The custom-agent adapter directs the worker to read the authoritative portable role Markdown and the consumer's local instructions from that repository. This preserves one bounded workspace-based authority load instead of replaying role bodies in every handoff.

Prefer those repository-defined custom workers using the exact identifiers `sprint-coder` and `senior-reviewer`, matching their declared names and the Architect's allowlist. Display headings are not identifiers. Existing optional packs retain their own routing and behavior.

If the required repository custom agent is unavailable, a generic child session may load the exact Copilot adapter and portable role files only when that mechanism is actually available and permitted by the runtime, the approved packet does not require custom-agent execution, and all required controls can be maintained. This is role-guided fallback, not a custom-agent invocation. Permitted fallback within an already approved packet needs no repeated approval merely for the mechanism. Markdown cannot override a custom Architect's actual `agents` allowlist: if it excludes generic invocation, that invocation is unavailable from that session. Do not broaden the allowlist, disguise a generic session as a named custom agent, or claim a bypass.

Before invocation, distinguish available mechanisms from required guarantees. Generic file loading does not apply adapter frontmatter, model selection, tool restrictions or visibility flags. Disclose instruction-only restrictions versus runtime-enforced tool restrictions; if the packet requires a tool-level guarantee unavailable generically, stop rather than replace it with a prompt. If every permitted child mechanism is unavailable, or a required control cannot be maintained, report a capability stop and the missing mechanism/control. Do not add registered-only requirements merely because a model is specified.

Adapter model defaults are ordinary preferences; an array is first-available, not an exact-model guarantee. Explicit approved model requirements are separate from custom-agent availability and must be passed explicitly to a generic invocation through supported model selection. A custom-agent-not-found error is not evidence that a model is unavailable. Never silently substitute outside approved model policy; when a required model is unavailable or its selection cannot be verified to the required standard, stop and report it. Disclose unverified selection otherwise; reading a `.md` file is never model-selection evidence.

Every generic handoff carries exact adapter/portable role paths, approved packet and revision, baseline/candidate identity, scope/exclusions, validation, execution/recovery/correction budget, evidence requirements/limitations, model requirement (or ordinary preference with verification status), and prohibitions on further delegation and publication. Reference unchanged manuals, packet bodies, and role bodies by exact path; supply only changed scope, candidate, evidence, and budget details. Preserve approval, role separation and independent review. See [Delegation routing guidance](../docs/DELEGATION_ROUTING.md) for a compact handoff and policy walkthroughs; it does not add runtime capabilities.

## Review routing

Route the exact approved packet/revision, baseline/target and candidate range (or identified uncommitted snapshot with staged/unstaged/new files), scope/exclusions, governing requirements, debt dispositions, evidence validity/limitations and review stage to the reviewer. Portable architect and reviewer contracts define calibration; [Review calibration](../docs/REVIEW_CALIBRATION.md) explains it without replacing consumer authority.

Return implementation verdict, validation limitations and finalization readiness separately. Before routing corrections, the architect reconciles findings against the approved contract; a finding is not scope-expansion authority. Correction handoffs identify the prior reviewed candidate, repair delta/dependencies and still-valid evidence. A missing or incomplete coder report permits one evidence-recovery handoff for the existing candidate only, not a replacement implementation loop or renewed discovery. After a reviewed correction, review is limited to the repair delta and affected dependencies unless authority, scope, candidate, target, or material evidence drifts. On budget exhaustion, persist the compact checkpoint and request owner direction; do not silently replace workers or reset allowance. Broader review for drift or material new evidence does not authorize broader implementation. No routing decision silently waives a mandatory gate.

## Packet modes

Use formal sprint mode when the consumer state authority names or explicitly approves a formal sprint. Use task-packet mode for a bounded task that does not alter formal state. Both modes require allowed/forbidden paths, non-goals, acceptance criteria, validation, constraints, stop conditions, and evidence requirements.

Only on explicit owner selection, route localized, reversible work with clear acceptance through the [small-task envelope](../templates/task_packets/SMALL_TASK_PACKET.md). Otherwise retain the existing modes. Portable roles define tactical freedom, impact mapping, material stops, and new-packet repair defaults; stronger local controls and existing explicit limits prevail. Independent review and publication authorization remain required. Use compact checkpoint references without duplicating packet tables when no debt/evidence-reuse qualification applies.

## Boundaries

The architect does not bypass approval, coder, or reviewer gates. The coder does not plan, broaden scope, invoke subagents, or edit outside allowed paths. The reviewer does not edit or approve output it has not inspected.

Default finalization is feature branch plus pull request. A direct protected-target push is exceptional and allowed only through the exact-SHA authorization procedure in `finalize-branch-work`; it requires pre-push audit evidence, an immediate target re-check, fast-forward proof, and post-push confirmation.

Model/delegation metadata depend on client support; declarations alone do not prove runtime enforcement. Consumer branch protections, CI, and repository safeguards remain required.
