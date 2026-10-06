# Small Task Packet - <bounded goal>

Use only on explicit owner selection for localized, reversible work with clear acceptance. Otherwise use the existing [task packet](TASK_PACKET.md) or formal sprint workflow. Stronger consumer requirements prevail.

- Goal and source: <one measurable outcome; request/decision>
- Canonical owner and affected consumers: <brief localized impact; use a dependency map for the architect's impact triggers>
- Allowed paths/areas: <bounded, explicit implementation and related-test areas>
- Forbidden paths/areas: <explicit boundaries>
- Non-goals: <excluded capabilities and domain changes>
- Acceptance: <checkable requirements>
- Validation: <affected checks and mandatory consumer gates; evidence requirements/limitations>
- Material stops: <authorization, safety, domain correctness, scope, or acceptance uncertainty; unstated dependencies and external-data assumptions stop>
- Administrative omissions: <not applicable with reason only when non-material; never invent authority or facts>
- Budget: one implementation repair pass and one delta review unless explicitly overridden; preserve stronger local limits. Exhaustion/severe findings escalate, not waive defects.
- Review: <revision; exact baseline/target and candidate snapshot including new files; independent reviewer evidence; separate implementation, validation, finalization conclusions>
- Debt/evidence reuse: <none identified / no reused evidence, or qualified dispositions and validity references as required by the full packet>
- Approval and lane selection: <actual owner, approved revision, selection, date/time as supplied; no invented time/timezone>
- Checkpoint: <reference to [execution checkpoint](EXECUTION_CHECKPOINT.md)>

Approval covers implementation tactics within this envelope, including related tests in the explicitly approved test area. New capabilities, domain assumptions, dependencies, or work outside it require approval. A checkpoint cannot broaden it. Independent review and separate publication authorization remain mandatory; acceptance does not authorize commit, push, PR, merge, or tag.