# Database Migration Plan

Plan to introduce versioned migrations and migrate **all 22 tables** from the current single-file schema. Part of the backend refactor series under `docs/08-refactoring/backend/`. See also [`./01-structure.md`](./01-structure.md) and [`../backend-audit.md`](../backend-audit.md) §8.

> **Status:** Implemented and applied (2026-09-15). Baseline suite `0001`–`0010` + `0011_drift_fixes.sql` live in `backend/src/db/migrations/`; `db/schema.sql` is kept in sync. `0001`–`0011` have been applied to the live database; see [`../../09-implement/tasks/database-migrations.md`](../../09-implement/tasks/database-migrations.md) for verification (DM-1–DM-5).

---

## 1. Current State

- Single DDL file: `backend/src/configs/schema.sql` (~460 lines).
- **No migrations, no versioning, no seeds.** Schema is applied manually (`psql "$DATABASE_URL" -f schema.sql`).
- 22 declared tables + 9 enum types + 1 trigger function + 18 `updated_at` triggers + ~19 indexes.
- `session` table is created at runtime by `connect-pg-simple` (`createSessionTableIfMissing: true`).
- **Known drift** between `schema.sql` and the code (must be resolved by the migrations):
  - `LessonContentRepository` queries `lesson_contents`; schema defines `lesson_content`.
  - Code references `lessons.access_type`; column does not exist.
  - `password_reset_codes.code VARCHAR(6)` but a 64-char SHA-256 is stored.
  - `quizzes.lesson_id UNIQUE` blocks many questions per lesson.
  - `modules.icon_name` used by code but not defined.
  - `course_reviews.helpful_count` never maintained.

---

## 2. Goals

- Version every schema change so environments are reproducible.
- Migrate all tables into ordered, reviewable migration files.
- Resolve the known schema drift safely.
- Keep the existing `schema.sql` as the baseline for fresh installs.
- No new runtime dependencies.

---

## 3. Target DB Folder Structure

```text
backend/src/db/
├── migrations/
│   ├── 0001_extensions_enums.sql
│   ├── 0002_trigger_function.sql
│   ├── 0003_identity.sql
│   ├── 0004_catalog.sql
│   ├── 0005_content.sql
│   ├── 0006_learning.sql
│   ├── 0007_billing.sql
│   ├── 0008_reviews.sql
│   ├── 0009_indexes.sql
│   ├── 0010_triggers.sql
│   └── 0011_drift_fixes.sql
├── migrate.js            # minimal runner (pg only, no new deps)
├── schema.sql            # canonical baseline (all tables, idempotent)
└── README.md             # how to run migrations
```

> Alternative: a tool such as `node-pg-migrate`. Not adopted here because the project rules forbid new dependencies without approval; the plain-SQL runner uses the existing `pg` pool.

### 3.1 Runner behaviour (`migrate.js`)

- Creates a `schema_migrations` table (`version`, `name`, `applied_at`).
- Reads `migrations/*.sql` in lexical order.
- Skips applied versions; wraps each file in a transaction; records success.
- Exposes `up` (apply pending) and `status` (list applied/pending).
- No destructive `down` by default (forward-only); rollback is by backup/restore.

---

## 4. Migration Strategy

- **Forward-only**, ordered, idempotent where possible (`IF NOT EXISTS`, `CREATE OR REPLACE`).
- Each migration is a single logical change and is committed with the code that needs it.
- `schema.sql` is kept in sync and remains the source of truth for fresh databases.
- Data migrations (backfills) are separate from DDL migrations.
- Apply to a staging copy first; back up production before running.

---

## 5. Baseline Migration (all tables)

The baseline reproduces the current intended schema. Table inventory (22 declared + runtime `session`):

### 5.1 Identity — `0003_identity.sql`
| Table | Depends on |
|---|---|
| `users` | — |
| `user_profiles` | `users` |
| `password_reset_codes` | `users` |

### 5.2 Catalog — `0004_catalog.sql`
| Table | Depends on |
|---|---|
| `categories` | — |
| `courses` | `users`, `categories` |
| `course_objectives` | `courses` |

### 5.3 Content — `0005_content.sql`
| Table | Depends on |
|---|---|
| `modules` | `courses` |
| `chapters` | `modules` |
| `lessons` | `chapters` |
| `lesson_contents` | `lessons` |
| `quizzes` | `lessons` |
| `quiz_options` | `quizzes` |

### 5.4 Learning — `0006_learning.sql`
| Table | Depends on |
|---|---|
| `enrollments` | `users`, `courses` |
| `learn_progress` | `users`, `courses`, `lessons` |
| `lesson_completion` | `users`, `courses`, `lessons` |
| `certificates` | `users`, `courses` |

### 5.5 Billing — `0007_billing.sql`
| Table | Depends on |
|---|---|
| `subscription_plans` | — |
| `user_subscriptions` | `users`, `subscription_plans` |
| `subscription_payments` | `user_subscriptions` |

### 5.6 Reviews — `0008_reviews.sql`
| Table | Depends on |
|---|---|
| `course_reviews` | `users`, `courses` |
| `review_helpful_votes` | `users`, `course_reviews` |
| `review_reports` | `users`, `course_reviews` |

