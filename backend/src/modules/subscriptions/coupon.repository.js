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
}

export { CouponRepository };
export default new CouponRepository();
