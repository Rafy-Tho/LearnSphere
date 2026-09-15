# Backend Security

Backend-only security hardening plan. Supersedes the backend sections of
[`../security-plan.md`](../security-plan.md), which predates the module refactor and lists
several items that are already implemented. Part of the backend refactor series under
`docs/08-refactoring/backend/`. Findings were verified against the refactored code on
2026-09-15.

> **Status:** Implemented (2026-09-15). SH-1…SH-7 applied and verified (SH-8). Only
> operational step left: apply migration `0012` to the live DB. Tasks live in
> [`../../09-implement/tasks/security-hardening.md`](../../09-implement/tasks/security-hardening.md);
> decisions in [`../../09-implement/decisions.md`](../../09-implement/decisions.md).

---

## 1. Goals

- Protect user accounts and session data
- Prevent unauthorized access (IDOR/BOLA, missing guards)
- Reduce common web risks (CSRF, XSS, headers, brute force)
- Stop leaking sensitive information (answer keys, hashes, internals)
- Keep secrets in the environment; never log them
- Fix critical issues first and preserve existing behavior where possible

---

## 2. Status Snapshot

Already implemented and verified against the current code — **do not redo**. The older
[`../security-plan.md`](../security-plan.md) still lists these as open.

| Area | Item | Evidence |
|---|---|---|
| Auth | Login status check (`status !== ACTIVE` rejected) + constant-time dummy bcrypt | `modules/auth/service.js:53-80` |
| Auth | `loginLimiter` applied to `POST /auth/login` | `modules/auth/routes.js:20-26` |
| Auth | Password reset: `crypto.randomInt`, HMAC-SHA256 pepper, generic responses, transactional, attempts | `common/helper/create-random-code.js:4`; `common/services/hash-code.js:6-11`; `modules/auth/service.js:88-146` |
| Auth | Reset-code column widened to `VARCHAR(255)` | `db/migrations/0011_drift_fixes.sql:34-36` |
| Auth | Register is transactional (user + profile) | `modules/auth/service.js:43-50` |
| Authz | Option create/update/delete require `authorize(INSTRUCTOR, ADMIN)` + ownership | `modules/content/option.routes.js:12-38`; `option.service.js:15-69` |
| Authz | Course dashboard ownership; centralized `assertOwnership` helper | `modules/courses/course.service.js:135-143`; `common/auth/ownership.js` |
| Authz | Enroll requires active paid subscription; completion/review require enrollment | `learning/enrollment.service.js:29-38`; `learning/completion.service.js:28-37`; `reviews/service.js:39-48` |
| Data | Password hashes no longer selected/returned (explicit column lists) | `modules/users/repository.js:8-18,196-205`; `repository.js:153-163` |
| Data | `AdvancedQuery.limitFields()` removed (latent injection gone) | `common/query/advanced-query.js` |
| Payments | Webhook signature verify, idempotency, `payment_status` check, transaction | `subscriptions/webhook.routes.js:13-38`; `webhook.service.js:14-78` |
| Config | Fail-fast env validation; `SESSION_SECRET` length check | `config/environment.js:28-44` |
| Config | Stripe redirects built from `CLIENT_URL_1`, not the `Origin` header | `subscriptions/subscription.service.js:52-53` |
| Errors | Stack/details only in development; 5xx logged | `common/middleware/error-handler.js:61-82` |

---

## 3. Verified Remaining Findings

| # | Sev | Finding | Evidence |
|---|---|---|---|
| 1 | **Critical** | Quiz answer key (`is_correct` + `explanation`) returned to any enrolled learner; frontend grades client-side | `content/lesson.repository.js:124-145`; `content/question.service.js:69-97`; `frontend/src/components/courseLearning/quiz/Quiz.jsx:39-59` |
| 2 | **High** | No CSRF protection; prod cookie `sameSite:"none"` + `express.urlencoded` enabled → cross-site form POSTs | `common/middleware/session-middleware.js:28`; `app/middleware.js:26` |
| 3 | **High** | No security headers (`helmet` absent): HSTS, nosniff, frame options, CSP | `app/middleware.js`; `package.json` |
| 4 | **High** | Password change/reset does not invalidate existing sessions | `modules/auth/service.js:135-161` |
| 5 | **High** | No per-account lockout; `loginLimiter` is IP-only | `common/middleware/rate-limit-middlewares.js:19-23`; `modules/auth/routes.js:22` |
| 6 | Medium | `trust proxy: 1` may not match the real hop count → IP rate-limit spoofing | `app/middleware.js:14` |
| 7 | Medium | Registration reveals whether an email exists (409) | `modules/auth/service.js:36-39` |
| 8 | Medium | Progress update does not verify the lesson belongs to the course | `learning/progress.service.js:48-71`; `progress.repository.js:18-27` |
| 9 | Medium | Enroll ignores course `status` / soft-delete | `learning/enrollment.service.js:25-38` |
| 10 | Medium | `backend/uploads` served publicly and a file is committed; not gitignored | `app/middleware.js:38`; `.gitignore`; `backend/uploads/profile.jpg` (tracked) |
| 11 | Medium | No audit logging for auth/role/payment events | `common/logger.js` (no audit usage) |
| 12 | Low | 404 reflects `req.originalUrl` | `common/http/not-found-url.js:5` |
| 13 | Low | `booleanValidator` uses `escape`/`trim` coercion | `common/validation.js:216-227` |
| 14 | Low | Hardcoded temp password `TempPassword123!` | `modules/admin/admin-user.service.js:12` |
| 15 | Low | 30-day rolling session with no idle timeout | `common/middleware/session-middleware.js:29` |
| 16 | Low | Public certificate lookup by UUID | `certificates/routes.js:31-36` |

