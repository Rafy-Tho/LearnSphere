import pgPool from "../../config/database.js";

class CouponRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async findByCode(code) {
    const result = await this.db.query(
      "SELECT * FROM coupons WHERE code = $1",
      [code],
    );
    return result.rows[0];
  }

  async findById(id) {
    const result = await this.db.query("SELECT * FROM coupons WHERE id = $1", [
      id,
    ]);
    return result.rows[0];
  }

  async findAll({ limit = 20, offset = 0, search, isActive } = {}) {
    const { where, values } = this.#buildFilters({ search, isActive });
    values.push(limit);
    const limitIdx = values.length;
    values.push(offset);
    const offsetIdx = values.length;

    const result = await this.db.query(
      `SELECT * FROM coupons
       ${where}
       ORDER BY created_at DESC
       LIMIT $${limitIdx} OFFSET $${offsetIdx}`,
      values,
    );
    return result.rows;
  }

  async count({ search, isActive } = {}) {
    const { where, values } = this.#buildFilters({ search, isActive });

    const result = await this.db.query(
      `SELECT COUNT(*) AS total FROM coupons ${where}`,
      values,
    );
    return Number(result.rows[0].total);
  }

  async create({
    code,
    discountType,
    discountValue,
    maxRedemptions = null,
    startsAt = null,
    expiresAt = null,
    isActive = true,
  }) {
    const result = await this.db.query(
      `INSERT INTO coupons
         (code, discount_type, discount_value, max_redemptions, starts_at, expires_at, is_active)
       VALUES ($1, $2, $3, $4, $5, $6, $7)
       RETURNING *`,
      [
        code,
        discountType,
        discountValue,
        maxRedemptions,
        startsAt,
        expiresAt,
        isActive,
      ],
    );
    return result.rows[0];
  }

  async update(
    id,
    {
      code,
      discountType,
      discountValue,
      maxRedemptions,
      startsAt,
      expiresAt,
      isActive,
    },
  ) {
    const result = await this.db.query(
      `UPDATE coupons
       SET code = $1,
           discount_type = $2,
           discount_value = $3,
           max_redemptions = $4,
           starts_at = $5,
           expires_at = $6,
           is_active = $7
       WHERE id = $8
       RETURNING *`,
      [
        code,
        discountType,
        discountValue,
        maxRedemptions,
        startsAt,
        expiresAt,
        isActive,
        id,
      ],
    );
    return result.rows[0];
  }

  async setActive(id, isActive) {
    const result = await this.db.query(
      `UPDATE coupons SET is_active = $1 WHERE id = $2 RETURNING *`,
      [isActive, id],
    );
    return result.rows[0];
  }

  async findRedemption({ couponId, userId }) {
    const result = await this.db.query(
      `SELECT * FROM coupon_redemptions
       WHERE coupon_id = $1 AND user_id = $2`,
      [couponId, userId],
    );
    return result.rows[0];
  }

  async createRedemption(
    { couponId, userId, paymentId, discountAmount },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO coupon_redemptions
         (coupon_id, user_id, payment_id, discount_amount)
       VALUES ($1, $2, $3, $4)
       ON CONFLICT (payment_id) DO NOTHING
       RETURNING *`,
      [couponId, userId, paymentId, discountAmount],
    );
    return result.rows[0];
  }

  async incrementRedemptionCount(couponId, client = this.db) {
    const result = await client.query(
      `UPDATE coupons
       SET redemption_count = redemption_count + 1
       WHERE id = $1
       RETURNING *`,
      [couponId],
    );
    return result.rows[0];
  }

  // Conditionally consumes one redemption only when the coupon is currently
  // valid and capacity remains. Returns the coupon row, or undefined when the
  // coupon cannot be redeemed. Used when a reservation was already released
  // (e.g. a delayed webhook).
  async tryIncrementRedemptionCount(couponId, client = this.db) {
    const result = await client.query(
      `UPDATE coupons
       SET redemption_count = redemption_count + 1
       WHERE id = $1
         AND is_active = TRUE
         AND (starts_at IS NULL OR starts_at <= NOW())
         AND (expires_at IS NULL OR expires_at > NOW())
         AND (max_redemptions IS NULL
              OR redemption_count + reserved_count < max_redemptions)
       RETURNING *`,
      [couponId],
    );
    return result.rows[0];
  }

  async listRedemptions({ couponId, limit = 20, offset = 0 }) {
    const result = await this.db.query(
      `SELECT cr.*, u.name AS user_name, u.email AS user_email
       FROM coupon_redemptions cr
       JOIN users u ON u.id = cr.user_id
       WHERE cr.coupon_id = $1
       ORDER BY cr.redeemed_at DESC
       LIMIT $2 OFFSET $3`,
      [couponId, limit, offset],
    );
    return result.rows;
  }

  async countRedemptions(couponId) {
    const result = await this.db.query(
      `SELECT COUNT(*) AS total FROM coupon_redemptions WHERE coupon_id = $1`,
      [couponId],
    );
    return Number(result.rows[0].total);
  }

  #buildFilters({ search, isActive } = {}) {
    const conditions = [];
    const values = [];

    if (search) {
      values.push(`%${search}%`);
      conditions.push(`code ILIKE $${values.length}`);
    }
    if (isActive !== undefined) {
      values.push(isActive);
      conditions.push(`is_active = $${values.length}`);
    }

    const where = conditions.length ? `WHERE ${conditions.join(" AND ")}` : "";
    return { where, values };
  }
}

export { CouponRepository };
export default new CouponRepository();
