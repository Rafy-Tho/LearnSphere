import pgPool from "../../config/database.js";

class PasswordResetCodeRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({ code, userId, expiresAt }) {
    const result = await this.db.query(
      `INSERT INTO password_reset_codes (code, user_id, expires_at)
       VALUES ($1, $2, $3)
       RETURNING *
      `,
      [code, userId, expiresAt],
    );

    return result.rows[0];
  }

  async findCode({ code, userId }) {
    const result = await this.db.query(
      `SELECT *
       FROM password_reset_codes
       WHERE
        code = $1
        AND user_id = $2
      `,
      [code, userId],
    );
    return result.rows[0];
  }

  async incrementAttempt(userId) {
    const result = await this.db.query(
      `UPDATE password_reset_codes
       SET attempts = attempts + 1
       WHERE user_id = $1
       RETURNING attempts
      `,
      [userId],
    );
    return result.rows[0]?.attempts;
  }

  async delete(userId, client = this.db) {
    const result = await client.query(
      `DELETE FROM password_reset_codes
       WHERE user_id = $1
       RETURNING *
      `,
      [userId],
    );

    return result.rows[0];
  }
}

export { PasswordResetCodeRepository };
export default new PasswordResetCodeRepository();
