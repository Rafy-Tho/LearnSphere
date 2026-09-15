# Security Rules (for AI Agents)

Security is non-negotiable. Apply these rules to every change.

## 1. Authentication

- Never store plaintext passwords. Use `HashService` (bcrypt, 12 rounds).
- Never log credentials, tokens, session IDs, or reset codes.
- Keep session config as-is: `httpOnly`, `secure` in production, `sameSite: "none"` prod / `"lax"` dev, 30-day rolling.
- Regenerate the session on login; destroy it on logout.
- Do not create custom auth mechanisms; use the existing session service and middleware.

## 2. Authorization

- Always apply `requireAuth` before `authorize(...roles)`.
- Verify resource ownership in controllers using repository `getInstructor()` joins; allow `ADMIN` override.
- Never trust client-supplied `role`, `user_id`, `instructor_id`, or ownership fields.
- Admin routes must remain guarded by `requireAuth` + `authorize(ADMIN)`.
- If you find a missing guard (e.g. `POST /api/v1/options`), fix it rather than replicating the pattern.

## 3. Input Validation

- Every write endpoint must have a validator followed by `validateResult`.
- Use the shared builders in `backend/src/validators/common.validator.js`.
- Sanitize HTML with `htmlValidator` (DOMPurify) on input; render with `DOMPurify.sanitize` on the frontend.
- Validate uploads by extension and MIME; enforce the 5 MB limit.
- Do not disable or weaken existing validation.

## 4. Database

- Use parameterized queries only. Never concatenate or interpolate user input into SQL.
- Do not add dynamic SQL that bypasses `AdvancedQuery`'s placeholder handling.
- Respect `ON DELETE` semantics; do not add cascades that could delete unrelated data.

## 5. Secrets & Configuration

- Never commit `.env` or secrets. They are gitignored.
- Read secrets only via `backend/src/config/Env.js` (backend) or `import.meta.env.VITE_*` (frontend).
- Never expose server-only keys to the frontend.
- Never hardcode keys, tokens, webhook secrets, or credentials.
- If a secret leaks, rotate it immediately and report.

## 6. Payments

- Never handle raw card data; use Stripe Checkout.
- Always verify the Stripe webhook signature with `STRIPE_WEBHOOK_SECRET`.
- Keep the webhook route before `express.json()` so the raw body is available.
- Do not trust client-reported payment success; rely on the webhook.

## 7. Transport & CORS

- Production requires HTTPS (secure cookies + `sameSite=none`).
- Keep CORS restricted to `CLIENT_URL_1` / `CLIENT_URL_2` with `credentials: true`.
- Never set CORS to `*` when credentials are enabled.

## 8. Error Handling & Information Disclosure

- Do not leak stack traces, SQL, or internal paths in production responses.
- Keep the development-only `stack`/`error` fields.
- Use generic messages for auth failures; do not reveal whether an email exists.

## 9. Rate Limiting

- Preserve global and auth-specific limiters.
- Apply `loginLimiter` to login when touching that route.
- Do not raise limits without approval.

## 10. Known Gaps to Address (with approval)

1. No CSRF token.
2. `loginLimiter` unused.
3. Missing `authorize` on option POST.
4. Missing validators on option PATCH/DELETE.
5. `is_correct` potentially exposed to learners.
6. No password-reset invalidation on password change.
7. No `helmet` security headers.
8. No account lockout.
9. No audit logging.
10. `password_reset_codes.code` too small for the stored hash.

## 11. Prohibited

- Committing secrets.
- Disabling validation, authorization, rate limiting, or sanitization.
- Adding `eval`, `new Function`, or dynamic `require`.
- Logging sensitive data.
- Bypassing the session/role model.
