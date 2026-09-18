import pgPool from "../../config/database.js";

class RefundRequestRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create(
    {
      paymentId,
      userId,
      requestedAmount,
      currency = "usd",
      reason,
      userNote = null,
    },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO refund_requests
         (payment_id, user_id, requested_amount, currency, reason, user_note)
       VALUES ($1, $2, $3, $4, $5, $6)
       RETURNING *`,
      [paymentId, userId, requestedAmount, currency, reason, userNote],
    );
    return result.rows[0];
  }

  async findById(id) {
    const result = await this.db.query(
      "SELECT * FROM refund_requests WHERE id = $1",
      [id],
    );
    return result.rows[0];
  }

  async findByIdForUser({ id, userId }) {
    const result = await this.db.query(
      `SELECT * FROM refund_requests WHERE id = $1 AND user_id = $2`,
      [id, userId],
    );
    return result.rows[0];
  }

  async findPendingByPayment(paymentId) {
    const result = await this.db.query(
      `SELECT * FROM refund_requests
       WHERE payment_id = $1 AND status = 'PENDING'`,
      [paymentId],
    );
    return result.rows[0];
  }

  async listByPayment(paymentId) {
    const result = await this.db.query(
      `SELECT * FROM refund_requests
       WHERE payment_id = $1
       ORDER BY created_at DESC`,
      [paymentId],
    );
    return result.rows;
  }

  async listByUser({ userId, limit = 20, offset = 0 }) {
    const result = await this.db.query(
      `SELECT rr.*, sp.amount AS payment_amount, sp.currency AS payment_currency,
              pl.name AS plan_name
       FROM refund_requests rr
       JOIN subscription_payments sp ON sp.id = rr.payment_id
       JOIN user_subscriptions us ON us.id = sp.user_subscription_id
       JOIN subscription_plans pl ON pl.id = us.plan_id
       WHERE rr.user_id = $1
       ORDER BY rr.created_at DESC
       LIMIT $2 OFFSET $3`,
      [userId, limit, offset],
    );
    return result.rows;
  }

  async countByUser(userId) {
    const result = await this.db.query(
      `SELECT COUNT(*) AS total FROM refund_requests WHERE user_id = $1`,
      [userId],
    );
    return Number(result.rows[0].total);
  }
}

export { RefundRequestRepository };
export default new RefundRequestRepository();
