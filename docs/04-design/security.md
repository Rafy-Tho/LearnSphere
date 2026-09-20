# Security

This document describes the security controls currently implemented and the threat model. Sources: `backend/src/common/middleware`, `backend/src/modules/*`, `backend/src/config`, and both frontends.

## 1. Authentication

| Control | Implementation |
|---|---|
| Password storage | bcrypt with 12 salt rounds (`backend/src/common/services/hash-service.js`) |
| Session mechanism | `express-session` + `connect-pg-simple` (PostgreSQL store) |
| Session cookie | `httpOnly`, `secure` in production, `sameSite: "none"` prod / `"lax"` dev, 30-day rolling `maxAge` |
| Session lifecycle | Regenerated on login; destroyed on logout (`unset: "destroy"`) |
| Session validation | `requireAuth` requires `session.user.id` and `session.user.role` |
| Reverse proxy | Configurable `trust proxy` (`TRUST_PROXY`) so secure cookies work behind a proxy |
| Client-side auth | Server-derived via the `["me"]` query; cleared on 401 |

Session cookie configuration lives in `backend/src/common/middleware/session-middleware.js`.

## 2. Authorization

- `authorize(...roles)` is a higher-order middleware reading `req.session.user.role`.
- Admin routers apply a router-level guard (`requireAuth`, `authorize(ADMIN)`).
- Resource ownership is verified in controllers by joining up to `courses.instructor_id` (e.g. `getInstructor(id)` in module/chapter/lesson/content/question repositories) and comparing to the session user; `ADMIN` bypasses ownership.
- Roles: `LEARNER`, `INSTRUCTOR`, `ADMIN`.

### Authorization Notes

The former gaps (missing `authorize`/validators on quiz options, unused `loginLimiter`) are resolved — see §11.

## 3. Input Validation & Sanitization

- `express-validator` schemas in `backend/src/modules/<module>/validation.js` (builders in `backend/src/common/validation.js`) run on request bodies.
- `validateResult` collapses to the first error with HTTP 422.
- Shared builders: email (normalize + max 100), password (8–100, strong), text (trim, length), code (6 numeric), uuid, number, float, enum, boolean, date, and `htmlValidator`.
- `htmlValidator` sanitizes HTML with `isomorphic-dompurify` and writes the sanitized value back to `req.body`.
- Frontend renders lesson HTML with `DOMPurify.sanitize` before `dangerouslySetInnerHTML`.
- Upload validation: `multer` fileFilter allows only `jpeg|jpg|png|webp` by extension and MIME, max 5 MB.

## 4. Rate Limiting

| Limiter | Window | Max | Applied |
|---|---|---|---|
| `globalLimiter` | 1 min | 100 | All requests |
| `passwordResetLimiter` | 12 h | 10 | Password reset code requests |
| `codeAttemptsLimiter` | 1 h | 10 | Code verify + reset |
| `loginLimiter` | 15 min | 5 | Applied to `POST /auth/login` and `GET /auth/google` (+ per-account lockout) |
| `emailVerificationLimiter` | 1 h | 5 | Register + resend verification code |

Rate-limit exhaustion returns HTTP 429.

## 5. Secrets & Configuration

- All secrets come from environment variables via `backend/src/config/environment.js`.
- `.env` files are gitignored at the repo root; no env files are tracked.
- Required variables: `PORT`, `NODE_ENV`, `DATABASE_URL`, `SESSION_SECRET`, `COOKIE_NAME`, `CLIENT_URL_1`, `CLIENT_URL_2`, `BREVO_API_KEY`, `SENDER_EMAIL`, `CLOUDINARY_NAME`, `CLOUDINARY_API_KEY`, `CLOUDINARY_SECRET_KEY`, `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET`.
- Optional variables: `TRUST_PROXY`, and Google OAuth (`GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GOOGLE_CALLBACK_URL`). When unset, the OAuth routes report not-configured instead of blocking boot.
- Frontends only receive `VITE_BASE_URL` (public). `GOOGLE_CLIENT_SECRET` is server-only and never sent to the browser.

**Rules:** never commit `.env`, never log secrets, never expose server-only keys to Vite (`VITE_*` is bundled into the client).

## 6. CORS

- Origins: `[ENV.CLIENT_URL_1, ENV.CLIENT_URL_2]`.
- `credentials: true` to allow session cookies.
- Any origin not in the allowlist is blocked by the browser.

## 7. Password Reset Security

- Codes are 6 numeric digits generated with `crypto.randomInt`.
- Only an HMAC-SHA256 hash (keyed with `SESSION_SECRET`) is stored (`backend/src/common/services/hash-code.js`).
- Codes expire after 10 minutes and have an attempt counter (max 5).
- Reset-code requests and attempts are rate-limited.
- The `password_reset_codes.code` column is `VARCHAR(255)` (baseline `0003_identity.sql`).

## 7.1 Email Verification Security

- Registration and unverified login issue a 6-digit `crypto.randomInt` code; no
  authenticated session exists until `POST /auth/verify-email` succeeds.
- Only an HMAC-SHA256 hash (keyed with `SESSION_SECRET`) is stored in
  `email_verification_codes`; codes are never logged or returned in responses.
