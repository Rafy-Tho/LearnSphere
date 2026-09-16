import pgPool from "../../config/database.js";

class EmailVerificationCodeRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({ code, userId, expiresAt }, client = this.db) {
    const result = await client.query(
      `INSERT INTO email_verification_codes (code, user_id, expires_at)
       VALUES ($1, $2, $3)
       RETURNING *
      `,
      [code, userId, expiresAt],
    );

    return result.rows[0];
  }

  async findLatestByUserId(userId) {
    const result = await this.db.query(
      `SELECT *
       FROM email_verification_codes
       WHERE user_id = $1
       ORDER BY created_at DESC
       LIMIT 1
      `,
      [userId],
    );
    return result.rows[0];
  }

  async incrementAttempt(userId) {
    const result = await this.db.query(
      `UPDATE email_verification_codes
       SET attempts = attempts + 1
       WHERE user_id = $1
       RETURNING attempts
      `,
      [userId],
    );
    return result.rows[0]?.attempts;
  }

  async deleteByUserId(userId, client = this.db) {
    const result = await client.query(
      `DELETE FROM email_verification_codes
       WHERE user_id = $1
       RETURNING *
      `,
      [userId],
    );

    return result.rows[0];
  }
}

export { EmailVerificationCodeRepository };
export default new EmailVerificationCodeRepository();
