# Security Plan

Execution plan for security hardening, based on [`backend-audit.md`](./backend-audit.md) §14 and the P0 register in [`codebase-audit.md`](./codebase-audit.md) §4.

> **Status:** Proposed. No security change applied. Fix critical issues first (§7).

---

## 1. Goals

- Protect user accounts and data
- Prevent unauthorized access
- Reduce common web security risks
- Avoid exposing sensitive information

---

## 2. Authentication

Review:
- Login
- Registration
- Sessions/cookies
- Password handling
- Email verification
- Password reset
- OAuth
- Account linking
- Session expiration

### 2.1 Current state & findings

| Area | Finding | Evidence | Severity |
|---|---|---|---|
| Login | No `users.status` check → SUSPENDED/INACTIVE can log in | `userControllers.js:55-79` | High |
| Login | Timing oracle (no dummy bcrypt for unknown users) | `userControllers.js:57-65` | Medium |
| Login | `loginLimiter` defined but never applied → brute force | `rateLimitMiddlewares.js:19-23`, `userRoute.js:41` | High |
| Registration | Returns 400 (not 409) and reveals existing email | `userControllers.js:24-26` | Medium |
| Registration | User + profile writes are not transactional | `userControllers.js:32-39` | Medium |
| Sessions/cookies | `httpOnly`, `secure` prod, rolling 30-day (good) | `sessionMiddleware.js:25-30` | — |
| Sessions/cookies | No invalidation on password change/reset | `userControllers.js:284-314` | Medium |
| Sessions/cookies | `validate` trusts session snapshot; no status/role recheck | `session-service.js:27-34` | Medium |
| Password handling | bcrypt 12 rounds (good) | `hash-service.js:5` | — |
| Password reset | `Math.random` 6-digit code, unsalted SHA-256, `VARCHAR(6)` → broken & weak | `create-random-code.js:2-3`, `hash-code.js:3-5`, `schema.sql:80` | High |
| Password reset | Account enumeration via distinct 404 messages | `userControllers.js:197-199,230-232,264-266` | Medium |
| Email verification | **Not implemented** | — | — |
| OAuth / account linking | **Not implemented** (frontend social buttons are inert) | `frontend/components/SocialButtons.jsx` | — |
| Session expiration | 30-day rolling; no idle timeout | `sessionMiddleware.js:29` | Low |

### 2.2 Actions

1. Reject login when `status !== 'ACTIVE'`; return a generic message.
2. Perform a dummy bcrypt compare when the user is missing (constant-time).
3. Apply `loginLimiter` to `/login` and add per-account throttling/lockout.
4. Fix password reset: `crypto.randomInt` code, salted/HMAC hash with a server pepper, widen the column, and use generic responses.
5. Invalidate all sessions for a user on password change/reset (delete rows from `session` or version sessions).
6. Re-check user status on sensitive operations (or version sessions).
7. Do not reveal account existence on register/reset; prefer generic success.

---

## 3. Authorization

Verify:
- User ownership checks
- Role-based access
- Protected routes
- IDOR/BOLA prevention
- Admin-only operations

### 3.1 Current state & findings

| Finding | Evidence | Severity |
|---|---|---|
| `POST /options` lacks `authorize` + ownership → any learner creates quiz options | `answerRoute.js:15-17`, `answerControllers.js:9-27` | High |
| `PATCH/DELETE /options/:id` lack ownership → edit others' answers | `answerRoute.js:18-21`, `answerControllers.js:31-64` | High |
| `GET /courses/:id/dashboard-details` role-only, no ownership | `courseRoute.js:63-68`, `courseControllers.js:332-361` | Medium |
| Enrollment bypasses subscription/publish checks | `enrollmentControllers.js:12-49` | High |
| Lesson completion without enrollment (XP farming) | `lessonCompletionControllers.js:11-37` | Medium |
| Review without enrollment | `ReviewControllers.js:53-73` | Medium |
| Progress update doesn't verify lesson belongs to course | `learningProgressControllers.js:47-78` | Medium |
| Public certificate lookup returns holder/course names by UUID | `certificateRoute.js:23` | Low |
| Ownership checks correct on course/module/chapter/lesson/content/objective/question mutations | multiple controllers | — |
| Admin routers globally guarded by `requireAuth` + `authorize(ADMIN)` | `adminUserRoute.js:14`, `adminSubscriptionRoute.js:22` | — |

