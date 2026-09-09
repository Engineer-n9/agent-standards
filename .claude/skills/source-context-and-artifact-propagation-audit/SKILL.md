---
name: source-context-and-artifact-propagation-audit
description: Audit source, configuration, cache, session, and persisted-artifact changes for incomplete propagation and incompatible reuse.
---

# Source Context and Artifact Propagation Audit

Use before approving or implementing a change to source selection, import/export identity, modality, variant, condition, unit normalization, domain configuration, caches, session state, or persisted artifacts.

## Required inspection

Inspect configuration/defaults, state ownership/reset, source discovery, in-memory cache keys, persisted artifact keys and legacy behavior, GUI/CLI/API consumers, affected tests, error behavior, and regression coverage.

## Dependency matrix

Produce a matrix:

| Surface | Current behavior | Required context | Failure risk | Planned treatment | Validation |
|---|---|---|---|---|---|

Name intentionally excluded surfaces and explain why exclusion is safe.

## Namespace and legacy policy

State complete namespace fields relevant to the consumer, typically source/data identity, variant, condition, schema/export version, unit normalization, and configuration signature. State whether legacy artifacts migrate, ignore, constrain, or invalidate. Missing context must fail clearly; never silently fall back to an incompatible source or configuration.

Stop for packet amendment if source defaults remain hard-coded outside scope, incompatible reuse is possible, state ownership is ambiguous, legacy policy is absent, or required tests are unavailable.
