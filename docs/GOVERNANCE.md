# Standards Governance

## Authority

This repository is the canonical source for reusable agent-workflow behavior. Consumer repositories pin an immutable release and retain their own domain authority.

A consumer's root operating manual, local overlay, active task/sprint packet, and domain safeguards remain authoritative for that repository. The standards kit must never overwrite them without a reviewed, explicit decision.

## Standard-controlled content

The following are shared baseline content:

- `.claude/agents/` role contracts;
- `.claude/skills/` generic workflow safeguards;
- `.github/agents/` Copilot routing adapters;
- `.github/copilot-instructions.md` and `.github/ORCHESTRATION_ADDENDUM.md` templates;
- task-packet and direct-target authorization templates.

## Local overlay

Each consumer must retain `Documentation/agent-governance/LOCAL_OVERLAY.md`, which lists every intentional divergence from the installed standard. A divergence requires a reason, owner, and approval date.

Examples of valid overlay material:

- Test-database, Windchill, or other external-system boundaries;
- repository-specific planning locations;
- actual validation commands and branch-policy facts;
- permitted model choices;
- additional role restrictions.

A consumer may strengthen a standard. It must not silently weaken one. Any weakening needs an explicit approved deviation and a replacement control.

## Drift rule

Do not manually edit standard-controlled files in a consumer repository. Propose reusable changes here first, release a new version, then upgrade consumers. If an urgent local exception is necessary, record it in the local overlay and open a standards follow-up.
