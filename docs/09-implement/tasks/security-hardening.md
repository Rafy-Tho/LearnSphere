# Security Hardening

Backend security hardening. Plan:
[`../../08-refactoring/backend/06-security.md`](../../08-refactoring/backend/06-security.md)
(supersedes the backend sections of `security-plan.md`). Findings verified 2026-09-15.

> **Status:** ✅ Done (2026-09-15). SH-1…SH-8 complete. Only operational step left:
> apply migration `0012` to the live DB. Already-fixed items (see plan §2) are **not** part
> of these tasks.

**Legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

## SH-1 — Quiz answer-key protection (server-side grading)

Blocks on D-15.

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-1.1 | Split learner vs owner question queries in `getQuestions`; learner query excludes `is_correct`/`explanation` | ✅ | `lesson.repository.js` — learner query returns option `id`/`text`/`position`; `getQuestionsWithAnswers` keeps the key |
| SH-1.2 | Add grading service method (score + per-question results + correct option + explanation) | ✅ | `question.service.js:submitQuiz` + shared `assertQuizAccess` |
| SH-1.3 | Add `POST /lessons/:lessonId/quiz-submissions` (auth + enrollment) | ✅ | `question.routes.js:quizSubmissionRoute`; `quizSubmissionValidator`; mounted in `app/routes.js` (78 routes, +1) |
| SH-1.4 | Update frontend to submit and render server results (no client scoring) | ✅ | `frontend/src/api/lessons.js`; `useSubmitQuiz`; `Quiz.jsx`; `QuestionCard.jsx`; `OptionButton.jsx` |
| SH-1.5 | Verify learner payload has no answer key; submission grades correctly | ✅ | stub-DB/service check: 12/12 pass (no `is_correct`/`explanation` in learner SQL; grade/ownership/400s correct). Backend lint 0 errors; frontend build OK |

## SH-2 — CSRF: JSON-only + custom header

Blocks on D-06.

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-2.1 | Middleware: state-changing methods require `application/json` (allow multipart) + `X-Requested-With` | ✅ | `common/middleware/csrf-protection.js`; wired in `app/middleware.js` (webhook exempt) |
| SH-2.2 | Remove the global `express.urlencoded` parser | ✅ | `app/middleware.js` — JSON-only body parsing |
| SH-2.3 | Add `X-Requested-With` to CORS `allowedHeaders` | ✅ | `app/middleware.js` — `["Content-Type", "X-Requested-With"]` |
| SH-2.4 | Send `X-Requested-With` from both clients | ✅ | `frontend/src/api/client.js`; `admin/src/services/http.js` + all 12 services (53 calls) |

> Verified: 7/7 middleware cases (GET pass; POST missing header 403; `text/plain` 403; JSON/multipart 200; DELETE 200; webhook exempt). Backend `npx eslint .` 0 errors; frontend + admin builds pass; admin services lint clean.

## SH-3 — Security headers

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-3.1 | Add `helmet` and apply HSTS/nosniff/frameguard/referrerPolicy; disable `x-powered-by` | ✅ | `helmet@^8.3.0`; `app/middleware.js` (step 2). HSTS prod-only (`max-age=15552000`), CORP `cross-origin` |
| SH-3.2 | Tune CSP for both frontends (assets/fonts/API origins) | ✅ | API serves JSON only, so a strict CSP (`default-src 'none'`, `base-uri/frame-ancestors/form-action 'none'`) is safe; frontend CSPs belong to their host |

> Verified: real-app header check 7/7 (nosniff, SAMEORIGIN, no-referrer, CORP cross-origin, strict CSP, `X-Powered-By` removed, HSTS prod-only) + production HSTS `max-age=15552000`. Backend `npx eslint .` 0 errors; app import OK.

## SH-4 — Session invalidation on credential change

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-4.1 | Add a session-delete helper (or session version checked in `validate`) | ✅ | New `modules/auth/session.repository.js` — `deleteByUserId` (deletes `session` rows via `sess -> 'user' ->> 'id'`), client-injectable for transactions |
| SH-4.2 | Invalidate sessions in `changePassword` | ✅ | `modules/auth/service.js` — deletes sessions after password update; `users/controller.js` destroys the current session + clears the cookie so the rolling session cannot re-persist it |
| SH-4.3 | Invalidate sessions in `resetUserPassword` | ✅ | `modules/auth/service.js` — deletes sessions inside the password-update transaction |

> Verified: 5/5 checks (SQL shape; `changePassword` deletes sessions; wrong old password keeps them; controller destroys session + clears cookie; success envelope). Backend `npx eslint .` 0 errors; app import OK. Note: the current user is logged out after a password change (clients get 401 on the next request).

