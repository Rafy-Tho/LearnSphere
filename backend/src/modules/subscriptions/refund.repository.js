import pgPool from "../../config/database.js";

class RefundRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async upsertByStripeRefundId(
    {
      paymentId,
      amount,
      currency = "usd",
      status = "PENDING",
      stripeRefundId,
      reason = null,
      refundedAt = null,
    },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO payment_refunds
         (payment_id, amount, currency, refund_status, stripe_refund_id, reason, refunded_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7)
       ON CONFLICT (stripe_refund_id) DO UPDATE
         SET refund_status = EXCLUDED.refund_status,
             amount = EXCLUDED.amount,
             reason = COALESCE(EXCLUDED.reason, payment_refunds.reason),
             refunded_at = COALESCE(EXCLUDED.refunded_at, payment_refunds.refunded_at)
       RETURNING *`,
      [
        paymentId,
        amount,
        currency,
        status,
        stripeRefundId,
        reason,
        refundedAt,
      ],
    );
    return result.rows[0];
  }

  async sumByPayment(paymentId, client = this.db) {
    const result = await client.query(
      `SELECT COALESCE(SUM(amount), 0) AS refunded_total
       FROM payment_refunds
       WHERE payment_id = $1 AND refund_status = 'SUCCEEDED'`,
      [paymentId],
    );
    return Number(result.rows[0].refunded_total);
  }

  // SUCCEEDED + PENDING amounts count against the refundable balance.
  async sumCommittedByPayment(paymentId, client = this.db) {
    const result = await client.query(
      `SELECT COALESCE(SUM(amount), 0) AS committed_total
       FROM payment_refunds
       WHERE payment_id = $1 AND refund_status IN ('SUCCEEDED', 'PENDING')`,
      [paymentId],
    );
    return Number(result.rows[0].committed_total);
  }

  async listByPayment(paymentId) {
    const result = await this.db.query(
      `SELECT * FROM payment_refunds
       WHERE payment_id = $1
       ORDER BY created_at DESC`,
      [paymentId],
    );
    return result.rows;
  }
}

export { RefundRepository };
export default new RefundRepository();
