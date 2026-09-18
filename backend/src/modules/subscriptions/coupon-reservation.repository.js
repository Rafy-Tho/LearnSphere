import pgPool from "../../config/database.js";

class CouponReservationRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  // Atomically claims coupon capacity and records the reservation. Returns the
  // reservation, or undefined when the coupon is inactive or has no capacity.
  // Callers must run this inside a transaction.
  async reserve(
    { couponId, userId, checkoutOrderId, expiresAt },
    client = this.db,
  ) {
    const capacity = await client.query(
      `UPDATE coupons
       SET reserved_count = reserved_count + 1
       WHERE id = $1
         AND is_active = TRUE
         AND (max_redemptions IS NULL
              OR reserved_count + redemption_count < max_redemptions)
       RETURNING id`,
      [couponId],
    );
    if (!capacity.rows[0]) return undefined;

    const result = await client.query(
      `INSERT INTO coupon_reservations
         (coupon_id, user_id, checkout_order_id, expires_at)
       VALUES ($1, $2, $3, $4)
       RETURNING *`,
      [couponId, userId, checkoutOrderId, expiresAt],
    );
    return result.rows[0];
  }

  async findActiveByOrderId(checkoutOrderId, client = this.db) {
    const result = await client.query(
      `SELECT * FROM coupon_reservations
       WHERE checkout_order_id = $1 AND released_at IS NULL`,
      [checkoutOrderId],
    );
    return result.rows[0];
  }

  // Converts an active reservation into a redemption: releases the reservation,
  // frees reserved capacity, and consumes one redemption. Returns the coupon row
  // (or undefined when no active reservation exists). Callers must run this
  // inside a transaction.
  async finalizeByOrderId(checkoutOrderId, client = this.db) {
    const result = await client.query(
      `WITH released AS (
         UPDATE coupon_reservations
         SET released_at = CURRENT_TIMESTAMP
         WHERE checkout_order_id = $1 AND released_at IS NULL
         RETURNING coupon_id
       )
       UPDATE coupons c
       SET reserved_count = GREATEST(c.reserved_count - 1, 0),
           redemption_count = c.redemption_count + 1
       FROM released r
       WHERE c.id = r.coupon_id
       RETURNING c.*`,
      [checkoutOrderId],
    );
    return result.rows[0];
  }

  // Releases active reservations for the given orders and decrements the
  // matching coupons' reserved_count. Returns the released reservation rows.
  async releaseByOrderIds(orderIds, client = this.db) {
    if (!orderIds || orderIds.length === 0) return [];

    const result = await client.query(
      `WITH released AS (
         UPDATE coupon_reservations
         SET released_at = CURRENT_TIMESTAMP
         WHERE checkout_order_id = ANY($1::uuid[]) AND released_at IS NULL
         RETURNING coupon_id
       ), decremented AS (
         UPDATE coupons c
         SET reserved_count = GREATEST(c.reserved_count - r.cnt, 0)
         FROM (
           SELECT coupon_id, COUNT(*)::int AS cnt
           FROM released
           GROUP BY coupon_id
         ) r
         WHERE c.id = r.coupon_id
         RETURNING c.id
       )
       SELECT coupon_id FROM released`,
      [orderIds],
    );
    return result.rows;
  }

  async releaseByOrderId(orderId, client = this.db) {
    return this.releaseByOrderIds([orderId], client);
  }
}

export { CouponReservationRepository };
export default new CouponReservationRepository();
