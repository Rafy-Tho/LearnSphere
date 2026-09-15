# Security Verification Checklist

From [`security-plan.md`](../../08-refactoring/security-plan.md) §8.1. Tick items as they are verified.

- [ ] Suspended user cannot log in.
- [ ] Login response/time identical for unknown vs wrong-password.
- [ ] `loginLimiter` triggers 429.
- [ ] Password reset works end to end; code hashed.
- [ ] Password change/reset invalidates sessions.
- [ ] Learner cannot POST/PATCH/DELETE options.
- [ ] Learner cannot read another course's dashboard-details.
- [ ] SUBSCRIPTION course requires active subscription to enroll.
- [ ] Completion/review require enrollment.
- [ ] Quiz responses contain no `is_correct`.
- [ ] No endpoint returns `password`.
- [ ] Unvalidated writes return 422.
- [ ] CSRF blocked (or same-site enforced).
- [ ] Security headers present.
- [ ] Env validation fails fast.
- [ ] Stripe redirect ignores spoofed `Origin`.
- [ ] Webhook idempotent.
- [ ] Uploads validate content; `/uploads` not enumerable.
