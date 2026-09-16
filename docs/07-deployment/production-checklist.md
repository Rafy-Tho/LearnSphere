# Production Checklist

Use this checklist before and after each production release.

## 1. Configuration & Secrets

- [ ] `NODE_ENV=production`.
- [ ] `SESSION_SECRET` is long, random, and unique to production.
- [ ] `DATABASE_URL` points to the production database with SSL as required.
- [ ] `CLIENT_URL_1` and `CLIENT_URL_2` are exact HTTPS production origins (no wildcards).
- [ ] Stripe keys are production/live keys; `STRIPE_WEBHOOK_SECRET` matches the live endpoint.
- [ ] Cloudinary and Brevo credentials are production credentials.
- [ ] Google OAuth (if enabled): production `GOOGLE_CALLBACK_URL` is registered in Google Cloud Console and matches exactly.
- [ ] No secrets are committed; `.env` files are gitignored.
- [ ] Frontend builds use the production `VITE_BASE_URL`.

## 2. Database

- [ ] `schema.sql` applied to the production database.
- [ ] `pgcrypto` extension available.
- [ ] Backup taken before any schema change.
- [ ] `session` table present (created on first backend start).
- [ ] At least one `ADMIN` user exists.
- [ ] Known schema drift resolved (see `database-design.md` §9) or features disabled.
- [ ] Connection pool limits (`max: 10`) are appropriate for the instance count.

## 3. Security

- [ ] HTTPS enforced end to end; HTTP redirects to HTTPS.
- [ ] `trust proxy` enabled and the proxy forwards `X-Forwarded-Proto`.
- [ ] Session cookie is `Secure`, `HttpOnly`, `SameSite=None`.
- [ ] CORS allowlist verified from a disallowed origin.
- [ ] Global rate limiting active; consider enabling `loginLimiter`.
- [ ] Security headers added (recommend `helmet`).
- [ ] DOMPurify sanitization active for lesson content.
- [ ] Upload type/size limits enforced.
- [ ] Stripe webhook signature verification active.
- [ ] Known gaps reviewed: option POST authorization, missing option validators, `is_correct` exposure, no CSRF token.
- [ ] Dependencies audited (`npm audit`) and patched.

## 4. Build & Deploy

- [ ] Backend pinned to Node 22.22.2.
- [ ] `npm ci` used (lockfiles committed).
- [ ] Frontends built successfully (`npm run build`).
- [ ] Lint passes (`npm run lint` for frontends, `npx eslint .` for backend).
- [ ] Static assets deployed and cache headers set.
- [ ] Previous release retained for rollback.

## 5. Functional Verification

- [ ] Register a new user.
- [ ] Log in and confirm the session persists across refresh.
- [ ] Log out clears the session.
- [ ] Password reset email delivers and the flow completes.
- [ ] Course list, filters, and search work.
- [ ] Enroll and open the first lesson.
- [ ] Complete a lesson and verify progress on the dashboard.
- [ ] Take a quiz and see results.
- [ ] Submit a review and see the summary update.
- [ ] Claim a certificate when eligible.
- [ ] Stripe checkout completes; webhook activates the subscription; email arrives.
- [ ] Admin login and dashboard stats load.
- [ ] Admin CRUD for categories, courses, content, users, and billing works.
- [ ] Profile image upload reaches Cloudinary.

## 6. Monitoring & Observability

- [ ] Uptime monitoring on an API endpoint.
- [ ] Error tracking configured (e.g. Sentry) — currently absent.
- [ ] Structured request logging in production — currently only Morgan in dev.
- [ ] Alerts for 5xx spikes and webhook failures.
- [ ] Database connection/error logs monitored.
- [ ] Payment webhook delivery monitored in Stripe.

## 7. Performance

- [ ] Database indexes reviewed for list/dashboard queries (see `database-design.md` §9).
- [ ] Static assets compressed and cached.
- [ ] Query pagination limits enforced.
- [ ] React Query caching defaults reviewed (client currently has no global defaults).

## 8. Compliance & Data

- [ ] Privacy policy and terms available (UI references terms acceptance).
- [ ] User data deletion path understood (cascade behavior documented).
- [ ] Payment records retained per policy.
- [ ] Backups scheduled and restore tested.

## 9. Rollback Readiness

- [ ] Rollback procedure documented and tested.
- [ ] Database backup restore verified.
- [ ] Stripe webhook can be repointed to the previous backend version.
- [ ] Frontend rollback available via static host versioning.

## 10. Sign-Off

| Role | Name | Date |
|---|---|---|
| Developer | | |
| Reviewer | | |
| Operator | | |
