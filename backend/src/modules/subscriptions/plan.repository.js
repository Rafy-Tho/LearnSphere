import pgPool from "../../config/database.js";

class PlanRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async findById(id) {
    const result = await this.db.query(
      "SELECT * FROM subscription_plans WHERE id = $1",
      [id],
    );
    return result.rows[0];
  }

  async findAll({ limit = 20, offset = 0, activeOnly = false } = {}) {
    const result = await this.db.query(
      `SELECT * FROM subscription_plans
       ${activeOnly ? "WHERE is_active = TRUE" : ""}
       ORDER BY price ASC, created_at DESC
       LIMIT $1 OFFSET $2`,
      [limit, offset],
    );
    return result.rows;
  }

  async count({ activeOnly = false } = {}) {
    const result = await this.db.query(
      `SELECT COUNT(*) AS total FROM subscription_plans
       ${activeOnly ? "WHERE is_active = TRUE" : ""}`,
    );
    return Number(result.rows[0].total);
  }

  async create({ name, description, durationDays, price, currency, features }) {
    const result = await this.db.query(
      `INSERT INTO subscription_plans
         (name, description, duration_days, price, currency, features)
       VALUES ($1, $2, $3, $4, $5, $6)
       RETURNING *`,
      [
        name,
        description ?? null,
        durationDays,
        price,
        currency || "usd",
        JSON.stringify(features || []),
      ],
    );
    return result.rows[0];
  }

  async update(
    id,
    { name, description, durationDays, price, currency, isActive, features },
  ) {
    const result = await this.db.query(
      `UPDATE subscription_plans
       SET name = $1,
           description = $2,
           duration_days = $3,
           price = $4,
           currency = $5,
           is_active = $6,
           features = $7
       WHERE id = $8
       RETURNING *`,
      [
        name,
        description ?? null,
        durationDays,
        price,
        currency || "usd",
        isActive,
        JSON.stringify(features || []),
        id,
      ],
    );
    return result.rows[0];
  }

  async setActive(id, isActive) {
    const result = await this.db.query(
      `UPDATE subscription_plans
       SET is_active = $1
       WHERE id = $2
       RETURNING *`,
      [isActive, id],
    );
    return result.rows[0];
  }

  async countReferences(id) {
    const result = await this.db.query(
      `SELECT COUNT(*) AS total
       FROM user_subscriptions
       WHERE plan_id = $1`,
      [id],
    );
    return Number(result.rows[0].total);
  }

  async delete(id) {
    const result = await this.db.query(
      "DELETE FROM subscription_plans WHERE id = $1 RETURNING id",
      [id],
    );
    return result.rows[0];
  }
}

export { PlanRepository };
export default new PlanRepository();
