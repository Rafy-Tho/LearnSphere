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
      paidAt = new Date(),
    },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO subscription_payments
         (user_subscription_id, subtotal, discount_amount, amount, currency,
          coupon_id, payment_status, stripe_payment_intent_id, paid_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
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

  async findPaymentsBySubscription(subscriptionId) {
    const result = await this.db.query(
      `SELECT ${PAYMENT_SELECT}
       FROM subscription_payments sp
       ${PAYMENT_JOINS}
       WHERE sp.user_subscription_id = $1
       ORDER BY sp.created_at DESC`,
      [subscriptionId],
    );
    return result.rows;
  }

  async findAllPayments({
    limit = 20,
    offset = 0,
    search,
    status,
    planId,
  } = {}) {
    const { where, values } = this.#buildFilters({ search, status, planId });
    values.push(limit);
    const limitIdx = values.length;
    values.push(offset);
    const offsetIdx = values.length;

    const result = await this.db.query(
      `SELECT ${PAYMENT_SELECT},
              u.name AS user_name, u.email AS user_email,
              pl.name AS plan_name
       FROM subscription_payments sp
       JOIN user_subscriptions us ON sp.user_subscription_id = us.id
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans pl ON us.plan_id = pl.id
       ${PAYMENT_JOINS}
       ${where}
       ORDER BY sp.created_at DESC
       LIMIT $${limitIdx} OFFSET $${offsetIdx}`,
      values,
    );
    return result.rows;
  }

  async countPayments({ search, status, planId } = {}) {
    const { where, values } = this.#buildFilters({ search, status, planId });

    const result = await this.db.query(
      `SELECT COUNT(*) AS total
       FROM subscription_payments sp
       JOIN user_subscriptions us ON sp.user_subscription_id = us.id
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans pl ON us.plan_id = pl.id
       ${where}`,
      values,
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

  #buildFilters({ search, status, planId } = {}) {
    const conditions = [];
    const values = [];

    if (status) {
      values.push(status);
      conditions.push(`sp.payment_status = $${values.length}`);
    }
    if (planId) {
      values.push(planId);
      conditions.push(`us.plan_id = $${values.length}`);
    }
    if (search) {
      values.push(`%${search}%`);
      conditions.push(
        `(u.name ILIKE $${values.length} OR u.email ILIKE $${values.length} OR pl.name ILIKE $${values.length})`,
      );
    }

    const where = conditions.length ? `WHERE ${conditions.join(" AND ")}` : "";
    return { where, values };
  }
}

export { PaymentRepository };
export default new PaymentRepository();
