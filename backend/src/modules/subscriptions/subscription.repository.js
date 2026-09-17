import pgPool from "../../config/database.js";

class SubscriptionRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async findById(id) {
    const result = await this.db.query(
      "SELECT * FROM user_subscriptions WHERE id = $1",
      [id],
    );
    return result.rows[0];
  }

  async createUserSubscription(
    { userId, subscriptionPlanId, endDate },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO user_subscriptions (user_id, plan_id, end_date, status)
       VALUES ($1, $2, $3, 'ACTIVE')
       RETURNING *`,
      [userId, subscriptionPlanId, endDate],
    );
    return result.rows[0];
  }

  async getActivePaidSubscription(userId) {
    const result = await this.db.query(
      `SELECT
        us.id AS subscription_id,
        us.user_id,
        us.plan_id,
        us.start_date,
        us.end_date,
        us.status AS subscription_status,
        us.cancel_at_period_end,
        us.cancelled_at,
        us.created_at AS subscription_created_at,
        us.updated_at AS subscription_updated_at,
        sp.id AS payment_id,
        sp.subtotal,
        sp.discount_amount,
        sp.amount,
        sp.currency,
        sp.payment_status,
        sp.stripe_payment_intent_id,
        sp.paid_at,
        sp.created_at AS payment_created_at,
        p.name,
        p.description,
        p.duration_days,
        p.price,
        p.currency AS plan_currency
     FROM user_subscriptions us
     JOIN subscription_plans p ON us.plan_id = p.id
     JOIN subscription_payments sp ON sp.user_subscription_id = us.id
     WHERE us.user_id = $1
       AND us.status = 'ACTIVE'
       AND us.end_date > NOW()
       AND sp.payment_status = 'COMPLETED'
     ORDER BY sp.created_at DESC
     LIMIT 1`,
      [userId],
    );

    return result.rows[0];
  }

  async getLatestSubscription(userId) {
    const result = await this.db.query(
      `SELECT
        us.id AS subscription_id,
        us.user_id,
        us.plan_id,
        us.start_date,
        us.end_date,
        us.status AS subscription_status,
        us.cancel_at_period_end,
        us.cancelled_at,
        us.created_at AS subscription_created_at,
        us.updated_at AS subscription_updated_at,
        p.name,
        p.description,
        p.duration_days,
        p.price,
        p.currency,
        sp.id AS payment_id,
        sp.subtotal,
        sp.discount_amount,
        sp.amount,
        sp.currency AS payment_currency,
        sp.payment_status,
        sp.stripe_payment_intent_id,
        sp.paid_at
     FROM user_subscriptions us
     JOIN subscription_plans p ON us.plan_id = p.id
     LEFT JOIN LATERAL (
       SELECT * FROM subscription_payments sp2
       WHERE sp2.user_subscription_id = us.id
       ORDER BY sp2.created_at DESC
       LIMIT 1
     ) sp ON TRUE
     WHERE us.user_id = $1
     ORDER BY us.created_at DESC
     LIMIT 1`,
      [userId],
    );

    return result.rows[0];
  }

  async findAllUserSubscriptions({ limit = 20, offset = 0 } = {}) {
    const result = await this.db.query(
      `SELECT us.*, u.name AS user_name, u.email AS user_email, sp.name AS plan_name
       FROM user_subscriptions us
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans sp ON us.plan_id = sp.id
       ORDER BY us.created_at DESC
       LIMIT $1 OFFSET $2`,
      [limit, offset],
    );
    return result.rows;
  }

  async countUserSubscriptions() {
    const result = await this.db.query(
      "SELECT COUNT(*) AS total FROM user_subscriptions",
    );
    return Number(result.rows[0].total);
  }

  async findUserSubscriptionById(id) {
    const result = await this.db.query(
      `SELECT us.*, u.name AS user_name, u.email AS user_email, sp.name AS plan_name
       FROM user_subscriptions us
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans sp ON us.plan_id = sp.id
       WHERE us.id = $1`,
      [id],
    );
    return result.rows[0];
  }

  async adminCreateUserSubscription({
    userId,
    planId,
    startDate,
    endDate,
    status,
  }) {
    const result = await this.db.query(
      `INSERT INTO user_subscriptions (user_id, plan_id, start_date, end_date, status)
       VALUES ($1, $2, $3, $4, $5)
       RETURNING *`,
      [userId, planId, startDate, endDate, status || "ACTIVE"],
    );
    return result.rows[0];
  }

  async updateUserSubscription(
    id,
    { userId, planId, startDate, endDate, status },
  ) {
    const result = await this.db.query(
      `UPDATE user_subscriptions
       SET user_id = $1, plan_id = $2, start_date = $3, end_date = $4, status = $5
       WHERE id = $6
       RETURNING *`,
      [userId, planId, startDate, endDate, status, id],
    );
    return result.rows[0];
  }

  async deleteUserSubscription(id) {
    const result = await this.db.query(
      "DELETE FROM user_subscriptions WHERE id = $1 RETURNING id",
      [id],
    );
    return result.rows[0];
  }

  async expireOverdueSubscriptions() {
    const result = await this.db.query(
      `UPDATE user_subscriptions
       SET status = 'EXPIRED'
       WHERE status = 'ACTIVE' AND end_date <= NOW()
       RETURNING id`,
    );
    return result.rows;
  }
}

export { SubscriptionRepository };
export default new SubscriptionRepository();
