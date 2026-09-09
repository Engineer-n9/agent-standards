---
name: finalize-branch-work
description: Finalize reviewed work through the consumer repository's normal feature-branch and pull-request workflow; use the exact-SHA direct-target exception only when explicitly authorized.
---

# Finalize Branch Work

## Default flow

1. Read the consumer operating manual and local overlay.
2. Fetch `origin`; compare the working branch, local target, and `origin/<default branch>`.
3. Run validation relevant to the actual diff.
4. Commit only intended changes, push the non-target feature branch, create or update the PR, and obtain required review.
5. Return branch, commit, PR, validation, and review evidence.

## Exceptional direct-target authorization

Never use this flow unless a named human coordinator explicitly requests a direct push to `main` or `master` (or the consumer's declared protected target). All pre-push steps must occur before the remote target moves.

1. Fetch `origin` and record exact target SHA.
2. Commit intended work and record exact source SHA.
3. Validate that exact source SHA.
4. Obtain a clean Senior Reviewer verdict with no P0/P1 for exact `target-SHA..source-SHA`.
5. Create the authorization record from the standard template on append-only `audit/direct-push-authorizations`; commit and push it before the target moves.
6. Obtain explicit human approval naming the authorization record path, audit commit, target SHA, and source SHA.
7. Immediately before push, fetch/query the remote target again. Confirm it still equals the authorized target SHA and prove source is a fast-forward descendant. Otherwise stop: review and authorization are stale.
8. Push only authorized source SHA to authorized target. Immediately confirm remote target equals source SHA.
9. Append post-push confirmation to the same authorization record as a second audit-branch commit and push that audit branch. Do not add an audit commit to the target branch.
10. Report both audit commits, reviewer verdict, human authorization, pre-push check, fast-forward proof, and post-push SHA.

A changed target/source SHA, reviewed range, validation result, or authorization invalidates the entire flow.