---

## 4. Prioritized Work

### SH-1 — Quiz answer-key protection (server-side grading) — Critical ✅
- **Decision:** D-15 (supersedes D-11).
- **Location:** `modules/content/lesson.repository.js:124-166`; `question.service.js:69-146`;
  `question.routes.js`; `app/routes.js`; `frontend/src/components/courseLearning/quiz/Quiz.jsx`.
- **Before:** `getQuestions` returned `is_correct` and `explanation` to enrolled learners;
  the frontend scored locally from that payload.
- **Applied:** learner `GET /lessons/:lessonId/questions` returns options **without**
  `is_correct`/`explanation` (but with `option.id`); `POST /lessons/:lessonId/quiz-submissions`
  (auth + enrollment/owner/admin) grades server-side and returns `{ score, results }`
  with `correctOptionId`, `isCorrect`, and `explanation`. Frontend submits per answer and
  renders server results.
- **Verified:** stub-DB/service checks 12/12 (learner SQL has no key; grading, ownership,
  and 400s correct); backend lint 0 errors; frontend build passes.
- **Risk:** Medium (frontend contract change; submission result shape must stay stable).

### SH-2 — CSRF: JSON-only + custom header — High ✅
- **Decision:** D-06.
- **Location:** `common/middleware/csrf-protection.js`; `app/middleware.js`; `frontend/src/api/client.js`;
  `admin/src/services/http.js` + all 12 admin services.
- **Before:** global `express.urlencoded` + `sameSite:"none"` let cross-site simple
  form POSTs carry the session cookie.
- **Applied:** state-changing methods require `Content-Type: application/json`
  (or `multipart/form-data` for uploads) **and** an `X-Requested-With` header; the global
  urlencoded parser was removed; CORS `allowedHeaders` is explicit; the Stripe webhook is
  exempt (mounted before the guard and path-exempt). Frontend sends the header in
  `ApiClient`; admin routes every call through `apiFetch`.
- **Verified:** 7/7 middleware cases (GET pass; missing header 403; `text/plain` 403;
  JSON/multipart 200; DELETE 200; webhook exempt); backend lint 0 errors; frontend + admin
  builds pass.
- **Risk:** Medium (all clients updated in lockstep).

### SH-3 — Security headers — High ✅
- **Location:** `app/middleware.js`; `package.json`.
- **Applied:** `helmet` applied first (step 2) with `noSniff`, `frameguard`, `referrerPolicy`,
  a strict JSON-only CSP (`default-src 'none'` + `base-uri`/`frame-ancestors`/`form-action`
  `'none'`), `crossOriginResourcePolicy: cross-origin` (uploads), prod-only HSTS
  (`max-age=15552000`), and `X-Powered-By` removed. Frontends set their own CSP at their host.
- **Verified:** real-app header check 7/7 + production HSTS; backend lint 0 errors.
- **Risk:** Low–Medium (CORP set to `cross-origin` for uploaded media).

### SH-4 — Session invalidation on credential change — High ✅
- **Location:** `modules/auth/session.repository.js`; `modules/auth/service.js`;
  `modules/users/controller.js`.
- **Applied:** new `SessionRepository.deleteByUserId` deletes all `session` rows for a
  user (`sess -> 'user' ->> 'id'`), usable inside a transaction. `changePassword` deletes
  sessions after the password update; `resetUserPassword` deletes them inside the
  password-update transaction. `updatePassword` also destroys the current session and
  clears the cookie so the rolling session cannot re-persist it.
- **Verified:** 5/5 unit checks (SQL shape; delete-on-change; no delete on wrong password;
  controller destroy + cookie clear; envelope). Backend lint 0 errors.
- **Risk:** Low. The current user is logged out after a password change (expected).

### SH-5 — Per-account login lockout — High ✅
- **Location:** `db/migrations/0012_login_lockout.sql`; `modules/users/repository.js`;
  `modules/auth/service.js`.
- **Applied:** `users.failed_login_attempts` + `users.locked_until` (idempotent migration
  with rollback comment). `recordFailedLogin` atomically increments and locks at the
  threshold (5 attempts → 15 min); `resetFailedLogin` clears on success. Locked accounts
  are rejected without a password compare and return the same generic `Invalid credentials`.
