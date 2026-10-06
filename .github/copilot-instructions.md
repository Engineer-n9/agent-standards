# Copilot Instruction Wrapper

The consumer repository's operating manual and local overlay are authoritative for repository rules, domain boundaries, validation, documentation, and finalization. Do not duplicate or reinterpret them here.

Before planning, editing, testing, reviewing, or finalizing:

1. Read the local operating manual and `.agent-standards-version`.
2. Read the local overlay and active-work/state authority when present.
3. Read the applicable authoritative `.claude/agents/` role and matching `.claude/skills/*/SKILL.md` files.
4. Read relevant repository architecture and domain documents.
5. For Copilot orchestration, read `.github/ORCHESTRATION_ADDENDUM.md`.

Apply explicit authority precedence where it resolves discrepancies; report stale lower-priority text without treating it as new authority. Stop when a discrepancy remains unresolved and materially affects authorization, safety, domain correctness, scope, or acceptance. A code/requirement difference may be the defect being fixed, not an instruction conflict. Never guess external-data facts or silently expand scope.

Follow explicit state pointers and load applicable role/domain material on demand. Reuse unchanged context, refreshing on authority, scope, candidate, target, or relevant evidence drift. Checkpoints reference approved authority; they do not replace it. Portable roles own bounded execution policy; this wrapper adds no competing contract.
