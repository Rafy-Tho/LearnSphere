# Project Context (for AI Agents)

Condensed, authoritative context. Read this before making changes.

> **Progress:** the backend is module-based and hardened; the learner frontend and admin refactors are complete. See [`docs/progress/`](../docs/progress/).

## What This Is

A PERN-stack e-learning platform monorepo with three apps sharing one Express/PostgreSQL API:

| App | Path | Stack |
|---|---|---|
| Backend API | `backend/` | Node 22 (ESM), Express 5, `pg` (raw SQL), express-session, Stripe, Cloudinary, Hostinger Mail API, `openid-client` (Google OAuth) |
| Learner frontend | `frontend/` | React 19, Vite 7, React Router 7, TanStack Query 5, Tailwind 4, RHF+Zod |
| Admin dashboard | `admin/` | React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix |

## Core Facts

- Auth: cookie session (`express-session` + `connect-pg-simple`), 30-day rolling + 24h idle timeout, `sameSite: "none"` in prod.
- Auth methods: email/password (bcrypt) + email verification, and Google OAuth (`GET /api/v1/auth/google[/callback]`, authorization-code + OIDC via `openid-client`). Provider links in `user_auth_providers`; `users.password` is nullable for provider-only accounts.
- API base: `/api/v1`. Response envelope: `{ success, statusCode, message, data }` (+ `pagination` on lists).
- DB: PostgreSQL, UUID PKs via `pgcrypto`. Schema is defined entirely by the CREATE-only migrations in `backend/src/db/migrations/` (38 tables, 15 enums; runner `npm run db:migrate`). There is no `schema.sql`.
- No ORM, no seeds, no tests, no CI.
- Content hierarchy: `course → module → chapter → lesson → lesson_contents / quizzes → quiz_options`; plus server-graded quiz attempts, saved courses, and an activity + XP feed.
- Roles: `LEARNER`, `INSTRUCTOR`, `ADMIN`. Ownership checked per resource via repository `getInstructor()` joins.
- Instructor workspace: `backend/src/modules/instructor/` (`/api/v1/instructor/*`) + role-gated area of the `admin/` SPA. Course lifecycle is `DRAFT → PENDING → PUBLISHED/REJECTED` (admin approves); instructor earnings are estimated from a configurable revenue-share (`platform_settings`).
- Payments: prepaid billing via `checkout_orders` (30-min expiry) → Stripe Checkout; webhook at `/api/v1/webhooks/stripe` (mounted before body parsers for raw-body signature verification) with event idempotency (`stripe_webhook_events`) and a reconciliation script (`npm run billing:reconcile`). Coupons (`coupon_reservations`) and refund requests (`REFUND_WINDOW_DAYS`, default 14) supported.

## Where Things Live

| Need | Location |
|---|---|
| Modules | `backend/src/modules/` — auth, users, categories, courses, content, learning, quiz, reviews, saved-courses, certificates, subscriptions, admin, instructor |
| Route definitions | `backend/src/modules/<module>/routes.js`; mounted in `backend/src/app/routes.js` |
| Business logic | `backend/src/modules/<module>/service.js` |
| SQL | `backend/src/modules/<module>/*.repository.js` |
| Cross-cutting services | `backend/src/common/services/` |
| Validation | `backend/src/modules/<module>/validation.js` + builders in `backend/src/common/validation.js` |
| Middleware | `backend/src/common/middleware/` |
| App wiring | `backend/src/app/app.js` |
| DB schema + migrations | `backend/src/db/migrations/` (source of truth) |
| Env config | `backend/src/config/environment.js` |
| Query builder | `backend/src/common/query/advanced-query.js` |
| Learner routes | `frontend/src/app/router.jsx` |
| Learner data hooks | `frontend/src/features/*/hooks`, `frontend/src/hooks/` |
| Learner API client | `frontend/src/lib/apiClient.js`, keys in `frontend/src/lib/queryKeys.js` |
| Admin routes | `admin/src/app/router.jsx` |
| Admin data hooks | `admin/src/features/*/hooks`, `admin/src/hooks/` |
| Admin API client | `admin/src/lib/apiClient.js`, feature services in `admin/src/features/*/services/` |
| Instructor workspace | backend `backend/src/modules/instructor/`; admin `admin/src/features/instructor/` + `admin/src/features/payouts/`; guard `admin/src/app/guards/RequireRole.jsx` |

## Known Issues & Residuals (do not "fix" silently; confirm first)

1. No automated tests and no CI.
2. Live DB only: legacy `lesson_content*` child object names remain alongside the canonical ones (harmless).
3. Backend cross-module calls still import other modules' repositories (BM-1).

Schema drift and the former auth/validation gaps are resolved. The schema is now a CREATE-only migration baseline (`0001`–`0011`). Full detail: `docs/04-design/database-design.md` §9 and `docs/04-design/security.md` §11.

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
