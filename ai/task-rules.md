# Task Rules (for AI Agents)

The workflow to follow for any non-trivial task in this repository.

## 1. Before You Start

1. Read `ai/project-context.md`.
2. Identify the affected app(s) and layer(s).
3. Read the relevant docs:
   - Requirements: `docs/02-requirements/`
   - Design: `docs/04-design/`
   - Conventions: `ai/architecture-rules.md`, `ai/coding-rules.md`, `ai/security-rules.md`
4. Explore existing code for the closest pattern before writing anything.
5. Check the Known Issues list in `ai/project-context.md`.

## 2. Planning

- For multi-step tasks, write a short plan (todos) and keep it updated.
- State assumptions explicitly.
- Ask before: changing the schema, auth/session behavior, payment flow, response envelope, or adding dependencies.
- Prefer the smallest change that fully solves the problem.

## 3. Implementation

- Follow the existing layered patterns exactly.
- Backend write endpoints: validator + `validateResult` + `requireAuth`/`authorize` + ownership check.
- Frontend: hooks → services; React Query invalidation after mutations; URL for filters.
- No comments unless non-obvious; no `console.log`; no unused code.
- Do not refactor unrelated code in the same change.

## 4. Verification (Required)

Run the checks for every app you touch:

| App | Lint | Build |
|---|---|---|
| backend | `npx eslint .` | — |
| frontend | `npm run lint` | `npm run build` |
| admin | `npm run lint` | `npm run build` |

- If tests exist, run them. If they do not, say so explicitly — do not claim tests pass.
- Manually verify the behavior when feasible (e.g. endpoint responds, UI renders).

## 5. Documentation

- Update `docs/` when a contract, schema, or workflow changes.
- Update `ai/` rules when conventions change.
- **Track everything in [`docs/09-implement/progress-tracking.md`](../docs/09-implement/progress-tracking.md):** update the item status, the §0 dashboard counts, and the §14 changelog after every completed item.
- Record decisions in the tracker's §1 Decisions Log before starting dependent work.
- If you change the DB schema, update `backend/src/db/schema.sql` and note that there are no migrations.
- Record new known issues rather than hiding them.

## 6. Git

- Only commit when explicitly asked.
- Follow Conventional Commits (`feat:`, `fix:`, `refactor:`, `docs:`, `chore:`).
- One logical change per commit; review `git status`/`git diff` before staging.
- Never commit `.env`, secrets, `node_modules`, or `dist`.
- Do not force-push shared branches or commit directly to `main`.

## 7. Boundaries

- Do not introduce new frameworks, ORMs, state managers, or UI kits.
- Do not change the response envelope or middleware order.
- Do not disable validation, auth, rate limiting, or sanitization.
- Do not touch production configuration or secrets.

## 8. Handling Known Issues

- Do not silently "fix" schema drift or missing guards as part of an unrelated task.
- If a task depends on a known issue, surface it and confirm the approach first.
- When fixing a known issue, update the docs (`database-design.md` §9, `security.md` §11) and add a regression test if tooling exists.

## 9. Definition of Done

- Change is minimal and matches conventions.
- Lint passes for touched apps; builds pass for frontend/admin changes.
- Tests added/run if tooling exists (otherwise stated).
- Docs/rules updated if needed.
- No secrets, debug logs, or dead code.
- A concise summary of what changed and how it was verified.

## 10. Communication

- Be concise and direct.
- Report blockers and assumptions.
- Do not over-explain completed work; state results and verification.
