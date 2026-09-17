import pgPool from "../../config/database.js";

class ActivityRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create(
    { userId, type, courseId = null, lessonId = null, metadata = {} },
    client = this.db,
  ) {
    const result = await client.query(
      `INSERT INTO user_activities (user_id, course_id, lesson_id, type, metadata)
       VALUES ($1, $2, $3, $4, $5)
       RETURNING *`,
      [userId, courseId, lessonId, type, metadata],
    );
    return result.rows[0];
  }

  async exists({ userId, type, courseId = null, lessonId = null }, client = this.db) {
    const result = await client.query(
      `SELECT 1 FROM user_activities
       WHERE user_id = $1
         AND type = $2
         AND course_id IS NOT DISTINCT FROM $3
         AND lesson_id IS NOT DISTINCT FROM $4
       LIMIT 1`,
      [userId, type, courseId, lessonId],
    );
    return result.rowCount > 0;
  }

  async findByUser(userId, { limit = 20, offset = 0 } = {}) {
    const result = await this.db.query(
      `SELECT
         a.id,
         a.type,
         a.metadata,
         a.created_at,
         a.course_id,
         c.name AS course_name,
         a.lesson_id,
         l.name AS lesson_name
       FROM user_activities a
       LEFT JOIN courses c ON c.id = a.course_id
       LEFT JOIN lessons l ON l.id = a.lesson_id
       WHERE a.user_id = $1
       ORDER BY a.created_at DESC
       LIMIT $2 OFFSET $3`,
      [userId, limit, offset],
    );
    return result.rows;
  }

  async countByUser(userId) {
    const result = await this.db.query(
      `SELECT COUNT(*) AS total FROM user_activities WHERE user_id = $1`,
      [userId],
    );
    return Number(result.rows[0].total);
  }
}

export { ActivityRepository };
export default new ActivityRepository();