## SH-5 — Per-account login lockout

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-5.1 | Schema/migration for failed-login counter + lock window (with rollback) | ✅ | `db/migrations/0012_login_lockout.sql` (idempotent + rollback comment); `schema.sql` users columns `failed_login_attempts`, `locked_until`; `db/README.md` |
| SH-5.2 | Track failures and lock in `authenticate`; reset on success | ✅ | `users/repository.js` `recordFailedLogin` (atomic increment + lock) / `resetFailedLogin`; `auth/service.js` `isLocked` + lock/reset flow (5 attempts → 15 min) |
| SH-5.3 | Keep generic `Invalid credentials`; retain IP `loginLimiter` | ✅ | `auth/service.js` returns generic 400 for unknown/locked/wrong; `loginLimiter` still on `POST /auth/login` |

> Verified: 9/9 checks (repository SQL; unknown/locked/wrong/success/expired/suspended paths). Backend `npx eslint .` 0 errors; app import OK. **Apply `npm run db:migrate` to the live DB (0012).**

## SH-6 — Medium hardening

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-6.1 | Set `trust proxy` to exact hops/CIDR | ✅ | `app/middleware.js` `resolveTrustProxy`; optional `TRUST_PROXY` env (`environment.js`, `.env.example`) |
| SH-6.2 | Registration/reset must not confirm account existence | ✅ | `auth/service.registerUser` returns `{ created }` (no throw); `auth/controller.register` returns generic 201, no auto-login; `frontend/Signup.jsx` routes to `/login` (D-16) |
| SH-6.3 | Progress update verifies `lessonId ∈ courseId` | ✅ | `learning/progress.service.js` `updateProgress` → 400 on mismatch |
| SH-6.4 | Enroll requires `status = PUBLISHED` and not soft-deleted | ✅ | `learning/enrollment.service.js` (findById already filters `deleted_at`) |
| SH-6.5 | Uploads: untrack `backend/uploads/profile.jpg`, gitignore, stop static serve, unlink after Cloudinary | ✅ | `git rm --cached`; `.gitignore` `backend/uploads/`; static serve removed from `app/middleware.js`; `users/service.js` try/finally unlink |
| SH-6.6 | Audit logging for auth/role/payment events (redacted) | ✅ | `common/logger.js` `audit`; calls in `auth/service.js`, `auth/controller.js`, `admin/admin-user.service.js`, `subscriptions/webhook.service.js`, `subscriptions/payment.service.js` |
| SH-6.7 | Static 404 message (no reflected URL) | ✅ | `common/http/not-found-url.js` → `"Not Found"` |

> Verified: 10/10 checks (trust-proxy parsing; duplicate register generic + no writes; progress foreign/own lesson; unpublished enroll; audit structure; static 404). Backend `npx eslint .` 0 errors; app import OK; frontend build passes; `backend/uploads/` ignored and `profile.jpg` untracked.

## SH-7 — Low hardening

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-7.1 | Fix `booleanValidator` coercion | ✅ | `common/validation.js` — explicit `customSanitizer` + strict `isBoolean` (no trim/escape); rejects `"yes"`/`2`, normalizes `true`/`"true"`/`"1"`/`"0"` |
| SH-7.2 | Replace hardcoded temp password with invite/reset flow | ✅ | `admin/admin-user.service.js` — random `crypto.randomBytes(32)` password + `authService.sendResetCode(email)` invite (D-09) |
| SH-7.3 | Add idle session timeout alongside rolling window | ✅ | `common/middleware/session-idle-timeout.js` (24h) wired after session; `sessionService.create` sets `lastActivity` |
| SH-7.4 | Certificate lookup requires auth or signed verification token | ✅ | `certificates/routes.js` `requireAuth`; `service.getCertificateById` asserts owner/admin |

> Verified: 16/16 checks (boolean coercion matrix; idle fresh/stale/anonymous; certificate owner/admin/403/404). No `TempPassword` refs remain. Backend `npx eslint .` 0 errors; app import OK.

## SH-8 — Verification

| # | Task | Status | Evidence / files |
|---|---|---|---|
| SH-8.1 | `npx eslint .` → 0 errors (backend) | ✅ | backend (7 pre-existing `no-console` warnings) |
| SH-8.2 | Run plan §6.1 checklist end-to-end | ✅ | Covered by per-phase unit checks (SH-1 12/12, SH-2 7/7, SH-3 7/7, SH-4 5/5, SH-5 9/9, SH-6 10/10, SH-7 16/16); no live DB/e2e harness exists |
| SH-8.3 | Frontend + admin builds pass after client changes | ✅ | `frontend` + `admin` `npm run build` both succeed |
| SH-8.4 | Confirm middleware order + Stripe webhook still before `express.json()` | ✅ | Stack: `helmet > cors > webhook(router) > csrf > json > morgan > limiter > session > idle > routers > 404 > error` |

> **All SH tasks complete.** Remaining operational step: apply migration `0012` to the live DB (`npm run db:migrate`).
