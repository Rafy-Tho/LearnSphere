-- 0013_email_verification.sql
-- Email verification: users.email_verified_at + dedicated code table.
-- Idempotent: safe to re-run.
--
-- Existing users keep email_verified_at = NULL and are asked to verify the
-- first time they log in after this migration.
--
-- Rollback (manual; the runner is forward-only):
--   DROP TABLE IF EXISTS email_verification_codes;
--   ALTER TABLE users DROP COLUMN IF EXISTS email_verified_at;

ALTER TABLE users
  ADD COLUMN IF NOT EXISTS email_verified_at TIMESTAMP WITH TIME ZONE;

CREATE TABLE IF NOT EXISTS email_verification_codes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  code VARCHAR(255) NOT NULL,
  attempts INTEGER DEFAULT 0,
  expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_email_verification_codes_user
  ON email_verification_codes (user_id);

DROP TRIGGER IF EXISTS trg_email_verification_codes_updated_at
  ON email_verification_codes;
CREATE TRIGGER trg_email_verification_codes_updated_at
BEFORE UPDATE ON email_verification_codes
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
