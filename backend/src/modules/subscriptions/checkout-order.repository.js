import pgPool from "../../config/database.js";

class CheckoutOrderRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async createOrder(
    {
      userId,
      planId,
      couponId = null,
      planName,
      durationDays,
      subtotal,
      discountAmount = 0,
      totalAmount,
      currency = "usd",
      expiresAt,
      status = "CREATED",
    },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO checkout_orders
         (user_id, plan_id, coupon_id, plan_name, duration_days, subtotal,
          discount_amount, total_amount, currency, status, expires_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
       RETURNING *`,
      [
        userId,
        planId,
        couponId,
        planName,
        durationDays,
        subtotal,
        discountAmount,
        totalAmount,
        currency,
        status,
        expiresAt,
      ],
    );
    return result.rows[0];
  }

  async findById(id, client = this.db) {
    const result = await client.query(
      "SELECT * FROM checkout_orders WHERE id = $1",
      [id],
    );
    return result.rows[0];
  }

  async findBySessionId(stripeCheckoutSessionId, client = this.db) {
    const result = await client.query(
      "SELECT * FROM checkout_orders WHERE stripe_checkout_session_id = $1",
      [stripeCheckoutSessionId],
    );
    return result.rows[0];
  }

  // Open, non-expired order for the same purchase context (plan + coupon).
  async findOpenForUser(
    { userId, planId, couponId = null },
    client = this.db,
  ) {
    const result = await client.query(
      `SELECT * FROM checkout_orders
       WHERE user_id = $1
         AND plan_id = $2
         AND status = 'CHECKOUT_STARTED'
         AND expires_at > NOW()
         AND (($3::uuid IS NULL AND coupon_id IS NULL) OR coupon_id = $3)
       ORDER BY created_at DESC
       LIMIT 1`,
      [userId, planId, couponId],
    );
    return result.rows[0];
  }

  async markStatus(id, status, client = this.db) {
    const result = await client.query(
      `UPDATE checkout_orders
       SET status = $2
       WHERE id = $1
       RETURNING *`,
      [id, status],
    );
    return result.rows[0];
  }

  async attachCheckoutSession(
    id,
    stripeCheckoutSessionId,
    client = this.db,
  ) {
    const result = await client.query(
      `UPDATE checkout_orders
       SET stripe_checkout_session_id = $2,
           status = 'CHECKOUT_STARTED'
       WHERE id = $1
       RETURNING *`,
      [id, stripeCheckoutSessionId],
    );
    return result.rows[0];
  }

  async attachPaymentIntent(id, stripePaymentIntentId, client = this.db) {
    const result = await client.query(
      `UPDATE checkout_orders
       SET stripe_payment_intent_id = COALESCE(stripe_payment_intent_id, $2)
       WHERE id = $1
       RETURNING *`,
      [id, stripePaymentIntentId],
    );
    return result.rows[0];
  }

  async markPaid(id, client = this.db) {
    const result = await client.query(
      `UPDATE checkout_orders
       SET status = 'PAID'
       WHERE id = $1
       RETURNING *`,
      [id],
    );
    return result.rows[0];
  }

  // Lazily transitions overdue open orders to EXPIRED. Scoped to a user when
  // userId is provided. Returns the affected rows so reservations can release.
  async expireOverdue({ userId = null, client = this.db } = {}) {
    const result = await client.query(
      `UPDATE checkout_orders
       SET status = 'EXPIRED'
       WHERE status IN ('CREATED', 'CHECKOUT_STARTED')
         AND expires_at <= NOW()
         AND ($1::uuid IS NULL OR user_id = $1)
       RETURNING id, coupon_id`,
      [userId],
    );
    return result.rows;
  }

  // Orders that have a Stripe session but were never marked PAID. Used by the
  // reconciliation script to recover payments whose webhook was missed.
  async findReconcilable(client = this.db) {
    const result = await client.query(
      `SELECT * FROM checkout_orders
       WHERE status <> 'PAID'
         AND stripe_checkout_session_id IS NOT NULL
       ORDER BY created_at ASC`,
    );
    return result.rows;
  }
}

export { CheckoutOrderRepository };
export default new CheckoutOrderRepository();