- **Verified:** 9/9 unit checks (SQL + unknown/locked/wrong/expired/success/suspended).
  Backend lint 0 errors.
- **Risk:** Low. **Apply `npm run db:migrate` (0012) to the live DB.**

### SH-6 — Medium hardening ✅
- **trust proxy:** `resolveTrustProxy` accepts a hop count or comma-separated CIDRs from
  optional `TRUST_PROXY` (default `1`) — `app/middleware.js`, `environment.js`, `.env.example`.
- **Registration enumeration:** `registerUser` returns `{ created }` (no throw); the
  controller always returns a generic `201` and never auto-logs-in; `frontend/Signup.jsx`
  routes to `/login` (D-16). Reset was already generic.
- **Progress:** `updateProgress` verifies the lesson belongs to the course → 400 otherwise.
- **Enroll:** requires `status = PUBLISHED` (`findById` already filters `deleted_at`).
- **Uploads:** untracked `backend/uploads/profile.jpg`, added `backend/uploads/` to
  `.gitignore`, removed the `express.static` serve, and always unlink the local file after
  Cloudinary upload (`users/service.js` try/finally).
- **Audit logging:** `logger.audit(action, meta)` (redacted ids/actions) for login
  success/failure/lock/inactive, register, logout, password change/reset, admin user
  create/update/delete, and payment create/update/delete/completed.
- **404:** static `"Not Found"` (no reflected URL).
- **Verified:** 10/10 unit checks; backend lint 0 errors; app import OK; frontend build
  passes; uploads ignored. Note: registration no longer auto-logs-in (users log in after signing up).

### SH-7 — Low hardening ✅
- **booleanValidator:** explicit `customSanitizer` + strict `isBoolean` (no `trim`/`escape`);
  rejects `"yes"`/`2`, normalizes `true`/`"true"`/`"1"`/`"0"` (`common/validation.js`).
- **Admin invite:** random `crypto.randomBytes(32)` password + `authService.sendResetCode`
  invite; the hardcoded temp password is gone (`modules/admin/admin-user.service.js`, D-09).
- **Idle timeout:** `common/middleware/session-idle-timeout.js` (24h) wired after the session
  middleware; `sessionService.create` stamps `lastActivity`.
- **Certificate lookup:** `requireAuth` + owner/admin assertion (`certificates/routes.js`,
  `service.js`).
- **Verified:** 16/16 unit checks (boolean matrix; idle fresh/stale/anonymous; certificate
  owner/admin/403/404). Backend lint 0 errors.

---

## 5. Decisions

| # | Decision | Blocks |
|---|---|---|
| D-06 | CSRF strategy → JSON-only + custom header | SH-2 |
| D-09 | Admin temp password → invite/reset flow | SH-7 |
| D-15 | Quiz grading → server-side endpoint (supersedes D-11) | SH-1 |
| D-16 | Registration → generic success, no auto-login | SH-6 |

---

## 6. Verification

```text
Identify Risk
  ↓
Prioritize
  ↓
Fix
  ↓
Test
  ↓
Verify
```

### 6.1 Test checklist
- [ ] Learner quiz payload contains no `is_correct`/`explanation`; submission grades correctly.
- [ ] Cross-site form POST is rejected (403); valid JSON + header requests pass.
- [ ] Security headers present (HSTS, nosniff, frame options, CSP).
- [ ] Password change/reset invalidates existing sessions.
- [ ] Suspended user cannot log in; account locks after N failures.
- [ ] Login response/time is the same for unknown vs wrong-password.
- [ ] Learner cannot POST/PATCH/DELETE options (403).
- [ ] Progress cannot point at a lesson from another course (400).
- [ ] Learner cannot enroll in an unpublished/soft-deleted course.
- [ ] No endpoint returns `password`; unvalidated writes return 422.
- [ ] `/uploads` is not publicly enumerable; no upload files tracked.
- [ ] Env validation fails fast on missing secrets.
- [ ] Stripe redirect URLs ignore a spoofed `Origin`.
- [ ] Webhook is idempotent; duplicate events do not create duplicates or 500-loop.

### 6.2 Rules
- Fix critical issues first.
- Prefer framework/library protections (helmet, express-validator, express-rate-limit).
- Do not expose internals in production errors.
- Do not log secrets, tokens, passwords, or reset codes.
- Preserve existing behavior where possible; coordinate contract changes with both
  frontends and the Stripe webhook.
- Re-audit touched areas after each phase.

---

## 7. Order

1. **Phase 1 — Critical/High:** SH-1 quiz key, SH-2 CSRF, SH-3 headers, SH-4 session
   invalidation, SH-5 lockout.
2. **Phase 2 — Medium:** SH-6.
3. **Phase 3 — Low:** SH-7.
4. **Verification:** SH-8 after each phase.

> Payment/schema changes need a rollback path and Stripe test-mode validation. Never
> commit `.env`; rotate any leaked secret immediately.
