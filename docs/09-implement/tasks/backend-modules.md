# Backend Module Migration

Per-module migration checklist. See [`backend-plan.md`](../../08-refactoring/backend-plan.md) §10 and [`backend/01-structure.md`](../../08-refactoring/backend/01-structure.md).

> **Status:** 🟡 In progress. All 10 modules are scaffolded and verified; the
> cross-module service refactor and remaining ownership/validator gaps below are
> still open.

| Module | Scaffolded | Controller thin | Service extracted | Repo isolated | Validators | Ownership | Verified | Status |
|---|---|---|---|---|---|---|---|---|
| common/ (shared infra) | ✅ | — | — | — | — | — | ✅ | ✅ |
| auth | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| users | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| categories | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| courses | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| content | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| learning | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| reviews | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| certificates | ✅ | ✅ | ✅ | ✅ | — | — | ✅ | ✅ |
| subscriptions | ✅ | ✅ | ✅ | ✅ | — | — | ✅ | ✅ |
| admin | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ | ✅ |

## Foundation Snapshot

| Deliverable | Status | Location |
|---|---|---|
| `app/` layer (app, middleware, routes) | ✅ | `backend/src/app/` |
| `config/` (Env, database + `withTransaction`, cloudinary, stripe) | ✅ | `backend/src/config/` |
| `db/` (schema baseline + migrations) | ✅ | `backend/src/db/` |
| `common/` (errors, http, middleware, auth, query, constants, helper, services, validation, logger) | ✅ | `backend/src/common/` |
| `common/http/response.js` (`sendSuccess`) | ✅ | new |
| `common/auth/ownership.js` (`assertOwnership`) | ✅ | new |
| `common/logger.js` (structured logger) | ✅ | new |
| `src/server.js` entry point | ✅ | moved from `backend/server.js` |
| `modules/` (all 10 feature modules) | ✅ | `backend/src/modules/` |
| Legacy `controllers/`, `repositories/`, `routes/`, `validators/` | ✅ | removed (migrated) |

## Remaining Work (in progress)

Tracked from the `TODO(refactor)` notes in the module services and the gaps in the table above.

| # | Task | Modules | Status | Notes |
|---|---|---|---|---|
| BM-1 | Route cross-module calls through the other module's **service**, not its repository | admin, certificates, users, content, learning, courses, reviews, subscriptions | 🟡 | `TODO(refactor)` in 8 services |
| BM-2 | Move nested routers into their owning modules | courses (`routes.js`) | 🟡 | `TODO(refactor)` in `courses/routes.js` |
| BM-3 | Confirm/complete ownership checks | auth, users, categories, learning, reviews, certificates, subscriptions | ⬜ | Table shows `—`; mark N/A where not applicable |
| BM-4 | Confirm/complete validators | certificates, subscriptions, admin | ⬜ | Table shows `—`; add where a write endpoint lacks one |
| BM-5 | Replace hardcoded admin temp password with an invite flow | admin | ⬜ | Audit P0-9 / decision D-09 |

> Definition of done for BM-1/BM-2: no `TODO(refactor)` comments remain and no module imports another module's repository.
