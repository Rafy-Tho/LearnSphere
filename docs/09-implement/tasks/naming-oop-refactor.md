# Backend Naming & OOP Refactor

Standardize backend file/variable naming and convert Controllers, Services, and
Repositories to practical OOP classes with constructor-based dependency injection.
Behavior, route surface, DB schema, and response envelope stay unchanged.

> **Status:** ✅ Done (2026-09-15). NO-1…NO-5 complete. Backend `npx eslint .` → 0 errors;
> app import smoke + 77 route handlers resolve; no old filenames remain.

**Legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

## NO-1 — Shared infrastructure file renames + typos

| # | Task | Status | Evidence / files |
|---|---|---|---|
| NO-1.1 | Rename common/config files to kebab-case and update all imports | ✅ | `common/**`, `config/environment.js` |
| NO-1.2 | Fix filename typos `AdvaceQuery` → `advanced-query`, `createRadomCode` → `create-random-code` | ✅ | importers in courses/reviews/auth |

## NO-2 — Common layer class/naming cleanups

| # | Task | Status | Evidence / files |
|---|---|---|---|
| NO-2.1 | `sendSuccess(res, payload, options)` (envelope key stays `data`) | ✅ | `common/http/response.js` |
| NO-2.2 | `asyncHandler(handler)`, `advanced-query` pool DI + descriptive locals | ✅ | `common/http/async-handler.js`, `common/query/advanced-query.js` |
| NO-2.3 | `EmailService` named singleton export; boolean/locals in `error-handler`; `enumValidator` | ✅ | `common/services/email-service.js`, `common/middleware/error-handler.js`, `common/validation.js` |

## NO-3 — Module OOP conversion + naming

| # | Module | Status | Notes |
|---|---|---|---|
| NO-3.1 | auth | ✅ | `AuthService`, `AuthController`, `passwordResetCodeRepository` |
| NO-3.2 | users | ✅ | `UserService`, `UserController`, `userRepository`; `getXpEarnings` |
| NO-3.3 | categories | ✅ | `CategoryService`, `CategoryController`; fixed `:id` → `:categoryId` route param |
| NO-3.4 | courses | ✅ | split `Course*` + `CourseObjective*` |
| NO-3.5 | content | ✅ | split module/chapter/lesson/lesson-content/question/option; `answer` → `option` |
| NO-3.6 | learning | ✅ | split enrollment/progress/completion |
| NO-3.7 | reviews | ✅ | `ReviewService`, `ReviewController`; `reviewDescription`, `isHelpfulNormalized` |
| NO-3.8 | certificates | ✅ | `CertificateService`, `CertificateController`; `isAlreadyClaimed` |
| NO-3.9 | subscriptions | ✅ | split plan/subscription/payment/webhook; `SubscriptionRepository` typo fixed |
| NO-3.10 | admin | ✅ | `Admin*`, `AdminUser*` |

## NO-4 — Docs sync

| # | Task | Status | Evidence / files |
|---|---|---|---|
| NO-4.1 | Update `ai/coding-rules.md` + `ai/architecture-rules.md` to the new naming/OOP convention | ✅ | `ai/*` |
| NO-4.2 | Update `docs/` references to renamed files and the class/DI convention | ✅ | `docs/**` (16 files) |

## NO-5 — Verification

| # | Task | Status | Evidence / files |
|---|---|---|---|
| NO-5.1 | `npx eslint .` → 0 errors | ✅ | backend (7 pre-existing console warnings) |
| NO-5.2 | Import smoke + `grep` for old filenames/typos = none | ✅ | backend |
| NO-5.3 | Route paths/methods and middleware order unchanged | ✅ | 77 routes, 0 non-function handlers; webhook before `express.json()` |
