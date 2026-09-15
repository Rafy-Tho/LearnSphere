# Database Migrations

See [`backend/02-migration-plan.md`](../../08-refactoring/backend/02-migration-plan.md).

> **Status:** ✅ Done (2026-09-15). The suite is applied to the live database and
> DM-1–DM-5 are verified. See the residual legacy-object note under DM-2.

Approach: `db/schema.sql` remains the canonical baseline for fresh installs;
incremental, idempotent migrations are applied to existing databases via
`db/migrate.js` (plain SQL, no new deps).

| Migration | Status | Notes |
|---|---|---|
| `0001_extensions_enums.sql` | ✅ | `pgcrypto` + `pg_trgm`, 9 enum types |
| `0002_trigger_function.sql` | ✅ | `set_updated_at()` |
| `0003_identity.sql` | ✅ | `users`, `user_profiles`, `password_reset_codes` |
| `0004_catalog.sql` | ✅ | `categories`, `courses`, `course_objectives` |
| `0005_content.sql` | ✅ | `modules`, `chapters`, `lessons`, `lesson_contents`, `quizzes`, `quiz_options` |
| `0006_learning.sql` | ✅ | `enrollments`, `learn_progress`, `lesson_completion`, `certificates` |
| `0007_billing.sql` | ✅ | `subscription_plans`, `user_subscriptions`, `subscription_payments` |
| `0008_reviews.sql` | ✅ | `course_reviews`, `review_helpful_votes`, `review_reports` |
| `0009_indexes.sql` | ✅ | all explicit indexes + D7/PERF-4 indexes + trigram |
| `0010_triggers.sql` | ✅ | 18 `updated_at` triggers |
| `0011_drift_fixes.sql` | ✅ | D1–D4, D6 (renamed from old `0001_drift_fixes.sql`) |
| `migrate.js` runner | ✅ | `npm run db:migrate` / `npm run db:status` |
| `schema_migrations` tracking | ✅ | |
| `db/README.md` | ✅ | how to run + reconciliation note |
| Baseline for fresh installs | ✅ | `db/schema.sql` (kept in sync with migrations) |
| Apply migrations to live database | ✅ | `npm run db:migrate` applied `0001`–`0011` (2026-09-15) |

Drift decisions: D1–D4 (P0-15), D5 obsolete (`modules.icon_name` never existed),
D6 drop `helpful_count` (D-08), D7 indexes (P1-5), D8 soft delete (D-01/P1-7).

## Remaining Work (verified 2026-09-15)

| # | Task | Status | Notes |
|---|---|---|---|
| DM-1 | Reconcile old `schema_migrations` `0001` row, if present | ✅ | None present; `0001`–`0011` now recorded. |
| DM-2 | Verify fresh `schema.sql` == migrated schema | ✅ | Two scratch DBs; `pg_dump --schema-only` diff differs only by a random `pg_dump` `\restrict` token and a trailing space in `set_updated_at()`. |
| DM-3 | Verify idempotency (second run is a no-op) | ✅ | Second `db:migrate` prints "Migrations up to date"; `db:status` shows all `[x]`. |
| DM-4 | `EXPLAIN` confirms the D7 indexes are used | ✅ | Index Scan/Bitmap chosen for category, instructor, active-created, completion, reset-code and trigram queries. The composite `idx_courses_catalog` is present but not preferred at 365 rows. |
| DM-5 | Smoke-test previously broken flows | ✅ | `GET /courses/:id/learn` → 200; transactional checks pass for D1–D4 + soft delete. |

### Residual note (live DB only)

The live database predates the baseline with legacy object names. Because its
`lesson_content` table had already been renamed to `lesson_contents` manually,
`0011`'s D1 rename is skipped, so its child objects keep the old names and the
canonical `0009`/`0010` objects are added alongside them. Functionally harmless
redundancy on this one database:

- duplicate index `idx_lesson_content_lesson` + `idx_lesson_contents_lesson`
- duplicate trigger `trg_lesson_content_updated_at` + `trg_lesson_contents_updated_at`
- duplicate unique constraint `unique_lesson_position` + `unique_quizzes_lesson_position`

A fresh install or a database that actually has `lesson_content` converges to the
canonical names. Add a normalization migration only if the live DB must match
`schema.sql` object-for-object.

