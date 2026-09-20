# Database

PostgreSQL schema for the backend. Raw SQL only (`pg`), no ORM.

## Files

| File | Purpose |
|---|---|
| `migrations/` | The single source of truth for the schema. Ordered, CREATE-only, idempotent. |
| `migrate.js` | Migration runner (no new deps; uses the existing `pg` pool). |
| `seeds/` + `seed.js` | Optional sample data; runner mirrors `migrate.js`. |

The migrations build a complete database **from scratch**. There is no separate
baseline file: running the migrations on an empty database creates the whole
schema (tables, enums, indexes, triggers).

`migrate.js` tracks applied versions in `schema_migrations (version, name, applied_at)`,
runs each `migrations/*.sql` file in lexical order inside a transaction, and skips
already-applied versions. Migrations are idempotent and safe to re-run.

## Commands

Run from `backend/` with a valid `.env` (`DATABASE_URL`):

```bash
npm run db:migrate   # create/upgrade the schema (apply pending migrations)
npm run db:status    # list applied / pending migrations
```

## Fresh database

```bash
# with an empty database
npm run db:migrate
```

## Applying schema changes

Add a new numbered migration in `migrations/` (e.g. `0012_<name>.sql`). Prefer
`CREATE ... IF NOT EXISTS` / `DROP ... IF EXISTS` so it is safe to re-run.

## Rules

- Forward-only; no automatic `down`. Roll back by restoring a backup.
- Migrations are the source of truth; there is no `schema.sql`.
- Never edit an applied migration; add a new one.
- DDL and data backfills are separate files.
- A migration that is not safe to replay on a fresh database is a bug.
