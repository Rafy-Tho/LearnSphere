import pgPool from "../../config/database.js";

class UserRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({ email, password, name, imageUrl }, client = this.db) {
    const query = `
      INSERT INTO users (email, password, name, image_url)
      VALUES ($1, $2, $3, $4)
      RETURNING id, email, role, status, name, image_url, created_at, updated_at
    `;

    const result = await client.query(query, [email, password, name, imageUrl]);

    return result.rows[0];
  }

  // Provider-only account (e.g. Google): no local password. The provider has
  // already verified the email, so email_verified_at is set immediately.
  async createOAuthUser({ email, name, imageUrl }, client = this.db) {
    const query = `
      INSERT INTO users (email, name, image_url, email_verified_at)
      VALUES ($1, $2, $3, CURRENT_TIMESTAMP)
      RETURNING id, email, role, status, name, image_url, created_at, updated_at
    `;

    const result = await client.query(query, [email, name, imageUrl]);

    return result.rows[0];
  }

  async findByEmail(email) {
    const query = `
      SELECT id, email, role, password, last_login, name, image_url, created_at, updated_at,status,
             failed_login_attempts, locked_until, email_verified_at
      FROM users
      WHERE email = $1
    `;
    const result = await this.db.query(query, [email]);

    return result.rows[0];
  }

  async update({ userId, email, name, imageUrl }) {
    const query = `
      UPDATE users
      SET email = $1, name = $2, image_url = $3
      WHERE id = $4
      RETURNING id, email, name, image_url
    `;

    const result = await this.db.query(query, [email, name, imageUrl, userId]);

    return result.rows[0];
  }

  async createProfile(userId, client = this.db) {
    const query = `
      INSERT INTO user_profiles (user_id)
      VALUES ($1)
      RETURNING user_id
    `;
    const result = await client.query(query, [userId]);

    return result.rows[0];
  }

  async updateProfile({ userId, bio, location, phone, dateBirth, gender }) {
    const query = `
      UPDATE user_profiles
      SET
        bio = $1,
        location = $2,
        phone = $3,
        date_birth = $4,
        gender = $5
      WHERE user_id = $6
      RETURNING *
    `;

    const result = await this.db.query(query, [
      bio,
      location,
      phone,
      dateBirth,
      gender,
      userId,
    ]);

    return result.rows[0];
  }

  async profile(userId) {
    const query = `
      SELECT
        u.id,
        u.email,
        u.name,
        u.image_url,
        u.role,
        up.bio,
        up.location,
        up.phone,
        up.date_birth,
        up.gender,
        up.created_at,
        up.updated_at
      FROM users u
      LEFT JOIN user_profiles up
      ON u.id = up.user_id
      WHERE u.id = $1
    `;

    const result = await this.db.query(query, [userId]);

    return result.rows[0];
  }

  async updatePassword({ userId, passwordHash }, client = this.db) {
    const query = `
      UPDATE users
      SET password = $1
      WHERE id = $2
    `;

    await client.query(query, [passwordHash, userId]);
  }

  async findById(userId) {
    const query = `
      SELECT 
         id, email, role, last_login, name, image_url, password, created_at,
         email_verified_at
      FROM users
      WHERE id = $1
    `;
    const result = await this.db.query(query, [userId]);
    return result.rows[0];
  }

  async markEmailVerified(userId, client = this.db) {
    const query = `
      UPDATE users
      SET email_verified_at = CURRENT_TIMESTAMP
      WHERE id = $1
      RETURNING id, email, role, name, image_url, email_verified_at
    `;
    const result = await client.query(query, [userId]);
    return result.rows[0];
  }
  async updateLastLogin({ userId, lastLogin }, client = this.db) {
    const query = `
      UPDATE users
      SET last_login = $1
      WHERE id = $2
    `;
    await client.query(query, [lastLogin, userId]);
  }

  // Atomically increments the failure counter and locks the account once the
  // threshold is reached.
  async recordFailedLogin({ userId, maxAttempts, lockMinutes }) {
    const query = `
      UPDATE users
      SET
        failed_login_attempts = failed_login_attempts + 1,
        locked_until = CASE
          WHEN failed_login_attempts + 1 >= $2
            THEN NOW() + ($3 * INTERVAL '1 minute')
          ELSE locked_until
        END
      WHERE id = $1
      RETURNING failed_login_attempts, locked_until
    `;
    const result = await this.db.query(query, [
      userId,
      maxAttempts,
      lockMinutes,
    ]);
    return result.rows[0];
  }

  async resetFailedLogin(userId) {
    const query = `
      UPDATE users
      SET failed_login_attempts = 0, locked_until = NULL
      WHERE id = $1
    `;
    await this.db.query(query, [userId]);
  }
  async getTotalStudents() {
    const query = `
      SELECT COUNT(*) AS total_users
      FROM users
      WHERE role = 'LEARNER'
    `;
    const result = await this.db.query(query);
    return result.rows[0].total_users;
  }
  async getTotalInstructors() {
    const query = `
      SELECT COUNT(*) AS total_users
      FROM users
      WHERE role = 'INSTRUCTOR'
    `;
    const result = await this.db.query(query);
    return result.rows[0].total_users;
  }

  async getInstructors({ limit = 5 } = {}) {
    const query = `
      SELECT id, email, name, role, status, last_login, created_at, updated_at
      FROM users
      WHERE role = 'INSTRUCTOR'
      ORDER BY created_at DESC
      LIMIT $1
    `;
    const result = await this.db.query(query, [limit]);
    return result.rows;
  }

  async findAll({ role, limit = 20, offset = 0 } = {}) {
    let whereClause = "";
    const params = [];
    if (role) {
      whereClause = "WHERE role = $1";
      params.push(role);
    }
    const query = `
      SELECT id, email, name, role, status, last_login, created_at, updated_at
      FROM users
      ${whereClause}
      ORDER BY created_at DESC
      LIMIT $${params.length + 1} OFFSET $${params.length + 2}
    `;
    params.push(limit, offset);
    const result = await this.db.query(query, params);
    return result.rows;
  }

  async findAllCount(role) {
    let whereClause = "";
    const params = [];
    if (role) {
      whereClause = "WHERE role = $1";
      params.push(role);
    }
    const query = `SELECT COUNT(*) AS total FROM users ${whereClause}`;
    const result = await this.db.query(query, params);
    return parseInt(result.rows[0].total);
  }

  async updateById({ id, name, email, role, status }, client = this.db) {
    const query = `
      UPDATE users
      SET name = $1, email = $2, role = $3, status = $4
      WHERE id = $5
      RETURNING id, email, name, role, status, last_login, created_at, updated_at
    `;
    const result = await client.query(query, [name, email, role, status, id]);
    return result.rows[0];
  }

  async deleteById(id) {
    const query = `DELETE FROM users WHERE id = $1 RETURNING id`;
    const result = await this.db.query(query, [id]);
    return result.rows[0];
  }
}
export { UserRepository };
export default new UserRepository();
