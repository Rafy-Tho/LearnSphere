import pgPool from "../../config/database.js";

class RefundRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async findByStripeRefundId(stripeRefundId, client = this.db) {
    const result = await client.query(
      `SELECT * FROM payment_refunds WHERE stripe_refund_id = $1`,
      [stripeRefundId],
    );
    return result.rows[0];
  }

  async findByIdempotencyKey(idempotencyKey, client = this.db) {
    const result = await client.query(
      `SELECT * FROM payment_refunds WHERE idempotency_key = $1`,
      [idempotencyKey],
    );
    return result.rows[0];
  }

  async findById(id, client = this.db) {
    const result = await client.query(
      `SELECT * FROM payment_refunds WHERE id = $1`,
      [id],
    );
    return result.rows[0];
  }

  // Inserts the pre-Stripe placeholder row. The unique idempotency_key makes
  // concurrent duplicate refund attempts fail with 23505 so the caller can
  // return the already-recorded attempt instead of charging twice.
  async insertPendingRefund(
    { paymentId, amount, currency = "usd", idempotencyKey, reason = null },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO payment_refunds
         (payment_id, amount, currency, refund_status, idempotency_key, reason)
       VALUES ($1, $2, $3, 'PENDING', $4, $5)
       RETURNING *`,
      [paymentId, amount, currency, idempotencyKey, reason],
    );
    return result.rows[0];
  }

  // Applies a Stripe outcome to an existing refund row (placeholder or synced).
  async applyStripeResult(
    {
      id,
      stripeRefundId,
      status,
      amount,
      currency,
      reason = null,
      refundedAt = null,
    },
    client = this.db,
  ) {
    const result = await client.query(
      `UPDATE payment_refunds
       SET stripe_refund_id = COALESCE($1, stripe_refund_id),
           refund_status = $2,
           amount = COALESCE($3, amount),
           currency = COALESCE($4, currency),
           reason = COALESCE($5, reason),
           refunded_at = COALESCE($6, refunded_at)
       WHERE id = $7
       RETURNING *`,
      [stripeRefundId, status, amount, currency, reason, refundedAt, id],
    );
    return result.rows[0];
  }

  async markFailed(id, reason = null, client = this.db) {
    const result = await client.query(
      `UPDATE payment_refunds
       SET refund_status = 'FAILED',
           reason = COALESCE($2, reason)
       WHERE id = $1
       RETURNING *`,
      [id, reason],
    );
    return result.rows[0];
  }

  // Resolves an inbound Stripe refund to a single row: match by Stripe refund
  // id first, then by idempotency key (webhook arriving before the admin API
  // response), otherwise insert. Keeps webhook processing idempotent.
  async upsertByStripeRefundId(
    {
      paymentId,
      amount,
      currency = "usd",
      status = "PENDING",
      stripeRefundId,
      idempotencyKey = null,
      reason = null,
      refundedAt = null,
    },
    client = this.db,
  ) {
    let existing = stripeRefundId
      ? await this.findByStripeRefundId(stripeRefundId, client)
      : null;
    if (!existing && idempotencyKey) {
      existing = await this.findByIdempotencyKey(idempotencyKey, client);
    }

    if (existing) {
      return this.applyStripeResult(
        {
          id: existing.id,
          stripeRefundId,
          status,
          amount,
          currency,
          reason,
          refundedAt,
        },
        client,
      );
    }

    const result = await client.query(
      `INSERT INTO payment_refunds
         (payment_id, amount, currency, refund_status, stripe_refund_id,
          idempotency_key, reason, refunded_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
       RETURNING *`,
      [
        paymentId,
        amount,
        currency,
        status,
        stripeRefundId,
        idempotencyKey,
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

  async listByPayment(paymentId, client = this.db) {
    const result = await client.query(
      `SELECT * FROM payment_refunds
       WHERE payment_id = $1
       ORDER BY created_at DESC`,
      [paymentId],
    );
    return result.rows;
  }

  async listBySubscription(subscriptionId, client = this.db) {
    const result = await client.query(
      `SELECT pr.*
       FROM payment_refunds pr
       JOIN subscription_payments sp ON sp.id = pr.payment_id
       WHERE sp.user_subscription_id = $1
       ORDER BY pr.created_at DESC`,
      [subscriptionId],
    );
    return result.rows;
  }

  async findAllRefunds({ limit = 20, offset = 0, status, search } = {}) {
    const { where, values } = this.#buildRefundFilters({ status, search });
    values.push(limit);
    const limitIdx = values.length;
    values.push(offset);
    const offsetIdx = values.length;

    const result = await this.db.query(
      `SELECT pr.*, u.name AS user_name, u.email AS user_email,
              pl.name AS plan_name
       FROM payment_refunds pr
       JOIN subscription_payments sp ON sp.id = pr.payment_id
       JOIN user_subscriptions us ON us.id = sp.user_subscription_id
       JOIN users u ON u.id = us.user_id
       JOIN subscription_plans pl ON pl.id = us.plan_id
       ${where}
       ORDER BY pr.created_at DESC
       LIMIT $${limitIdx} OFFSET $${offsetIdx}`,
      values,
    );
    return result.rows;
  }

  async countAllRefunds({ status, search } = {}) {
    const { where, values } = this.#buildRefundFilters({ status, search });

    const result = await this.db.query(
      `SELECT COUNT(*) AS total
       FROM payment_refunds pr
       JOIN subscription_payments sp ON sp.id = pr.payment_id
       JOIN user_subscriptions us ON us.id = sp.user_subscription_id
       JOIN users u ON u.id = us.user_id
       JOIN subscription_plans pl ON pl.id = us.plan_id
       ${where}`,
      values,
    );
    return Number(result.rows[0].total);
  }

  #buildRefundFilters({ status, search } = {}) {
    const conditions = [];
    const values = [];

    if (status) {
      values.push(status);
      conditions.push(`pr.refund_status = $${values.length}`);
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

export { RefundRepository };
export default new RefundRepository();
