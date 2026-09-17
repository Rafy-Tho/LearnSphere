import pgPool from "../../config/database.js";

class WebhookEventRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  // Returns the inserted row, or undefined when the event was already handled.
  async tryInsert({ stripeEventId, eventType }, client = this.db) {
    const result = await client.query(
      `INSERT INTO stripe_webhook_events (stripe_event_id, event_type)
       VALUES ($1, $2)
       ON CONFLICT (stripe_event_id) DO NOTHING
       RETURNING *`,
      [stripeEventId, eventType],
    );
    return result.rows[0];
  }

  async markProcessed(id, client = this.db) {
    await client.query(
      `UPDATE stripe_webhook_events
       SET processed_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [id],
    );
  }
}

export { WebhookEventRepository };
export default new WebhookEventRepository();
