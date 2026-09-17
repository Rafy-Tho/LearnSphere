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

  async getActivePaidSubscription(userId, client = this.db) {
    const result = await client.query(
      `SELECT
        us.id AS subscription_id,
        us.user_id,
        us.plan_id,
        us.start_date,
        us.end_date,
        us.status AS subscription_status,
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

  // Lazily transitions overdue ACTIVE rows to EXPIRED. Scoped to a user when
  // userId is provided, otherwise applies globally.
  async expireOverdueSubscriptions({ userId = null, client = this.db } = {}) {
    const result = await client.query(
      `UPDATE user_subscriptions
       SET status = 'EXPIRED'
       WHERE status = 'ACTIVE'
         AND end_date <= NOW()
         AND ($1::uuid IS NULL OR user_id = $1)
       RETURNING id`,
      [userId],
    );
    return result.rows;
  }

  async findAllUserSubscriptions({
    limit = 20,
    offset = 0,
    status,
    search,
  } = {}) {
    const conditions = [];
    const values = [];

    if (status) {
      values.push(status);
      conditions.push(`us.status = $${values.length}`);
    }
    if (search) {
      values.push(`%${search}%`);
      conditions.push(
        `(u.name ILIKE $${values.length} OR u.email ILIKE $${values.length} OR sp.name ILIKE $${values.length})`,
      );
    }

    values.push(limit);
    const limitIdx = values.length;
    values.push(offset);
    const offsetIdx = values.length;
    const where = conditions.length ? `WHERE ${conditions.join(" AND ")}` : "";

    const result = await this.db.query(
      `SELECT us.*, u.name AS user_name, u.email AS user_email, sp.name AS plan_name
       FROM user_subscriptions us
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans sp ON us.plan_id = sp.id
       ${where}
       ORDER BY us.created_at DESC
       LIMIT $${limitIdx} OFFSET $${offsetIdx}`,
      values,
    );
    return result.rows;
  }

  async countUserSubscriptions({ status, search } = {}) {
    const conditions = [];
    const values = [];

    if (status) {
      values.push(status);
      conditions.push(`us.status = $${values.length}`);
    }
    if (search) {
      values.push(`%${search}%`);
      conditions.push(
        `(u.name ILIKE $${values.length} OR u.email ILIKE $${values.length} OR sp.name ILIKE $${values.length})`,
      );
    }

    const where = conditions.length ? `WHERE ${conditions.join(" AND ")}` : "";

    const result = await this.db.query(
      `SELECT COUNT(*) AS total
       FROM user_subscriptions us
       JOIN users u ON us.user_id = u.id
       JOIN subscription_plans sp ON us.plan_id = sp.id
       ${where}`,
      values,
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

  // Administrative override: provisions access without a payment record.
  // Callers must audit this operation.
  async adminOverrideSubscription(
    { userId, planId, startDate, endDate },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO user_subscriptions (user_id, plan_id, start_date, end_date, status)
       VALUES ($1, $2, $3, $4, 'ACTIVE')
       RETURNING *`,
      [userId, planId, startDate, endDate],
    );
    return result.rows[0];
  }
}

export { SubscriptionRepository };
export default new SubscriptionRepository();
