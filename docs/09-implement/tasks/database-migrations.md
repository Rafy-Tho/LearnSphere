# Database Migrations

See [`backend/02-migration-plan.md`](../../08-refactoring/backend/02-migration-plan.md).

Approach adopted: `db/schema.sql` remains the baseline for fresh installs; incremental migrations are applied to existing databases via `db/migrate.js`.

| Migration | Status | Notes |
|---|---|---|
| `0001_drift_fixes.sql` | ✅ | `lesson_contents`, `lessons.access_type`, reset-code width, `quizzes` unique |
| `migrate.js` runner | ✅ | `npm run db:migrate` / `npm run db:status` |
| `schema_migrations` tracking | ✅ | |
| Baseline for fresh installs | ✅ | `db/schema.sql` (updated to canonical schema) |
| Full from-scratch baseline migrations | ⏭️ | Not needed; `schema.sql` is the baseline |
| Apply `0001` to live database | ⬜ | Run `npm run db:migrate` against the target DB |
