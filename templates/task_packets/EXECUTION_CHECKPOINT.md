# Execution Checkpoint

Update in place; reference the packet, do not duplicate it. This is execution state, not approval authority or durable architectural memory. Detailed logs stay separate. Markdown does not create a continuously running agent.

- Authority: <approved packet/revision; approver and actual approval date/time reference>
- Candidate: <exact baseline/target and candidate commit/range, or working-tree snapshot identity including staged/unstaged/new files; no invented commit>
- Completed / next action: <bounded status and next authorized step>
- Evidence: <commands/artifacts/results; relevance, reuse justification, limitations>
- Material blockers: <none / precise unresolved requirement>
- Remaining budget: <implementation, validation, evidence-recovery, correction, and delta-review allowances; explicit local limit takes precedence>

Follow explicit state pointers and load relevant role/domain material on demand. Refresh context and affected evidence when authority, scope, candidate, target, configuration, environment, dependencies, or inputs change. Reuse only where governing policy permits and relevant conditions remain valid. If an allowance is exhausted, persist this checkpoint and request owner direction; do not reset budget, start a replacement worker, or treat evidence recovery as implementation authority. A missing or incomplete coder envelope permits at most one evidence-recovery pass for the same candidate. Checkpoint updates cannot expand scope, waive gates, or authorize publication.