# Project Context (for AI Agents)

Condensed, authoritative context. Read this before making changes.

> **Backend refactor (structure complete):** the backend now uses the module-based structure (`app/`, `config/`, `db/`, `common/`, `modules/`). See [`docs/08-refactoring/`](../docs/08-refactoring/) and status in [`docs/09-implement/progress-tracking.md`](../docs/09-implement/progress-tracking.md).

## What This Is

A PERN-stack e-learning platform monorepo with three apps sharing one Express/PostgreSQL API:

| App | Path | Stack |
|---|---|---|
| Backend API | `backend/` | Node 22 (ESM), Express 5, `pg` (raw SQL), express-session, Stripe, Cloudinary, Brevo |
| Learner frontend | `frontend/` | React 19, Vite 7, React Router 7, TanStack Query 5, Tailwind 4, RHF+Zod |
| Admin dashboard | `admin/` | React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix |

## Core Facts

- Auth: cookie session (`express-session` + `connect-pg-simple`), 30-day rolling, `sameSite: "none"` in prod.
- API base: `/api/v1`. Response envelope: `{ success, statusCode, message, data }` (+ `pagination` on lists).
- DB: PostgreSQL, UUID PKs via `pgcrypto`. Schema: `backend/src/db/schema.sql` (22 tables, 9 enums).
- No ORM, no migrations, no seeds, no tests, no CI.
- Content hierarchy: `course → module → chapter → lesson → lesson_content / quizzes → quiz_options`.
- Roles: `LEARNER`, `INSTRUCTOR`, `ADMIN`. Ownership checked per resource via repository `getInstructor()` joins.
- Payments: Stripe Checkout + webhook at `/api/v1/stripe-webhook` (mounted before body parsers for raw-body signature verification).

## Where Things Live

| Need | Location |
|---|---|
| Migrated modules | `backend/src/modules/` — **all 10 migrated** (auth, users, categories, courses, content, learning, reviews, certificates, subscriptions, admin) |
| Route definitions | `backend/src/routes/` (admin in `routes/admin/`) — legacy, migrating to modules |
| Business logic | `backend/src/controllers/` — legacy, migrating to module services |
| SQL | `backend/src/repositories/` — legacy, migrating to module repositories |
| Cross-cutting services | `backend/src/common/services/` |
| Validation | `backend/src/validators/` |
| Middleware | `backend/src/common/middleware/` |
| App wiring | `backend/src/app/app.js` |
| DB schema | `backend/src/db/schema.sql` |
| Env config | `backend/src/config/Env.js` |
| Query builder | `backend/src/common/query/AdvaceQuery.js` |
| Learner routes | `frontend/src/App.jsx` |
| Learner data hooks | `frontend/src/hooks/queries`, `hooks/mutations` |
| Learner API client | `frontend/src/api/client.js` |
| Admin routes | `admin/src/App.jsx` |
| Admin data hooks | `admin/src/hooks/` |
| Admin services | `admin/src/services/*Api.js` |

## Known Issues (do not "fix" silently; confirm first)

1. `LessonContentRepository.js` queries `lesson_contents` but the table is `lesson_content`.
2. Repositories/controllers reference `lessons.access_type`, which does not exist in the schema.
3. `quizzes.lesson_id` is `UNIQUE` though the app models many questions per lesson.
4. `password_reset_codes.code` is `VARCHAR(6)` but a 64-char SHA-256 hash is stored.
5. `loginLimiter` is defined but not applied to login.
6. `POST /api/v1/options` lacks an `authorize` guard; option PATCH/DELETE lack validators.
7. `modules.icon_name` is destructured but not persisted.
8. `course_reviews.helpful_count` is not trigger-maintained.

Full detail: `docs/04-design/database-design.md` §9 and `docs/04-design/security.md` §11.

## Commands

| App | Dev | Lint | Build |
|---|---|---|---|
| backend | `npm run dev` | `npx eslint .` | — |
| frontend | `npm run dev` | `npm run lint` | `npm run build` |
| admin | `npm run dev` | `npm run lint` | `npm run build` |

No test command exists yet.

## Non-Negotiables

- Match existing patterns; do not introduce new frameworks, ORMs, state libraries, or UI kits.
- Parameterized SQL only.
- Keep the response envelope.
- Validate all writes and enforce authorization + ownership.
- Do not commit secrets or `.env` files.
- Run lint on the apps you touch.

See `ai/architecture-rules.md`, `ai/coding-rules.md`, `ai/security-rules.md`, `ai/testing-rules.md`, and `ai/task-rules.md`.
