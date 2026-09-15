# Backend Module Migration

Per-module migration checklist. See [`backend-plan.md`](../../08-refactoring/backend-plan.md) §10 and [`backend/01-structure.md`](../../08-refactoring/backend/01-structure.md).

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

> Follow-up (not yet done): route cross-module calls through services instead of repositories; see the `TODO(refactor)` notes in the module services.
