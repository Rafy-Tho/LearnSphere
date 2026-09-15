-- 0012_login_lockout.sql
-- Per-account login lockout (SH-5): failed-attempt counter + lock window.
-- Idempotent: safe to re-run.
--
-- Rollback (manual; the runner is forward-only):
--   ALTER TABLE users DROP COLUMN IF EXISTS failed_login_attempts;
--   ALTER TABLE users DROP COLUMN IF EXISTS locked_until;

ALTER TABLE users
  ADD COLUMN IF NOT EXISTS failed_login_attempts INTEGER NOT NULL DEFAULT 0;

ALTER TABLE users
  ADD COLUMN IF NOT EXISTS locked_until TIMESTAMP WITH TIME ZONE;
