# API Refactor

API contract, validation, pagination, and ownership standardization. See
[`backend/03-api.md`](../../08-refactoring/backend/03-api.md) for the plan and
[`../decisions.md`](../decisions.md) for D-10…D-13.

> **Status:** ✅ Done (2026-09-15). AP-1…AP-6 complete. Residual: admin subscriptions
> UI pagination controls are deferred (lists bounded at 100; stats/dropdowns preserved).

**Legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

## AP-1 — Response / status standardization

| # | Task | Status | Evidence / files |
|---|---|---|---|
| AP-1.1 | Fix nested pagination on `GET /courses/in-progress` and `/courses/completed` (send top-level `pagination`) | ✅ | `modules/courses/controller.js` |
| AP-1.2 | `PATCH /progresses` returns `200` (not `201`/"created") | ✅ | `modules/learning/controller.js` |
| AP-1.3 | Fix messages + consistent delete payloads ("deleted"; `getModule` singular; delete returns `null`) | ✅ | `content/controller.js`, `courses/controller.js` |
| AP-1.4 | Confirm all controllers use `sendSuccess`; document webhook/errorHandler exceptions | ✅ | verified statically; plan §2.5 |

## AP-2 — Validation completeness

| # | Task | Status | Evidence / files |
|---|---|---|---|
| AP-2.1 | Add `:id` UUID param validator + `validateResult` to all 13 DELETE endpoints | ✅ | categories, courses, objectives, modules, chapters, lessons, contents, questions, options, admin users, admin plans/user-subs/payments route files |
| AP-2.2 | Add param validator to `POST /courses/:courseId/certificates` (claim) | ✅ | `modules/certificates/validation.js` (new) + `routes.js` |
| AP-2.3 | Confirm existing write validators (options/enroll/progress/completion/payment/admin) | ✅ | implemented in Phase 1 (P0-10) |

## AP-3 — Query / pagination standardization

| # | Task | Status | Evidence / files |
|---|---|---|---|
| AP-3.1 | Cap `limit` and reject `Infinity` in `AdvancedQuery.paginate()`; guard object/plain-key filter values | ✅ | `common/query/pagination.js` (new), `common/query/AdvaceQuery.js` |
| AP-3.2 | Fix admin users `parseInt` `NaN`/negative page + cap `limit` | ✅ | `admin/users.service.js`, `users/repository.js` |
| AP-3.3 | Add pagination envelope to `GET /admin/users` + update admin consumer in same change | ✅ | `admin/users.controller.js`, `admin/src/pages/UsersPage.jsx`, `SubscriptionsPage.jsx` |
| AP-3.4 | Add pagination to admin plans/user-subscriptions/payments + update admin hooks/pages | ✅ | backend envelope + `limit=100` hooks; UI pagination controls deferred (bounded at 100) |
| AP-3.5 | Add pagination to `GET /certificates/mine` + update learner consumer | ✅ | `certificates/repository.js|service.js|controller.js`, `frontend/src/hooks/queries/useCourses.js` |
| AP-3.6 | Remove or whitelist dead `limitFields()` (SQL-injection surface) | ✅ | removed from `common/query/AdvaceQuery.js` (was never called) |
| AP-3.7 | Regression-check course alias filters (`rating[gte]`, `duration`) under the Express 5 query parser | ✅ | bracketed keys stay flat strings; object values now skipped instead of 500 |

## AP-4 — Authorization / ownership

| # | Task | Status | Evidence / files |
|---|---|---|---|
| AP-4.1 | Gate `GET /lessons/:id/questions` to authenticated enrolled learners; keep `is_correct`/`explanation` | ✅ | `content/question.routes.js` (+requireAuth), `content/service.js` (enrollment/owner/admin check), `lesson.repository.js` (`getCourse`) (D-11) |
| AP-4.2 | Confirm ownership on `/courses/:id/dashboard-details` and `/courses/:id/learn`; add where missing | ✅ | dashboard-details now asserts instructor/admin ownership (`courses/service.js`); `/learn` stays public by design (curriculum preview, no lesson content) |
| AP-4.3 | Confirm/complete ownership for auth, users, categories, learning, reviews, certificates, subscriptions (mark N/A) | ✅ | all session-scoped or public-by-design; enrollment checks confirmed on completion + review |

## AP-5 — Data exposure / null semantics

| # | Task | Status | Evidence / files |
|---|---|---|---|
| AP-5.1 | Strip `password` in `auth/service.js` `getUserById` (defense in depth) | ✅ | `modules/auth/service.js` |
| AP-5.2 | Confirm no hashes in `GET /users/dashboard-data`; bound the instructors list | ✅ | `users/repository.js` `getInstructors` (no password column, `LIMIT 5`) |
| AP-5.3 | Document `200` + `data:null` absent semantics; verify no double-wrap | ✅ | plan §2.7 (D-13); controllers pass `x \|\| null` |
| AP-5.4 | Document guest `/users/me` `200` + `data:null` as intentional | ✅ | plan §2.7 (D-10) |

## AP-6 — Compatibility verification + docs

| # | Task | Status | Evidence / files |
|---|---|---|---|
| AP-6.1 | Update frontend/admin consumers in lockstep for AP-3.3/3.4/3.5/4.1 | ✅ | done with AP-3/AP-4 (`UsersPage`, `SubscriptionsPage`, subscription hooks, `useMyCertificates`) |
| AP-6.2 | Backend `npx eslint .` + frontend/admin `lint`/`build`; smoke-test changed endpoints | ✅ | backend 0 errors + import OK; admin/frontend builds pass (lint errors are pre-existing in untouched files) |
| AP-6.3 | Sync `docs/04-design/api-design.md` with the standardized contract | ✅ | pagination shape/cap, null semantics, DELETE validators, quiz gate, admin pagination |

## Definition of Done

No `TODO(refactor)` API notes remain; every write endpoint has a validator +
`validateResult` (or a documented exception); no nested pagination, `{users,total}`,
`status`, or `query` echo; pagination params are safe; protected resources enforce
`requireAuth` + `authorize` + ownership; consumers verified.
