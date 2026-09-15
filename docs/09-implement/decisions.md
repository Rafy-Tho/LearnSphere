# Decisions Log

Decisions that block or shape dependent work. Record a decision here **before** starting the tasks that depend on it.

**Status legend:** ⬜ Open · 🟡 In progress · ✅ Decided

| # | Decision | Options | Status | Chosen | Date | Notes |
|---|---|---|---|---|---|---|
| D-01 | Course delete semantics | Hard delete vs soft delete (`deleted_at`) | ⬜ | | | Blocks P1-7 |
| D-02 | Canonical lesson-content table name | `lesson_content` vs `lesson_contents` | ✅ | `lesson_contents` | 2026-09-15 | Matches code; schema.sql + migration 0001 |
| D-03 | `lessons.access_type` | Add column vs remove code usage | ✅ | Add column | 2026-09-15 | `access_course_type DEFAULT 'FREE'` |
| D-04 | `quizzes.lesson_id` unique | Drop constraint vs keep one-question model | ✅ | Drop constraint | 2026-09-15 | Keep `(lesson_id, position)` unique |
| D-05 | Reset-code hashing | bcrypt vs HMAC-SHA256 + pepper | ✅ | HMAC-SHA256 + pepper | 2026-09-15 | Pepper = `SESSION_SECRET`; code via `crypto.randomInt` |
| D-06 | CSRF strategy | Same-site + `sameSite=lax` vs CSRF tokens | ⬜ | | | Blocks P0-13 |
| D-07 | Migration tooling | Plain SQL runner vs `node-pg-migrate` | ⬜ | | | Needs dependency approval |
| D-08 | `course_reviews.helpful_count` | Maintain vs drop | ⬜ | | | Schema drift D6 |
| D-09 | Admin temp password | Email invite vs keep | ⬜ | | | Blocks P0-9 |

## Related

- Tasks: [`tasks/`](./tasks/)
- Progress: [`progress-tracking.md`](./progress-tracking.md)
- Security plan: [`../08-refactoring/security-plan.md`](../08-refactoring/security-plan.md)
- Migration plan: [`../08-refactoring/backend/02-migration-plan.md`](../08-refactoring/backend/02-migration-plan.md)
