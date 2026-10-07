# Delegation Routing

The [Copilot addendum](../.github/ORCHESTRATION_ADDENDUM.md#capability-aware-delegation-canonical-policy) owns routing policy. Portable roles own execution/review contracts; consumer authority and approved packet restrictions prevail. This guidance neither registers agents nor supplies runtime infrastructure. Claude Code's human-mediated handoffs are unchanged.

## Separate the mechanisms

- **Registration:** use exact core worker identifiers `sprint-coder` and `senior-reviewer`. Matching files/frontmatter are structural prerequisites, not proof of runtime discovery.
- **Generic role guidance:** load `.github/agents/<worker>.agent.md` and `.claude/agents/<worker>.md` in a separate child session only where invocation is available/permitted and required controls survive. File contents guide behavior; loading them does not apply frontmatter. A registered Architect's runtime allowlist may prevent this fallback entirely.
- **Model selection:** defaults are preferences; model arrays are first-available. An explicit packet model requirement must be selected through supported invocation settings, independently of registration. Missing registration does not establish model unavailability. Never silently substitute; report selection evidence or its absence. Stop if an explicit requirement cannot be met/verified to the required standard.
- **Tool enforcement:** a prompt prohibition is instruction-only unless the runtime restricts tools. Disclose the distinction; do not use generic fallback when a mandatory tool-level restriction cannot be enforced. Declared visibility/delegation flags likewise do not become runtime controls through file loading.

## Compact generic handoff

Supply these values explicitly, not just a role label:

1. Worker identifier and exact adapter/portable role paths above; governing consumer manual, overlay and canonical addendum.
2. Approved packet path/revision and approval evidence; baseline/target SHA and exact candidate range or identified uncommitted snapshot (including staged/unstaged/new files).
3. Goal, allowed/forbidden paths, exclusions and acceptance requirements; implementation versus read-only review stage.
4. Validation commands, execution/correction budget, required evidence and known limitations; reviewer receives actual coder output and evidence.
5. Explicit model requirement and supported selection setting/evidence, or ordinary preference and disclosed verification status; registration status and actual tool restrictions versus instruction-only prohibitions.
6. No planning/scope expansion, further delegation, commit/push/PR/merge/tag or publication. Return bounded evidence to the Architect; preserve independent review and governing safeguards.

This handoff is not a tool configuration or permission grant. Do not invoke until required controls are established. Review calibration and correction handoffs remain in the portable contracts and [review guidance](REVIEW_CALIBRATION.md).

## Scenario checks (policy walkthroughs, not runtime tests)

| Situation | Required routing/outcome |
| --- | --- |
| Named worker exists | Prefer its exact registered identifier; pass the approved bounded handoff and verify required capabilities. |
| Registration missing; generic permitted | Use available generic child with exact role files and complete handoff, disclose role-guided mechanism; no renewed approval solely for permitted fallback. |
| Required model unavailable/unverifiable | Report model-specific capability stop; no silent substitution or inference from agent-not-found. Ordinary preferences may use approved first-available policy, with unverified selection disclosed. |
| Required tool restriction missing | Stop; instruction-only restrictions cannot replace required runtime tool guarantees. |
| Runtime allowlist forbids generic fallback | Do not attempt a Markdown bypass or broaden the allowlist; use an available permitted registered worker or report the capability stop. |
| No child mechanism | Report unavailable delegation; do not implement as Architect or invent a session/runtime. |
| Packet explicitly registered-only | Generic execution is excluded even if otherwise available; use required registered worker or stop. |
| Generic handoff complete | Check all six handoff items, actual invocation permission and required controls; loading frontmatter still proves neither model selection nor tool enforcement. |

`Validate-Standards.ps1` checks bounded core names/allowlist consistency; fixtures exercise positive/negative structural cases. These checks establish no runtime discovery, model availability, tool enforcement, consumer execution or token savings.
