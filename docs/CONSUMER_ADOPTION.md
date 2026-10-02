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

The reviewed 1.3.0 changes are merged and release finalization is user-authorized, but tag publication remains pending. Publication is completed only when the immutable remote `v1.3.0` tag exists on the reviewed release merge commit. Do not advance a consumer standards pin from `VERSION` or a moving branch: verify that tag and record the exact commit it resolves to in `.agent-standards-version`. Adoption requires a separate approved consumer packet and review.

Reconcile these 1.3.0 surfaces against the installed release and local overlay:

- `.claude/agents/senior-reviewer.md` and `.claude/agents/sprint-architect.md` — authoritative portable review behavior and handoffs;
- `.github/agents/senior-reviewer.agent.md`, `.github/agents/sprint-architect.agent.md` and `.github/ORCHESTRATION_ADDENDUM.md` — thin routing alignment, preserving local model/tool metadata;
- `templates/task_packets/TASK_PACKET.md` — additive review boundary, debt disposition and evidence-validity fields for future packets;
- `docs/REVIEW_CALIBRATION.md` and `STANDARD_MANIFEST.txt` — reusable guidance and its controlled inventory;
- `docs/CONSUMER_ADOPTION.md`, `README.md`, `VERSION` and `CHANGELOG.md` — adoption/release context, not replacements for the consumer operating manual or pin.

Existing packets remain valid; reconcile missing review inputs explicitly in a bounded handoff rather than rewriting historical sprint records. Preserve consumer operating manuals, domain/data/security controls, validation commands, history, model restrictions, CI/PR protections and stronger local gates. A failed mandatory gate may prevent finalization even when implementation is accepted; this calibration is not permission to weaken it. Any permitted gate exception must name the governing authority, authorized approver, reason, replacement control and bounded scope/duration in the packet/overlay. Without that explicit authority the gate remains binding.

Check the [calibration scenarios](REVIEW_CALIBRATION.md#scenario-checks) against local safeguards during adoption. Copy no repository-local task records into the baseline, and do not overwrite local authority blindly.
