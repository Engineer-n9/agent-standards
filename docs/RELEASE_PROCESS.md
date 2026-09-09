# Release Process

## Semantic versioning

- **MAJOR**: incompatible workflow or file-layout change requiring consumer migration.
- **MINOR**: backward-compatible safeguard, role, template, or capability addition.
- **PATCH**: correction that does not change the expected consumer integration shape.

## Release steps

1. Develop the reusable change in a feature branch of this repository.
2. Validate standards structure with `scripts/Validate-Standards.ps1`.
3. Update `VERSION` and `CHANGELOG.md`.
4. Obtain review through the standard architect -> coder -> reviewer process or an explicitly documented maintenance equivalent.
5. Merge through a pull request.
6. Tag the resulting commit as `v<version>`.
7. Upgrade each consumer through its own feature branch and PR; do not modify consumers directly from the standards release branch.

## Consumer upgrade rule

A consumer stays pinned to a released tag, not a moving branch. Its `.agent-standards-version` records both semantic version and source commit. The upgrade PR includes the prior and new version, changed standard files, overlay changes, validation evidence, and any deferred local adaptation.