### 5.7 Runtime table
| Table | Created by | Migration handling |
|---|---|---|
| `session` | `connect-pg-simple` (`createTableIfMissing`) | Leave to the library; optionally declare it in a migration for clarity |

### 5.8 Enums, triggers, indexes
- `0001_extensions_enums.sql`: `CREATE EXTENSION IF NOT EXISTS pgcrypto;` + all 9 enum types (`user_role`, `user_status`, `course_level`, `content_status`, `lesson_type`, `subscription_status`, `payment_status`, `access_course_type`, `gender`).
- `0002_trigger_function.sql`: `set_updated_at()`.
- `0009_indexes.sql`: all explicit indexes + unique constraints.
- `0010_triggers.sql`: the 18 `BEFORE UPDATE` triggers.

---

## 6. Known Drift Fixes (`0011_drift_fixes.sql`)

Resolve each drift item explicitly. Decide and record the canonical choice before writing the migration.

| # | Drift | Decision needed | Migration action |
|---|---|---|---|
| D1 | `lesson_contents` (code) vs `lesson_content` (schema) | Canonical table name | Rename table to the canonical name **or** rename in the repository; add a migration if renaming the table |
| D2 | `lessons.access_type` referenced by code, absent | Add column or remove code usage | If adding: `ALTER TABLE lessons ADD COLUMN access_type access_course_type DEFAULT 'FREE'` |
| D3 | `password_reset_codes.code VARCHAR(6)` stores 64-char hash | Widen column | `ALTER TABLE password_reset_codes ALTER COLUMN code TYPE VARCHAR(255)` (and hash with salt/HMAC in code) |
| D4 | `quizzes.lesson_id UNIQUE` blocks many questions | Drop unique constraint | `ALTER TABLE quizzes DROP CONSTRAINT <name>`; keep `(lesson_id, position)` unique |
| D5 | `modules.icon_name` used by code, absent | Add column or remove code | **Obsolete** — no reference in code or schema; no action |
| D6 | `course_reviews.helpful_count` never maintained | Maintain or drop | **Drop** (D-08): `ALTER TABLE course_reviews DROP COLUMN IF EXISTS helpful_count` |
| D7 | Missing indexes (audit PERF-4) | Add indexes | Applied in `0009_indexes.sql`: `courses(category_id)`, `courses(instructor_id)`, `courses(category_id,instructor_id,status,deleted_at)`, partial `courses(created_at)`, `lesson_completion(user_id,course_id)`, `password_reset_codes(user_id)`, `pg_trgm` GIN on course name/description |
| D8 | Hard delete vs `courses.deleted_at` soft delete | Choose semantics | **Soft delete** (D-01): `Course.delete` sets `deleted_at`; reads filter `deleted_at IS NULL` |

> D1–D4 currently break features (password reset, learn, content, multi-question quizzes). Fixing them is a **P0** item (see [`../codebase-audit.md`](../codebase-audit.md) §3.1).

---

## 7. Execution Order

Dependency-safe order:

```text
0001 extensions + enums
0002 trigger function
0003 identity        (users → user_profiles → password_reset_codes)
0004 catalog         (categories → courses → course_objectives)
0005 content         (modules → chapters → lessons → lesson_content → quizzes → quiz_options)
0006 learning        (enrollments → learn_progress → lesson_completion → certificates)
0007 billing         (subscription_plans → user_subscriptions → subscription_payments)
0008 reviews         (course_reviews → review_helpful_votes → review_reports)
0009 indexes
0010 triggers
0011 drift fixes
```

For an **existing** database: apply `0001`–`0010` as no-ops (idempotent guards) or mark them applied, then run `0011` for the drift. For a **fresh** database: run all in order.

---

## 8. Rollback

- Forward-only migrations; no automatic `down`.
- Before applying: `pg_dump` the database.
- Rollback = restore the backup, then re-run migrations from a known version.
- For destructive changes (column drop, table rename), provide a reversible data step (e.g. copy column before drop) and verify on staging.

---

## 9. Verification

```text
Backup
  ↓
Apply on staging
  ↓
Run migrate status
  ↓
Verify schema + data
  ↓
Apply to production
  ↓
Smoke-test affected endpoints
```

Checklist:
- [ ] `schema_migrations` records each applied version.
- [ ] Re-running `migrate.js` is a no-op (idempotent).
- [ ] All 22 tables + `session` exist; enums, indexes, and triggers present.
- [ ] Drift items D1–D4 resolved and the previously broken endpoints work (password reset, `GET /courses/:id/learn`, admin course detail, multiple quiz questions).
- [ ] FK/cascade behavior unchanged.
- [ ] `EXPLAIN` confirms new indexes are used.
- [ ] Fresh install via `schema.sql` matches a migrated database.

---

## 10. Rules

- One logical change per migration; never edit an applied migration.
- Keep `schema.sql` and the migrations in sync.
- DDL and data backfills are separate files.
- No destructive change without a backup and a staging run.
- Resolve drift deliberately; do not silently change table names used by the code.
- Update this document and [`../backend-audit.md`](../backend-audit.md) when drift is resolved.
