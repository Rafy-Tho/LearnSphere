# Database Migrations

See [`backend/02-migration-plan.md`](../../08-refactoring/backend/02-migration-plan.md).

> **Status:** 🟡 In progress. The full baseline suite + drift fixes are written and
> lint-clean, but nothing has been applied to the live database yet and the
> post-apply verification below is still open.

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
| Apply migrations to live database | ⬜ | Run `npm run db:migrate` against the target DB |

Drift decisions: D1–D4 (P0-15), D5 obsolete (`modules.icon_name` never existed),
D6 drop `helpful_count` (D-08), D7 indexes (P1-5), D8 soft delete (D-01/P1-7).

## Remaining Work (in progress)

| # | Task | Status | Notes |
|---|---|---|---|
| DM-1 | Reconcile old `schema_migrations` `0001` row, if present | ⬜ | `DELETE FROM schema_migrations WHERE version='0001';` |
| DM-2 | Verify fresh `schema.sql` == migrated schema | ⬜ | `pg_dump --schema-only` diff on two scratch DBs |
| DM-3 | Verify idempotency (second run is a no-op) | ⬜ | `npm run db:migrate` twice; `npm run db:status` |
| DM-4 | `EXPLAIN` confirms the D7 indexes are used | ⬜ | course list, completions, reset-code lookups |
| DM-5 | Smoke-test previously broken flows | ⬜ | password reset, `GET /courses/:id/learn`, admin course detail, multi-question quizzes |
