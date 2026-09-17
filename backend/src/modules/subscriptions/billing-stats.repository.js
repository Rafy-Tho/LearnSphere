import pgPool from "../../config/database.js";

class BillingStatsRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async getStats() {
    const result = await this.db.query(
      `SELECT
         (SELECT COUNT(*) FROM user_subscriptions
           WHERE status = 'ACTIVE' AND end_date > NOW()) AS active_subscriptions,
         (SELECT COUNT(*) FROM subscription_payments) AS total_payments,
         (SELECT COUNT(*) FROM subscription_payments
           WHERE payment_status = 'COMPLETED') AS successful_payments,
         (SELECT COUNT(*) FROM subscription_payments
           WHERE payment_status = 'FAILED') AS failed_payments,
         (SELECT COALESCE(SUM(amount), 0) FROM subscription_payments
           WHERE payment_status IN ('COMPLETED', 'PARTIALLY_REFUNDED', 'REFUNDED')) AS total_revenue,
         (SELECT COALESCE(SUM(amount), 0) FROM payment_refunds
           WHERE refund_status = 'SUCCEEDED') AS total_refunds,
         (SELECT COUNT(*) FROM coupons WHERE is_active = TRUE) AS active_coupons,
         (SELECT COUNT(*) FROM coupon_redemptions) AS coupon_redemptions`,
    );

    const currencyResult = await this.db.query(
      `SELECT currency FROM subscription_payments
       ORDER BY created_at DESC
       LIMIT 1`,
    );

    const row = result.rows[0];
    const totalRevenue = Number(row.total_revenue);
    const totalRefunds = Number(row.total_refunds);

    return {
      active_subscriptions: Number(row.active_subscriptions),
      total_payments: Number(row.total_payments),
      successful_payments: Number(row.successful_payments),
      failed_payments: Number(row.failed_payments),
      total_revenue: totalRevenue,
      total_refunds: totalRefunds,
      net_revenue: Math.round((totalRevenue - totalRefunds) * 100) / 100,
      active_coupons: Number(row.active_coupons),
      coupon_redemptions: Number(row.coupon_redemptions),
      currency: currencyResult.rows[0]?.currency || "usd",
    };
  }
}

export { BillingStatsRepository };
export default new BillingStatsRepository();
