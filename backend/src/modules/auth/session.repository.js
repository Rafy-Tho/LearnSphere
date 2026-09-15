import pgPool from "../../config/database.js";

class SessionRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  // Remove every stored session for a user (e.g. after a password change/reset).
  // The `session` table is managed by connect-pg-simple; the user id lives in
  // the JSON `sess` column.
  async deleteByUserId(userId, client = this.db) {
    await client.query(
      `DELETE FROM session WHERE sess -> 'user' ->> 'id' = $1`,
      [userId],
    );
  }
}

export { SessionRepository };
export default new SessionRepository();