- Codes expire after 10 minutes, are single-use, invalidate previous codes on
  resend, and cap attempts at 5.
- The pending user is tracked server-side in the session
  (`pendingVerificationUserId`); `POST /auth/verify-email` accepts `{ code }`
  only, so no user identifier is exposed.
- Register/resend are covered by `emailVerificationLimiter`; verification by
  `codeAttemptsLimiter`.
- `users.email UNIQUE` is preserved; unknown/duplicate emails get generic
  responses that do not reveal account existence.

## 7.2 Google OAuth Security

- Authorization-code flow with OIDC (`openid-client`); the client secret stays
  on the backend and is never exposed to the frontend.
- CSRF/replay protection: a random `state`, OIDC `nonce` and PKCE
  `code_verifier` are generated per attempt and stored in the server session;
  all three are validated on the callback. Session state is single-use.
- The ID token is validated for signature, issuer, audience, expiry and nonce;
  the email must be `email_verified: true` before it can be used to link an
  existing account.
- The provider identity (`provider_user_id` = Google `sub`) comes only from the
  validated token — never from the browser. `UNIQUE (provider, provider_user_id)`
  prevents moving a Google identity between users; a mismatched link is rejected
  (`GOOGLE_ACCOUNT_ALREADY_LINKED`).
- No duplicate accounts: an existing `users.email` is linked, not re-created;
  `users.email UNIQUE` remains.
- Tokens, secrets and raw provider responses are never logged or returned to the
  client; only stable error codes are surfaced.
- On success the existing session service creates the normal application
  session (no separate Google session, no JWT). Logout is unchanged and does not
  sign the user out of Google.

## 8. Payments Security

- Stripe Checkout is used; the server never handles raw card data.
- The webhook verifies the `stripe-signature` against `STRIPE_WEBHOOK_SECRET`.
- The webhook route is mounted before `express.json()` so it receives the raw body needed for signature verification.
- `stripe_payment_intent_id` is unique.

## 9. Error Handling & Information Disclosure

- Central `errorHandler` maps PostgreSQL SQLSTATE codes to HTTP statuses.
- In development, `stack` and `error` are included; in production they are omitted.
- 404 handler returns `Not Found <url>`.

## 10. Threat Model (STRIDE Summary)

| Threat | Exposure | Mitigation |
|---|---|---|
| Spoofing | Session hijack | HTTP-only, secure cookies; session regeneration |
| Tampering | Forged payment events | Stripe webhook signature verification |
| Repudiation | Missing audit trail | Structured audit log for auth/role/payment events |
| Information disclosure | Secret leakage | Env vars, no secrets in source, sanitized errors |
| Denial of service | Brute force / flooding | Global + auth rate limits + per-account lockout |
| Elevation of privilege | Role bypass | `authorize` + ownership checks (incl. quiz options) |
| XSS | Malicious lesson HTML | DOMPurify on input and render |
| SQL injection | Malicious query input | Parameterized SQL everywhere; `AdvancedQuery` uses placeholders |
| CSRF | Cross-site request forgery | JSON-only + `X-Requested-With` guard; `sameSite` cookies |
| OAuth replay/linking | Forged callback or identity theft | `state` + `nonce` + PKCE validation; verified-email requirement; unique provider identity |
| Insecure file upload | Malicious uploads | Type/MIME filter + size limit; files pushed to Cloudinary |

## 11. Security Hardening (resolved)

The former gaps were implemented in the backend security-hardening pass. See
[`../progress/backend-progress.md`](../progress/backend-progress.md).

| # | Former gap | Resolution |
|---|---|---|
| 1 | No CSRF token | JSON-only + `X-Requested-With` guard (SH-2) |
| 2 | `loginLimiter` unused | Applied + per-account lockout, 5 attempts → 15 min (SH-5) |
| 3 | Missing `authorize` on option POST | `authorize(INSTRUCTOR, ADMIN)` + ownership |
| 4 | Missing validators on option PATCH/DELETE | Validators added |
| 5 | `is_correct` exposed to learners | Server-side grading endpoint (SH-1) |
| 6 | No reset invalidation on password change | Sessions deleted on change/reset (SH-4) |
| 7 | No security headers | `helmet` (SH-3) |
| 8 | No account lockout | `users.failed_login_attempts` / `locked_until` (SH-5) |
| 9 | No audit logging | `logger.audit` for auth/role/payment events (SH-6) |
| 10 | Reset-code column too small | Widened to `VARCHAR(255)` (baseline `0003_identity.sql`) |

Other improvements: `trust proxy` configurable, generic registration (no enumeration),
progress/enroll authorization checks, public uploads removed, static 404, idle session
timeout, certificate lookup restricted to owner/admin, and admin invite instead of a
hardcoded temporary password. The schema is now defined by the CREATE-only baseline
migrations (`0001`–`0011`).

## 12. Production Security Requirements

- HTTPS is mandatory (`secure` + `sameSite: "none"` cookies).
- `SESSION_SECRET` must be a long random value and rotated on compromise.
- Database credentials must be least-privilege and not reused.
- CORS origins must be exact production origins, never `*`.
- Keep dependencies patched; run `npm audit` on a schedule.
- Stripe webhook secret must match the configured endpoint.
