# Claude Code Instruction Wrapper

The consumer repository's operating manual and local overlay are authoritative for repository rules, domain boundaries, validation, documentation, and finalization. Do not duplicate or reinterpret them here.

Before planning, editing, testing, reviewing, analyzing, or finalizing:

1. Read the local operating manual and `.agent-standards-version`.
2. Read the local overlay and active-work/state authority when present.
3. Read the applicable authoritative `.claude/agents/` role and matching `.claude/skills/*/SKILL.md` files.
4. Read relevant repository architecture and domain documents.
5. Follow the canonical reusable workflow authority in `CLAUDE.md`.

Use the existing role definitions and skills for their stated scopes:

- `agents/sprint-architect.md`
- `agents/sprint-coder.md`
- `agents/senior-reviewer.md`
- `agents/data-analyst.md`
- `agents/cross-repo-std-orchestrator.md`

The required delivery flow remains architect discovery -> bounded packet -> explicit human approval -> coder -> coder evidence -> reviewer -> integrated verdict. Use the Data Analyst and Cross-Repo Standards Orchestrator roles only for their applicable existing skill scopes; do not bypass the approved-packet workflow for implementation work.

If the local authority, packet, current code, external-system evidence, or this adapter differs, apply explicit authority precedence where it resolves the discrepancy and report resolved discrepancies or stale lower-priority text. Stop and report unresolved conflicts materially affecting authorization, safety, scope, domain correctness, or acceptance. A code/requirement difference may be the approved defect, not automatically an instruction conflict. Never invent facts, approval, or authority precedence, guess, or silently expand scope.

## Runtime note

The active model and provider may vary by client or routing configuration.
Role behavior, approval gates, validation requirements, and safety controls
must remain valid regardless of the active model.
