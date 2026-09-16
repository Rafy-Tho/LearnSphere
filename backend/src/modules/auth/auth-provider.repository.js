import pgPool from "../../config/database.js";

class AuthProviderRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async findByProvider({ provider, providerUserId }, client = this.db) {
    const query = `
      SELECT id, user_id, provider, provider_user_id, provider_email,
             created_at, updated_at
      FROM user_auth_providers
      WHERE provider = $1 AND provider_user_id = $2
    `;
    const result = await client.query(query, [provider, providerUserId]);

    return result.rows[0];
  }

  async findByUserAndProvider({ userId, provider }, client = this.db) {
    const query = `
      SELECT id, user_id, provider, provider_user_id, provider_email,
             created_at, updated_at
      FROM user_auth_providers
      WHERE user_id = $1 AND provider = $2
    `;
    const result = await client.query(query, [userId, provider]);

    return result.rows[0];
  }

  async create(
    { userId, provider, providerUserId, providerEmail },
    client = this.db,
  ) {
    const query = `
      INSERT INTO user_auth_providers
        (user_id, provider, provider_user_id, provider_email)
      VALUES ($1, $2, $3, $4)
      RETURNING id, user_id, provider, provider_user_id, provider_email,
                created_at, updated_at
    `;
    const result = await client.query(query, [
      userId,
      provider,
      providerUserId,
      providerEmail,
    ]);

    return result.rows[0];
  }
}

export { AuthProviderRepository };
export default new AuthProviderRepository();