### 3.2 Actions

1. Add `authorize(INSTRUCTOR, ADMIN)` + ownership to option create/update/delete.
2. Add ownership (or admin-only) to `dashboard-details`.
3. Enforce subscription/published state on enroll; require enrollment for completion and review.
4. Verify the lesson belongs to the course on progress update.
5. Centralize ownership assertions in a shared helper (removes ~18 duplicated checks and prevents future gaps).
6. Require auth or a signed token for certificate lookup.

---

## 4. Input & Output

Review:
- Request validation
- Sanitization where applicable
- SQL injection protection
- Sensitive fields in responses
- File upload validation
- Error messages

### 4.1 Findings

| Finding | Evidence | Severity |
|---|---|---|
| Public quiz endpoint exposes `is_correct` + explanations | `LessonRepository.js:120-141`, `questionRoute.js:19` | Critical |
| Instructor dashboard returns bcrypt hashes of all instructors | `UserRepository.js:149-157`, `adminControllers.js:29` | High |
| Admin user update returns password hash | `UserRepository.js:191-200` | Medium |
| Missing validators on many write endpoints | options, enrollment, progresses, completions, certificates, payment, all admin routes | Medium |
| Free text not escaped (`textValidator`) → stored-XSS risk if rendered as HTML | `common.validator.js:50-68` | Medium |
| SQL is parameterized (good); `AdvancedQuery.limitFields()` latent injection | `advanced-query.js:131-139` | Low |
| Upload validates extension/MIME only; `/uploads` served publicly; file committed | `multer.js:17-28`, `app.js:61` | Low/Medium |
| Error stacks only in development (good); reflected `originalUrl` in 404 | `error-handler.js:60-68`, `notFoundUrl.js:5` | Low |

### 4.2 Actions

1. Strip `is_correct`/explanations from learner-facing quiz responses (return only to owners/admins).
2. Never select/return `password`; use explicit column lists (dashboard, admin update, `findByEmail`).
3. Add validators to every write endpoint; validate path params as UUIDs.
4. Escape/sanitize free text; keep DOMPurify for HTML on input and render.
5. Delete or whitelist `AdvancedQuery.limitFields()`.
6. Validate uploads by magic bytes; store outside the web root; remove the committed file and ignore `backend/uploads/`.
7. Keep internals out of production errors.

---

## 5. Web Security

Review:
- CORS
- CSRF
- Security headers
- Rate limiting
- Brute-force protection
- Cookie configuration
- HTTPS requirements

### 5.1 Findings

| Finding | Evidence | Severity |
|---|---|---|
| No CSRF protection; production `sameSite:"none"`; urlencoded simple requests not preflighted | `sessionMiddleware.js:28`, `app.js:49-50` | High |
| No security headers (`helmet` absent): HSTS, CSP, nosniff, frame options | `app.js`, `package.json` | Medium |
| `loginLimiter` unused; no account lockout | `rateLimitMiddlewares.js:19-23` | High |
| CORS allowlist explicit (good); may include `undefined` if env unset | `app.js:42` | Low |
| `trust proxy: 1` enables IP rate-limit spoofing if not exactly one proxy | `app.js:38` | Medium |
| HTTPS required by `secure`/`sameSite:"none"` (documented) | `sessionMiddleware.js:27-28` | — |
| Cookie flags correct in production (good) | `sessionMiddleware.js:25-30` | — |

### 5.2 Actions

1. Choose a CSRF strategy: move API/frontends same-site and use `sameSite:"lax"/"strict"`, **or** add CSRF tokens. If staying cross-site, require a custom header that triggers preflight.
2. Add `helmet` (HSTS behind TLS, `nosniff`, frame options, and a CSP compatible with both apps).
3. Wire `loginLimiter`; add per-account throttling and lockout.
4. Validate that both client URLs are set at boot; fail fast otherwise.
5. Set `trust proxy` to the exact number of trusted hops/CIDR; key limits on the authenticated user where possible.

