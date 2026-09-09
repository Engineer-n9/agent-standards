# Direct Push Authorization — <target branch> / <source short SHA>

- Audit branch: `audit/direct-push-authorizations`
- Pre-push audit-record commit SHA: `<fill after committing and pushing this record>`
- Target branch: `<main or master>`
- Fetched target SHA before review: `<full SHA>`
- Authorized source SHA: `<full SHA>`
- Reviewed diff range: `<target SHA>..<source SHA>`
- Senior-reviewer verdict: `clean` — no P0 or P1 findings
- Reviewer evidence: `<artifact or reference>`
- Validation summary: `<commands and outcomes>`
- Human coordinator: `<named person>`
- Explicit authorization: `<statement authorizing this exact source SHA onto this exact target SHA>`
- Authorization timestamp: `<ISO 8601 timestamp with timezone>`
- Immediate pre-push target verification: `<remote target still equals authorized target SHA>`
- Fast-forward proof: `<source is descendant of authorized target SHA>`
- Pre-push verification timestamp: `<ISO 8601 timestamp with timezone>`
- Planned post-push verification: `fetch/query remote target and confirm it resolves to the authorized source SHA`
- Post-push confirmed target SHA: `<fill after push>`
- Post-push confirmation timestamp: `<fill after push>`
- Post-push audit-record commit SHA: `<fill after appending confirmation on audit branch>`

If any protected SHA, reviewed range, validation, authorization, immediate pre-push verification, or fast-forward proof changes, invalidate this record and repeat the complete authorization flow.
