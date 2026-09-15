# Decisions Log

Decisions that block or shape dependent work. Record a decision here **before** starting the tasks that depend on it.

**Status legend:** ⬜ Open · 🟡 In progress · ✅ Decided

| # | Decision | Options | Status | Chosen | Date | Notes |
|---|---|---|---|---|---|---|
| D-01 | Course delete semantics | Hard delete vs soft delete (`deleted_at`) | ✅ | Soft delete | 2026-09-15 | `deleted_at` kept; reads filter; `Course.delete` sets it (P1-7) |
| D-02 | Canonical lesson-content table name | `lesson_content` vs `lesson_contents` | ✅ | `lesson_contents` | 2026-09-15 | Matches code; schema.sql + migration 0001 |
| D-03 | `lessons.access_type` | Add column vs remove code usage | ✅ | Add column | 2026-09-15 | `access_course_type DEFAULT 'FREE'` |
| D-04 | `quizzes.lesson_id` unique | Drop constraint vs keep one-question model | ✅ | Drop constraint | 2026-09-15 | Keep `(lesson_id, position)` unique |
| D-05 | Reset-code hashing | bcrypt vs HMAC-SHA256 + pepper | ✅ | HMAC-SHA256 + pepper | 2026-09-15 | Pepper = `SESSION_SECRET`; code via `crypto.randomInt` |
| D-06 | CSRF strategy | Same-site + `sameSite=lax` vs CSRF tokens vs JSON-only + custom header | ✅ | JSON-only + custom header | 2026-09-15 | State-changing requests require `application/json` + `X-Requested-With`; all clients already send JSON. Blocks SH-2 |
| D-07 | Migration tooling | Plain SQL runner vs `node-pg-migrate` | ✅ | Plain SQL runner | 2026-09-15 | No new deps; `db/migrate.js` + `schema_migrations` |
| D-08 | `course_reviews.helpful_count` | Maintain vs drop | ✅ | Drop column | 2026-09-15 | Never maintained; count derives from `review_helpful_votes` |
| D-09 | Admin temp password | Email invite vs keep | ✅ | Email invite/reset flow | 2026-09-15 | Replace hardcoded `TempPassword123!`. Blocks SH-7.2 |
| D-10 | Guest `GET /users/me` semantics | `200` + `data:null` vs `401` | ✅ | `200` + `data:null` | 2026-09-15 | Intentional; admin treats `null` as guest. Blocks AP-5.4 |
| D-11 | Quiz answer-key exposure | Gate route vs server-side scoring vs split endpoints | ✅ | Gate to enrolled learners | 2026-09-15 | ~~Keep `is_correct`/`explanation` (client scores)~~ **Superseded by D-15** (server-side grading). |
| D-12 | Pagination rollout | Growing lists only vs all lists vs bug-fixes-only | ✅ | Growing lists only | 2026-09-15 | Small child collections stay unpaginated; consumer updates required for admin lists. Blocks AP-3.3/3.4/3.5 |
| D-13 | Absent sub-resource semantics | `200` + `data:null` vs `404` | ✅ | `200` + `data:null` | 2026-09-15 | Frontend guards rely on `null`; `404` reserved for missing parent resources. Blocks AP-5.3 |
| D-14 | Endpoint rename migration strategy | In-place vs `/api/v2` vs legacy aliases | ✅ | In-place + update consumers | 2026-09-15 | No known external clients except Stripe webhook; update frontend/admin/Stripe in the same change. Blocks ER-1…ER-12 |
| D-15 | Quiz answer-key protection | Client-side scoring vs server-side grading endpoint | ✅ | Server-side grading endpoint | 2026-09-15 | Supersedes D-11. Learner payload drops `is_correct`/`explanation`; `POST /lessons/:lessonId/quiz-submissions` grades. Blocks SH-1 |
| D-16 | Registration account enumeration | Generic success (no auto-login) vs generic message vs defer | ✅ | Generic success, no auto-login | 2026-09-15 | New and existing emails return the same `201`; frontend routes to `/login`. Closes enumeration without email verification. Blocks SH-6.2 |

## Related

- Tasks: [`tasks/`](./tasks/)
- Progress: [`progress-tracking.md`](./progress-tracking.md)
- Security plan: [`../08-refactoring/security-plan.md`](../08-refactoring/security-plan.md)
- Backend security plan: [`../08-refactoring/backend/06-security.md`](../08-refactoring/backend/06-security.md)
- Security tasks: [`tasks/security-hardening.md`](./tasks/security-hardening.md)
- Migration plan: [`../08-refactoring/backend/02-migration-plan.md`](../08-refactoring/backend/02-migration-plan.md)
- API plan: [`../08-refactoring/backend/03-api.md`](../08-refactoring/backend/03-api.md)