---

## 6. Data & Configuration

Protect:
- Passwords
- Session tokens
- API keys
- OAuth secrets
- Database credentials
- Sensitive logs

Use environment variables for secrets.

### 6.1 Findings

| Finding | Evidence | Severity |
|---|---|---|
| `.env` untracked (good) | `.gitignore` | — |
| Weak `SESSION_SECRET` (8 chars locally); no env validation | `environment.js:5-26` | High/Medium |
| No `.env.example` | repo | Low |
| Stripe `Origin`-header open redirect in success/cancel URLs | `userControllers.js:345,380-381` | Medium |
| No sensitive data logged (good); no structured logging/redaction | `console.*` | Low |
| Hardcoded default avatar in two controllers | `userControllers.js:30`, `adminUserControllers.js:40` | Low |
| Webhook amount unit inconsistency (dollars stored, email divides by 100) | `webhookRoute.js:59`, `email-service.js:42` | Medium |
| Webhook lacks idempotency/transaction → retries/partial state | `webhookRoute.js:31-83` | Medium |

### 6.2 Actions

1. Require a 64+ char random `SESSION_SECRET`; validate all required env vars at boot.
2. Add `.env.example` documenting required keys.
3. Build Stripe redirect URLs from configured origins, not the `Origin` header.
4. Add structured logging with redaction; never log secrets/tokens/passwords.
5. Fix the webhook amount unit and add idempotency + transaction + `payment_status`/amount verification.
6. Move default avatar to config/constants.

---

## 7. Implementation Rules

- Fix critical security issues first
- Prefer framework/library protections
- Do not expose internal errors
- Do not log secrets or sensitive user data
- Preserve existing functionality when possible
- Test security-sensitive changes

Additional project rules:
- Coordinate CSRF/cookie changes with both frontends (they share the API).
- Payment/schema changes need a rollback path and Stripe test-mode validation.
- Never commit `.env`; rotate any leaked secret immediately.
- Add regression tests for each fix once test tooling exists.

### 7.1 Fix order

1. **Critical/High:** `is_correct` exposure; password-reset storage; password-hash exposure; options authorization; `loginLimiter`; CSRF/headers; weak secret/env validation.
2. **Medium:** session invalidation; status check; enrollment/completion/review enforcement; dashboard-details ownership; missing validators; webhook idempotency/transaction; `Origin` redirect; webhook amount unit.
3. **Low:** certificate lookup; upload magic bytes; `/uploads` exposure; `limitFields`; reflected 404; default avatar.

---

## 8. Verification

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

### 8.1 Test checklist
- [ ] Suspended user cannot log in; active user can.
- [ ] Login returns the same response/time for unknown vs wrong-password.
- [ ] `loginLimiter` triggers 429 after N attempts.
- [ ] Password reset works end to end; code is unguessable and stored hashed.
- [ ] Password change/reset invalidates existing sessions.
- [ ] Learner cannot POST/PATCH/DELETE options (403).
- [ ] Learner cannot read another course's dashboard-details (403).
- [ ] Learner cannot enroll in a SUBSCRIPTION course without payment.
- [ ] Completion/review require enrollment.
- [ ] Quiz responses contain no `is_correct`.
- [ ] No endpoint returns `password`.
- [ ] Unvalidated writes return 422.
- [ ] Cross-site state-changing request is blocked (CSRF) or same-site cookie enforced.
- [ ] Security headers present (HSTS, nosniff, frame options, CSP).
- [ ] Env validation fails fast on missing secrets.
- [ ] Stripe redirect URLs ignore a spoofed `Origin`.
- [ ] Webhook is idempotent; duplicate events do not create duplicates or 500-loop.
- [ ] Uploads reject spoofed content types; `/uploads` not publicly enumerable.

### 8.2 Verification rules
- Security-sensitive changes require explicit test evidence before merge.
- Do not claim a fix without reproducing the original risk and confirming it is closed.
- Re-audit touched areas after fixes (see `codebase-audit.md` §5).
