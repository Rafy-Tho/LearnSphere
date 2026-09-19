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

  async findDetailById(id) {
    const result = await this.db.query(
      `SELECT rr.*,
              u.name AS user_name, u.email AS user_email,
              sp.amount AS payment_amount, sp.currency AS payment_currency,
              sp.payment_status, sp.stripe_payment_intent_id, sp.paid_at,
              GREATEST(
                sp.amount - COALESCE((
                  SELECT SUM(pr.amount) FROM payment_refunds pr
                  WHERE pr.payment_id = sp.id
                    AND pr.refund_status IN ('SUCCEEDED', 'PENDING')
                ), 0),
                0
              ) AS refundable_amount,
              pl.name AS plan_name, pl.duration_days
       FROM refund_requests rr
       JOIN users u ON u.id = rr.user_id
       JOIN subscription_payments sp ON sp.id = rr.payment_id
       JOIN user_subscriptions us ON us.id = sp.user_subscription_id
       JOIN subscription_plans pl ON pl.id = us.plan_id
       WHERE rr.id = $1`,
      [id],
    );
    return result.rows[0];
  }

  // Atomic review transition: only a PENDING request can be reviewed, so two
  // concurrent admins cannot both approve/reject the same request.
  async updateStatus(
    { id, status, reviewedBy, adminNote = null },
    client = this.db,
  ) {
    const result = await client.query(
      `UPDATE refund_requests
       SET status = $1,
           reviewed_by = $2,
           admin_note = $3,
           reviewed_at = CURRENT_TIMESTAMP
       WHERE id = $4 AND status = 'PENDING'
       RETURNING *`,
      [status, reviewedBy, adminNote, id],
    );
    return result.rows[0];
  }

  async setPaymentRefund({ id, paymentRefundId }, client = this.db) {
    const result = await client.query(
      `UPDATE refund_requests
       SET payment_refund_id = $1
       WHERE id = $2
       RETURNING *`,
      [paymentRefundId, id],
    );
    return result.rows[0];
  }

  async findAll({
    limit = 20,
    offset = 0,
    status,
    search,
    paymentId,
    dateFrom,
    dateTo,
  } = {}) {
    const { where, values } = this.#buildAdminFilters({
      status,
      search,
      paymentId,
      dateFrom,
      dateTo,
    });
    values.push(limit);
    const limitIdx = values.length;
    values.push(offset);
    const offsetIdx = values.length;

    const result = await this.db.query(
      `SELECT rr.*,
              u.name AS user_name, u.email AS user_email,
              sp.amount AS payment_amount, sp.currency AS payment_currency,
              sp.payment_status, sp.paid_at,
              GREATEST(
                sp.amount - COALESCE((
                  SELECT SUM(pr.amount) FROM payment_refunds pr
                  WHERE pr.payment_id = sp.id
                    AND pr.refund_status IN ('SUCCEEDED', 'PENDING')
                ), 0),
                0
              ) AS refundable_amount,
              pl.name AS plan_name
       FROM refund_requests rr
       JOIN users u ON u.id = rr.user_id
       JOIN subscription_payments sp ON sp.id = rr.payment_id
       JOIN user_subscriptions us ON us.id = sp.user_subscription_id
       JOIN subscription_plans pl ON pl.id = us.plan_id
       ${where}
       ORDER BY rr.requested_at DESC
       LIMIT $${limitIdx} OFFSET $${offsetIdx}`,
      values,
    );
    return result.rows;
  }

  async countAll({ status, search, paymentId, dateFrom, dateTo } = {}) {
    const { where, values } = this.#buildAdminFilters({
      status,
      search,
      paymentId,
      dateFrom,
      dateTo,
    });

    const result = await this.db.query(
      `SELECT COUNT(*) AS total
       FROM refund_requests rr
       JOIN users u ON u.id = rr.user_id
       JOIN subscription_payments sp ON sp.id = rr.payment_id
       JOIN user_subscriptions us ON us.id = sp.user_subscription_id
       JOIN subscription_plans pl ON pl.id = us.plan_id
       ${where}`,
      values,
    );
    return Number(result.rows[0].total);
  }

  #buildAdminFilters({ status, search, paymentId, dateFrom, dateTo } = {}) {
    const conditions = [];
    const values = [];

    if (status) {
      values.push(status);
      conditions.push(`rr.status = $${values.length}`);
    }
    if (paymentId) {
      values.push(paymentId);
      conditions.push(`rr.payment_id = $${values.length}`);
    }
    if (search) {
      values.push(`%${search}%`);
      conditions.push(
        `(u.name ILIKE $${values.length} OR u.email ILIKE $${values.length} OR pl.name ILIKE $${values.length})`,
      );
    }
    if (dateFrom) {
      values.push(dateFrom);
      conditions.push(`rr.requested_at >= $${values.length}`);
    }
    if (dateTo) {
      values.push(dateTo);
      conditions.push(`rr.requested_at <= $${values.length}`);
    }

    const where = conditions.length ? `WHERE ${conditions.join(" AND ")}` : "";
    return { where, values };
  }
}

export { RefundRequestRepository };
export default new RefundRequestRepository();
