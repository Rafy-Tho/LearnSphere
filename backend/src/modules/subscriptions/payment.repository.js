import pgPool from "../../config/database.js";

const PAYMENT_SELECT = `
  sp.*,
  c.code AS coupon_code,
  COALESCE(r.refunded_total, 0) AS refunded_total,
  r.refund_status AS refund_status
`;

const PAYMENT_JOINS = `
  LEFT JOIN coupons c ON c.id = sp.coupon_id
  LEFT JOIN (
    SELECT payment_id,
           SUM(amount) AS refunded_total,
           (ARRAY_AGG(refund_status ORDER BY created_at DESC))[1] AS refund_status
    FROM payment_refunds
    GROUP BY payment_id
  ) r ON r.payment_id = sp.id
`;

class PaymentRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async createPayment(
    {
      userSubscriptionId,
      subtotal,
      discountAmount = 0,
      amount,
      currency = "usd",
      couponId = null,
      paymentStatus = "COMPLETED",
      stripePaymentIntentId = null,
      stripeInvoiceId = null,
      paidAt = new Date(),
    },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO subscription_payments
         (user_subscription_id, subtotal, discount_amount, amount, currency,
          coupon_id, payment_status, stripe_payment_intent_id,
          stripe_invoice_id, paid_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
       RETURNING *`,
      [
        userSubscriptionId,
        subtotal,
        discountAmount,
        amount,
        currency,
        couponId,
        paymentStatus,
        stripePaymentIntentId,
        stripeInvoiceId,
        paidAt,
      ],
    );
    return result.rows[0];
  }

  async findPaymentByIntentId(stripePaymentIntentId, client = this.db) {
    const result = await client.query(
      `SELECT * FROM subscription_payments WHERE stripe_payment_intent_id = $1`,
      [stripePaymentIntentId],
    );
    return result.rows[0];
  }

  async findPaymentById(id) {
    const result = await this.db.query(
      `SELECT ${PAYMENT_SELECT},
              u.name AS user_name, u.email AS user_email,
              pl.name AS plan_name
       FROM subscription_payments sp
       JOIN user_subscriptions us ON sp.user_subscription_id = us.id
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans pl ON us.plan_id = pl.id
       ${PAYMENT_JOINS}
       WHERE sp.id = $1`,
      [id],
    );
    return result.rows[0];
  }

  async findAllPayments({ limit = 20, offset = 0 } = {}) {
    const result = await this.db.query(
      `SELECT ${PAYMENT_SELECT},
              u.name AS user_name, u.email AS user_email,
              pl.name AS plan_name
       FROM subscription_payments sp
       JOIN user_subscriptions us ON sp.user_subscription_id = us.id
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans pl ON us.plan_id = pl.id
       ${PAYMENT_JOINS}
       ORDER BY sp.created_at DESC
       LIMIT $1 OFFSET $2`,
      [limit, offset],
    );
    return result.rows;
  }

  async countPayments() {
    const result = await this.db.query(
      "SELECT COUNT(*) AS total FROM subscription_payments",
    );
    return Number(result.rows[0].total);
  }

  async findUserPayments({ userId, limit = 20, offset = 0 }) {
    const result = await this.db.query(
      `SELECT ${PAYMENT_SELECT},
              pl.name AS plan_name, pl.duration_days
       FROM subscription_payments sp
       JOIN user_subscriptions us ON sp.user_subscription_id = us.id
       JOIN subscription_plans pl ON us.plan_id = pl.id
       ${PAYMENT_JOINS}
       WHERE us.user_id = $1
       ORDER BY sp.created_at DESC
       LIMIT $2 OFFSET $3`,
      [userId, limit, offset],
    );
    return result.rows;
  }

  async countUserPayments(userId) {
    const result = await this.db.query(
      `SELECT COUNT(*) AS total
       FROM subscription_payments sp
       JOIN user_subscriptions us ON sp.user_subscription_id = us.id
       WHERE us.user_id = $1`,
      [userId],
    );
    return Number(result.rows[0].total);
  }

  async findUserPaymentById({ userId, paymentId }) {
    const result = await this.db.query(
      `SELECT ${PAYMENT_SELECT},
              pl.name AS plan_name, pl.duration_days
       FROM subscription_payments sp
       JOIN user_subscriptions us ON sp.user_subscription_id = us.id
       JOIN subscription_plans pl ON us.plan_id = pl.id
       ${PAYMENT_JOINS}
       WHERE sp.id = $1 AND us.user_id = $2`,
      [paymentId, userId],
    );
    return result.rows[0];
  }

  async adminCreatePayment({
    userSubscriptionId,
    amount,
    paymentStatus,
    stripePaymentIntentId,
  }) {
    const result = await this.db.query(
      `INSERT INTO subscription_payments
         (user_subscription_id, subtotal, discount_amount, amount,
          payment_status, stripe_payment_intent_id, paid_at)
       VALUES ($1, $2, 0, $2, $3, $4, CURRENT_TIMESTAMP)
       RETURNING *`,
      [
        userSubscriptionId,
        amount,
        paymentStatus || "COMPLETED",
        stripePaymentIntentId || null,
      ],
    );
    return result.rows[0];
  }

  async updatePayment(id, { amount, paymentStatus, stripePaymentIntentId }) {
    const result = await this.db.query(
      `UPDATE subscription_payments
       SET subtotal = $1,
           amount = $1,
           payment_status = $2,
           stripe_payment_intent_id = $3
       WHERE id = $4
       RETURNING *`,
      [amount, paymentStatus, stripePaymentIntentId || null, id],
    );
    return result.rows[0];
  }

  async updatePaymentStatus(
    id,
    paymentStatus,
    failureReason = null,
    client = this.db,
  ) {
    const result = await client.query(
      `UPDATE subscription_payments
       SET payment_status = $1,
           failure_reason = COALESCE($2, failure_reason)
       WHERE id = $3
       RETURNING *`,
      [paymentStatus, failureReason, id],
    );
    return result.rows[0];
  }

  async deletePayment(id) {
    const result = await this.db.query(
      "DELETE FROM subscription_payments WHERE id = $1 RETURNING id",
      [id],
    );
    return result.rows[0];
  }
}

export { PaymentRepository };
export default new PaymentRepository();
