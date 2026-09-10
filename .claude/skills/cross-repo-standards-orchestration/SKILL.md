---
name: cross-repo-standards-orchestration
description: Review and evolve cross-repository agent standards. Use for standards drift, reusable-practice extraction, optional packs, standards releases, consumer upgrades, or real-run promotion review.
---

# Cross-Repository Standards Orchestration

## Evidence before promotion

Collect current standards release facts, consumer authority/overlay facts, remote Git/PR evidence, and real-run evidence. Build a matrix containing practice, evidence, benefit, risk, genericity, required local context, and classification.

Classify as core baseline, optional pack, consumer-local overlay, local-only, or deferred. Promote only behavior proven reusable and safe outside its originating domain.

## Consumer safeguards

Consumer operating manuals, data boundaries, local validation, architecture, project state, and history remain authoritative. Never silently replace or delete them. A consumer can strengthen a standard; weakening requires an explicit approved deviation and replacement control.

## Release and adoption

A standards release and a consumer adoption are separate changes. For a release, update semantic version, changelog, manifest, validation, documentation, and tag only the reviewed release commit. For adoption, create a consumer branch, pin the release, document overlay deviations, validate local references, review, and merge through its normal PR flow.

## Real-run review

Before promoting a capability proven in a real run, distinguish source-schema facts, derived results, assumptions, interpretations, and recommendations. Extract generic workflow only. Keep source-specific data, schemas, units, thresholds, population selection, calculations, and tool automation local until independently validated.
