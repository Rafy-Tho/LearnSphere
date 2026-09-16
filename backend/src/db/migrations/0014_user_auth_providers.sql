-- 0014_user_auth_providers.sql
-- External identity providers (Google OAuth) + nullable password for
-- provider-only accounts. Idempotent: safe to re-run.
--
-- A user may authenticate with email/password and/or one or more linked
-- providers. The unique (provider, provider_user_id) constraint guarantees a
-- provider identity maps to exactly one user.
--
-- Rollback (manual; the runner is forward-only):
--   DROP TABLE IF EXISTS user_auth_providers;
--   ALTER TABLE users ALTER COLUMN password SET NOT NULL;

CREATE TABLE IF NOT EXISTS user_auth_providers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  provider VARCHAR(50) NOT NULL,
  provider_user_id VARCHAR(255) NOT NULL,
  provider_email VARCHAR(255),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_user_auth_provider UNIQUE (provider, provider_user_id)
);

CREATE INDEX IF NOT EXISTS idx_user_auth_providers_user
  ON user_auth_providers (user_id);

DROP TRIGGER IF EXISTS trg_user_auth_providers_updated_at
  ON user_auth_providers;
CREATE TRIGGER trg_user_auth_providers_updated_at
BEFORE UPDATE ON user_auth_providers
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- Provider-only users (e.g. Google) have no local password.
ALTER TABLE users ALTER COLUMN password DROP NOT NULL;
