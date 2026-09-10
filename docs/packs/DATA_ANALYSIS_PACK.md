# Optional Data Analysis Pack

## Purpose

This pack adds a user-facing Data Analyst role and generic evidence-gated data-analysis workflow to the core Agent Standards baseline. It is optional: repositories that do not analyze datasets do not need to install it.

## Included portable content

- `.claude/agents/data-analyst.md`
- `.github/agents/data-analyst.agent.md`
- `.claude/skills/generic-data-analysis/SKILL.md`
- `.github/skills/generic-data-analysis/SKILL.md`
- `templates/data-analysis/`

## Consumer requirements

Before enabling the pack, the consumer must define in its operating manual or overlay:

- data classification, source ownership, permitted movement, retention, and approved output boundaries;
- whether raw data may be copied locally or must remain an external reference;
- lifecycle locations for raw, validated, derived, run, and report artifacts;
- actual validation and review requirements;
- domain units, schemas, population rules, thresholds, and decision owners.

## Operating model

Data Analyst is user-facing for bounded exploration. Consequential analysis requires an approved analysis request and data contract. New connectors, automation, reusable pipelines, integration, production code, or persistent artifact-contract changes escalate through the core Architect -> Coder -> Reviewer workflow.

## Explicit non-contracts

This pack does not define data schemas, engineering units, test channels, population selection, interpolation defaults, corridor/tolerance meanings, statistical thresholds, file paths, or plotter automation. Those remain consumer-local until separately validated and released.

## Optional plotting tools

A consumer may use an interactive plotting tool only as a user-controlled, manually verified visualization surface. It must not be treated as a trusted automated transformation or statistical engine until an approved integration contract and evidence-backed adapter exist.
