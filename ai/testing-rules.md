# Testing Rules (for AI Agents)

## 1. Current Reality

There are **no tests** in this repository and no test tooling. Do not claim tests pass unless a test runner exists and was run.

## 2. When You Add or Change Behavior

- If a test framework exists, add or update tests for the change.
- If no framework exists, do not silently introduce one. Propose it and follow `docs/06-testing/test-strategy.md`.
- Prefer testing behavior over implementation details.

## 3. If You Introduce a Test Framework

Recommended stack (see `docs/06-testing/test-strategy.md`):

- Backend: Vitest + Supertest, against a real PostgreSQL test database provisioned from `backend/src/db/schema.sql`.
- Frontend: Vitest + React Testing Library + MSW.
- E2E: Playwright.

Rules:

- Add a `test` script to the relevant `package.json`.
- Keep tests hermetic: no production services, no shared state between tests.
- Use test-mode/sandbox credentials for Stripe, Cloudinary, and Brevo, or mock them.
- Clean up created rows.

## 4. What Must Be Tested

Priority order:

1. Authentication and session middleware.
2. Authorization (role + ownership).
3. Input validation and error mapping.
4. Stripe webhook signature and activation.
5. Enrollment, progress, and lesson completion.
6. Subscription single-active invariant.
7. Review rules (one per course, rating bounds, vote toggle).
8. Course filtering/sorting/pagination.

## 5. Test File Conventions

- `*.test.js` / `*.test.jsx`, colocated or in `__tests__/`.
- `describe` the unit; `it` states behavior (`it("returns 403 when a learner edits a course")`).
- Use factories/builders for fixtures.
- Do not assert on incidental implementation details.

## 6. Verification Commands

| App | Command |
|---|---|
| backend | `npx eslint .` (and a test command once added) |
| frontend | `npm run lint`, `npm run build` |
| admin | `npm run lint`, `npm run build` |

Always run the lint command for any app you modify. Run builds for frontend/admin changes.

## 7. Coverage Expectations

- Backend services/utils: high coverage (≥90%).
- Backend controllers/routes: meaningful coverage (≥75%).
- Critical auth/payment branches: all paths.
- Do not chase blanket coverage on presentational components.

## 8. Known Issues to Add Regression Tests For

- `lesson_contents` vs `lesson_content` table mismatch.
- Missing `lessons.access_type`.
- `quizzes.lesson_id UNIQUE`.
- `password_reset_codes.code` length.
- Option POST authorization gap.
- HTML sanitization.

## 9. Do Not

- Mark a task complete without running available checks.
- Mock the database when the bug is a SQL/schema mismatch — use a real test DB.
- Add snapshot tests that hide intent.
- Leave skipped/failing tests in the codebase.
