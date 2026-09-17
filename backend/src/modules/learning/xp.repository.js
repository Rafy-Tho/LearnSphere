import pgPool from "../../config/database.js";

class XpRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  // Idempotent per (user, reason, reference): the partial unique index makes a
  // repeated reward a no-op and returns no row.
  async create(
    {
      userId,
      amount,
      reason,
      referenceType = null,
      referenceId = null,
      metadata = {},
    },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO user_xp_transactions
         (user_id, amount, reason, reference_type, reference_id, metadata)
       VALUES ($1, $2, $3, $4, $5, $6)
       ON CONFLICT (user_id, reason, reference_id)
         WHERE reference_id IS NOT NULL
       DO NOTHING
       RETURNING *`,
      [userId, amount, reason, referenceType, referenceId, metadata],
    );
    return result.rows[0] || null;
  }

  async getSummary(userId) {
    const result = await this.db.query(
      `SELECT
         COALESCE(SUM(amount), 0) AS total_xp,
         COALESCE(SUM(
           CASE WHEN created_at >= CURRENT_DATE THEN amount ELSE 0 END
         ), 0) AS today_xp
       FROM user_xp_transactions
       WHERE user_id = $1`,
      [userId],
    );

    const { total_xp: totalXp, today_xp: todayXp } = result.rows[0];
    return { total_xp: Number(totalXp), today_xp: Number(todayXp) };
  }

  async findByUser(userId, { limit = 20, offset = 0 } = {}) {
    const result = await this.db.query(
      `SELECT id, amount, reason, reference_type, reference_id, metadata, created_at
       FROM user_xp_transactions
       WHERE user_id = $1
       ORDER BY created_at DESC
       LIMIT $2 OFFSET $3`,
      [userId, limit, offset],
    );
    return result.rows;
  }

  async countByUser(userId) {
    const result = await this.db.query(
      `SELECT COUNT(*) AS total FROM user_xp_transactions WHERE user_id = $1`,
      [userId],
    );
    return Number(result.rows[0].total);
  }
}

export { XpRepository };
export default new XpRepository();
