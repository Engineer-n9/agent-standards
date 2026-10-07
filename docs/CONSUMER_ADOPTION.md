# Consumer Adoption

## First installation

Create a feature branch in the consumer repository. Do not overwrite existing agent files blindly.

1. Copy the standard files required by the repository's chosen integration.
2. Create `.agent-standards-version` with:

   `ai-hub-agent-standards: 1.0.0`

   `source-commit: <standards release commit>`

3. Create `Documentation/agent-governance/LOCAL_OVERLAY.md` from `templates/LOCAL_OVERLAY.md`.
4. Map generic tokens such as `<PLANNING_ROOT>`, `<OPERATING_MANUAL>`, and `<REPO_VALIDATION>` to local authoritative documents and commands.
5. Preserve existing domain safeguards as local skills or instructions. Do not put domain rules into the shared kit.
6. Validate frontmatter, links, file paths, and repository-specific commands.
7. Review and merge through the consumer repository's normal PR process.

## Upgrade

1. Fetch the standards repository and select a released tag.
2. Compare the installed standard version with the target version.
3. Apply changed files on a consumer feature branch.
4. Update `.agent-standards-version`, the overlay deviation table, and any local adapter mappings.
5. Run local validation and have the consumer reviewer inspect the diff.
6. Merge through a PR.

Never use a direct target-branch push for a normal standards rollout.

<a id="review-calibration-migration-130-candidate"></a>

## Review calibration migration (1.3.0)

The immutable remote `v1.3.0` tag is verified published on 2026-10-06: annotated object `3cd0131ae61743d5842278246de0d14c2fb08c8a` resolves to `d2fd121b1c7314ad14a9ad521a6ce3fe7df27f45`. Do not advance a consumer standards pin from `VERSION` or a moving branch: verify the released tag and record its exact resolved commit in `.agent-standards-version`. Adoption requires a separate approved consumer packet and review.

Reconcile these 1.3.0 surfaces against the installed release and local overlay:

- `.claude/agents/senior-reviewer.md` and `.claude/agents/sprint-architect.md` — authoritative portable review behavior and handoffs;
- `.github/agents/senior-reviewer.agent.md`, `.github/agents/sprint-architect.agent.md` and `.github/ORCHESTRATION_ADDENDUM.md` — thin routing alignment, preserving local model/tool metadata;
- `templates/task_packets/TASK_PACKET.md` — additive review boundary, debt disposition and evidence-validity fields for future packets;
- `docs/REVIEW_CALIBRATION.md` and `STANDARD_MANIFEST.txt` — reusable guidance and its controlled inventory;
- `docs/CONSUMER_ADOPTION.md`, `README.md`, `VERSION` and `CHANGELOG.md` — adoption/release context, not replacements for the consumer operating manual or pin.

Existing packets remain valid; reconcile missing review inputs explicitly in a bounded handoff rather than rewriting historical sprint records. Preserve consumer operating manuals, domain/data/security controls, validation commands, history, model restrictions, CI/PR protections and stronger local gates. A failed mandatory gate may prevent finalization even when implementation is accepted; this calibration is not permission to weaken it. Any permitted gate exception must name the governing authority, authorized approver, reason, replacement control and bounded scope/duration in the packet/overlay. Without that explicit authority the gate remains binding.

Check the [calibration scenarios](REVIEW_CALIBRATION.md#scenario-checks) against local safeguards during adoption. Copy no repository-local task records into the baseline, and do not overwrite local authority blindly.

## Bounded execution migration (1.4.0)

The remote `v1.4.0` annotated tag object `0124ee1bd4aeb04ea91931c5ec9ea034b7ba49d3` was verified published on 2026-10-07 resolving to `3f09b67f79281afc6263bf94e207593e3760da15`. Its immutable tagged bytes retain pre-publication prose; this subsequent documentation-branch correction does not change the tag or pinned release payload. Do not adopt a moving branch or change pins from metadata alone: verify the released tag and record its exact resolved commit. Use a separately approved consumer adoption packet to reconcile the changed portable roles/skills, thin routing, task templates, [bounded guidance](BOUNDED_EXECUTION.md), calibration and manifest.

The impact trigger replaces the shared three-file count by default; stronger local mapping requirements remain. Material stops retain authorization, safety, domain correctness, scope and acceptance safeguards. Small-task mode is opt-in only; without explicit owner selection retain existing workflow. The one-repair-plus-delta-review default applies only to new packets without explicit limits; preserve existing approvals, historical packets, local limits and stronger gates. Compact checkpoints reference existing authority and exact evidence, not new authority or runtime execution. Consumer validation commands, finalization sequencing, optional pack behavior, model/tool metadata and protected-target controls are unchanged. Walk through the policy scenarios before adoption; no consumer work is authorized by the standards release packet.
