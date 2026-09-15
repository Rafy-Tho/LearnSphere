# Database

PostgreSQL schema for the backend. Raw SQL only (`pg`), no ORM.

## Files

| File | Purpose |
|---|---|
| `schema.sql` | Canonical baseline for **fresh installs** (all tables, enums, indexes, triggers). |
| `migrations/` | Ordered, forward-only migrations for **existing** databases. |
| `migrate.js` | Minimal runner using the existing `pg` pool (no new deps). |

`migrate.js` tracks applied versions in `schema_migrations (version, name, applied_at)`,
runs each `migrations/*.sql` file in lexical order inside a transaction, and skips
already-applied versions. Migrations are idempotent and safe to re-run.

## Commands

Run from `backend/` with a valid `.env` (`DATABASE_URL`):

```bash
npm run db:migrate   # apply pending migrations
npm run db:status    # list applied / pending migrations
```

## Fresh install

```bash
psql "$DATABASE_URL" -f src/db/schema.sql
```

A fresh install via `schema.sql` and a migrated database must produce the same
schema. Verify with `pg_dump --schema-only` on two scratch databases.

## Existing database

1. **Back up first:** `pg_dump "$DATABASE_URL" > backup.sql`.
2. Apply to staging before production.
3. Run `npm run db:migrate`.

The baseline (`0001`–`0010`) is idempotent, so on a database that already has the
tables it is a no-op except for new indexes and re-created triggers; `0011`
applies the drift fixes (D1–D4, D6).

### Upgrading from the old `0001_drift_fixes.sql`

The original drift migration was renamed to `0011_drift_fixes.sql`. If a
`schema_migrations` row for version `0001` already exists (from the old file),
remove it before running, then re-run — the new `0001` is idempotent:

```sql
DELETE FROM schema_migrations WHERE version = '0001';
```

## Rules

- Forward-only; no automatic `down`. Roll back by restoring a backup.
- Never edit an applied migration; add a new one.
- Keep `schema.sql` and `migrations/` in sync.
- DDL and data backfills are separate files.
