# AGENTS.md

This is the conventional agent entry point. The full guide lives in [`agent.md`](./agent.md); the authoritative rules live in [`ai/`](./ai/).

> **Backend refactor (structure complete):** the backend now follows the module-based structure. Plans: [`docs/08-refactoring/`](./docs/08-refactoring/); status: [`docs/09-implement/progress-tracking.md`](./docs/09-implement/progress-tracking.md).

## Start Here

1. [`agent.md`](./agent.md) — agent operating guide (project map, commands, workflow).
2. [`ai/project-context.md`](./ai/project-context.md) — condensed context + known issues.
3. [`spec.md`](./spec.md) — consolidated project specification.
4. [`ai/architecture-rules.md`](./ai/architecture-rules.md), [`ai/coding-rules.md`](./ai/coding-rules.md), [`ai/security-rules.md`](./ai/security-rules.md), [`ai/testing-rules.md`](./ai/testing-rules.md), [`ai/task-rules.md`](./ai/task-rules.md).

## Project At A Glance

PERN-stack e-learning platform with three apps sharing one Express/PostgreSQL API:

| App | Path | Stack |
|---|---|---|
| Backend API | `backend/` | Node 22 (ESM), Express 5, `pg` (raw SQL), express-session, Stripe, Cloudinary, Brevo |
| Learner frontend | `frontend/` | React 19, Vite 7, React Router 7, TanStack Query 5, Tailwind 4 |
| Admin dashboard | `admin/` | React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix |

## Non-Negotiables

- Backend layering: `routes → validators → middlewares → controllers → services/repositories → pg pool`. Never skip layers.
- Parameterized SQL only; no ORM.
- Response envelope: `{ success, statusCode, message, data }` (+ `pagination` for lists).
- Write endpoints: validator + `validateResult` + auth/authorize + ownership check.
- Frontend: no `fetch` in components; hooks → services; invalidate query keys after mutations.
- Never commit `.env` or secrets.
- Preserve middleware order; Stripe webhook stays before `express.json()`.
- No new frameworks, ORMs, state managers, or UI kits.
- Run lint for every app you touch.

## Commands

| App | Dev | Lint | Build |
|---|---|---|---|
| backend | `npm run dev` | `npx eslint .` | — |
| frontend | `npm run dev` | `npm run lint` | `npm run build` |
| admin | `npm run dev` | `npm run lint` | `npm run build` |

No test command exists in any app.

## Known Issues — Do Not Silently "Fix"

See [`agent.md`](./agent.md) §6 and [`docs/04-design/database-design.md`](./docs/04-design/database-design.md) §9.
