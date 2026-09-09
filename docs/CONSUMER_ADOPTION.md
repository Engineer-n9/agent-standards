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
