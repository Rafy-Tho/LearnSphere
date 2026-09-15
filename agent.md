# Agent Guide

Entry point for AI coding agents working in this repository. Read this first, then load the detailed rules in `ai/`.

> **Backend refactor (structure complete):** the backend now follows the module-based structure. Target: [`docs/08-refactoring/backend/01-structure.md`](./docs/08-refactoring/backend/01-structure.md); tasks: [`docs/09-implement/tasks/`](./docs/09-implement/tasks/); status: [`docs/09-implement/progress-tracking.md`](./docs/09-implement/progress-tracking.md).

## 1. What This Project Is

**Learning Online Platform (PERN)** — a full-stack e-learning platform with three apps sharing one Express/PostgreSQL API:

| App | Path | Stack |
|---|---|---|
| Backend API | `backend/` | Node 22 (ESM), Express 5, `pg` (raw SQL), express-session, Stripe, Cloudinary, Brevo |
| Learner frontend | `frontend/` | React 19, Vite 7, React Router 7, TanStack Query 5, Tailwind 4, RHF + Zod |
| Admin dashboard | `admin/` | React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix |

Full context: `ai/project-context.md` and `spec.md`.

## 2. Read Order

1. `ai/project-context.md` — condensed context and known issues.
2. `spec.md` — consolidated specification.
3. `ai/architecture-rules.md` — boundaries you must preserve.
4. `ai/coding-rules.md` — style and patterns.
5. `ai/security-rules.md` — mandatory security rules.
6. `ai/testing-rules.md` — testing expectations.
7. `ai/task-rules.md` — the workflow to follow.
8. `docs/09-implement/tasks/` — task definitions + status; `docs/09-implement/progress-tracking.md` — rollup dashboard + changelog. Update both as you work.

Deep reference lives in `docs/`:

| Topic | File |
|---|---|
| Requirements | `docs/02-requirements/requirements.md` |
| Business rules | `docs/02-requirements/business-rules.md` |
| Acceptance criteria | `docs/02-requirements/acceptance-criteria.md` |
| Architecture | `docs/04-design/architecture.md` |
| Database | `docs/04-design/database-design.md` |
| API | `docs/04-design/api-design.md` |
| Security | `docs/04-design/security.md` |
| Setup | `docs/05-development/environment-setup.md` |
| Diagrams | `docs/diagrams/` |
| Refactor audits & plans | `docs/08-refactoring/` |
| Backend target structure | `docs/08-refactoring/backend/01-structure.md` |
| DB migrations | `docs/08-refactoring/backend/02-migration-plan.md` |
| **Tasks** | `docs/09-implement/tasks/` |
| **Implementation progress** | `docs/09-implement/progress-tracking.md` |

## 3. Commands

| App | Dev | Lint | Build |
|---|---|---|---|
| backend | `npm run dev` | `npx eslint .` | — |
| frontend | `npm run dev` | `npm run lint` | `npm run build` |
| admin | `npm run dev` | `npm run lint` | `npm run build` |

There is **no test command** in any app. Do not claim tests pass.

## 4. Core Rules (summary)

- Backend layering: `routes → validators → middlewares → controllers → services/repositories → pg pool`. Never skip layers.
- All SQL lives in repositories and must be parameterized (`$1`, `$2`). No ORM.
- Responses use the envelope `{ success, statusCode, message, data }` (+ `pagination` for lists).
- Write endpoints require a validator + `validateResult` + `requireAuth`/`authorize` + ownership check.
- Frontend: components never call `fetch`; go through hooks → services. Invalidate query keys after mutations.
- Never commit `.env` or secrets. Server keys stay server-side; only `VITE_*` reaches the client.
- Preserve middleware order; the Stripe webhook must stay before `express.json()`.
- Do not introduce new frameworks, ORMs, state managers, or UI kits.
- Run lint for every app you touch.

## 5. Workflow

1. Explore the closest existing pattern before writing code.
2. Plan multi-step work with a todo list.
3. Implement the smallest change that fully solves the problem.
4. Verify: lint (all touched apps), build (frontends), tests if tooling exists.
5. Update `docs/` and `ai/` when contracts or conventions change.
6. Update the task file's status and `docs/09-implement/progress-tracking.md` (dashboard counts + changelog) after every completed item.
7. Commit only when explicitly asked, using Conventional Commits.

## 6. Known Issues — Do Not Silently "Fix"

Surface these and confirm before changing them:

1. `LessonContentRepository` queries `lesson_contents`; the table is `lesson_content`.
2. Code references `lessons.access_type`; the column does not exist.
3. `quizzes.lesson_id` is `UNIQUE` though the app models many questions per lesson.
4. `password_reset_codes.code` is `VARCHAR(6)` but stores a 64-char hash.
5. `loginLimiter` is defined but unused.
6. `POST /api/v1/options` lacks an `authorize` guard; option PATCH/DELETE lack validators.
7. No tests, no migrations, no CI.

Details: `docs/04-design/database-design.md` §9 and `docs/04-design/security.md` §11.

## 7. Escalate Before Doing

- Changing the database schema.
- Changing auth/session behavior or the payment flow.
- Changing the response envelope or middleware order.
- Adding a dependency, framework, ORM, state manager, or UI kit.
- Force-pushing or committing directly to `main`.
