---
name: evidence-gated-planning
description: Plan work that depends on unverified external-system, source-data, schema, unit, context, or behavior facts before changing production contracts.
---

# Evidence-Gated Planning

Use this workflow before production changes that rely on an unverified external system, export, source root, modality, schema, unit, test identity, configuration, or behavioral assumption.

## Fact classification

Label each material fact as exactly one of: confirmed, observed-but-unverified, inferred, or unknown. Do not turn anything except confirmed facts into canonical parser behavior, source routing, defaults, cache keys, persisted-output contracts, or domain logic.

## Required phases

1. State the invariant and what will not change.
2. Define isolated probe: allowed throwaway/manual files, forbidden production paths, read-only external-system boundary, sanitization, evidence fields, and stop conditions.
3. Obtain explicit human review of the probe evidence.
4. Define integration only from confirmed facts.
5. When source/context/artifacts change, require propagation audit and namespace/legacy policy.

Never commit raw external data, credentials, proprietary exports, operator-local settings, or unsanitized artifacts. Candidate assumptions never enter durable architecture memory.
