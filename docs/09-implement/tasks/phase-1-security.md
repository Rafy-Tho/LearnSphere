# Phase 1 — P0 Security & Data Integrity

Critical security and data-integrity fixes. Must land first.

**Plan references:** [`security-plan.md`](../../08-refactoring/security-plan.md), [`backend-plan.md`](../../08-refactoring/backend-plan.md) §5, [`codebase-audit.md`](../../08-refactoring/codebase-audit.md) §4

| ID | Task | Plan ref | Status | Notes |
|---|---|---|---|---|
| P0-1 | Strip `is_correct`/explanations from learner quiz responses | security §4 | ⬜ | Needs server-side grading (frontend uses `is_correct`) |
| P0-2 | Fix password reset (secure random, salted/HMAC, column width) | security §2 | ✅ | `crypto.randomInt` + HMAC-SHA256 pepper; column widened to VARCHAR(255) |
| P0-3 | Stop returning password hashes (dashboard, admin update) | security §4 | ✅ | `getInstructors`/`updateById` now select explicit columns |
| P0-4 | Add `authorize` + ownership to quiz options POST/PATCH/DELETE | security §3 | ✅ | `authorize` + `assertOwnership` via question instructor |
| P0-5 | Webhook: idempotency + transaction + amount/payment_status fix | security §6 | ✅ | idempotent by payment intent; transactional; email amount fixed |
| P0-6 | Enforce subscription/enrollment on enroll, completion, review | security §3 | ✅ | subscription check on enroll; enrollment check on completion/review |
| P0-7 | Session invalidation on password change/reset; status check | security §2 | 🟡 | status check done; session invalidation pending |
| P0-8 | Add `withTransaction`; wrap multi-step writes | backend §5 | ✅ | register, enroll, admin create user, reset |
| P0-9 | Remove hardcoded admin temp password | security §6 | ⬜ | Needs invite flow (frontend); D-09 |
| P0-10 | Add validators to all unvalidated write endpoints | security §4 | ✅ | options, enroll, progress, completions, payment, admin routes |
| P0-11 | Fix account enumeration + login timing | security §2 | ✅ | generic reset responses; dummy bcrypt; register 409 |
| P0-12 | Wire `loginLimiter`; add per-account throttling | security §5 | 🟡 | `loginLimiter` wired; per-account throttling pending |
| P0-13 | CSRF strategy + security headers (`helmet`) | security §5 | ⬜ | `helmet` = new dependency; CSRF needs D-06 |
| P0-14 | Env validation; remove `Origin`-based Stripe redirects | security §6 | ✅ | env fail-fast; redirects use `CLIENT_URL_1` |
| P0-15 | Resolve schema drift (D1–D4) | db §6 | ✅ | `lesson_contents`, `lessons.access_type`, reset-code width, quizzes unique — schema.sql + migration 0001 |

Verification checklist: [`security-verification.md`](./security-verification.md).
