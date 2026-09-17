import pgPool from "../../config/database.js";

class LearningProgressRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({ courseId, userId, lessonId }, client = this.db) {
    const result = await client.query(
      `INSERT INTO learn_progress
      (course_id, user_id, current_lesson_id)
      VALUES ($1, $2, $3)
      RETURNING *`,
      [courseId, userId, lessonId],
    );
    return result.rows[0];
  }

  async update({ courseId, userId, lessonId }, client = this.db) {
    const result = await client.query(
      `UPDATE learn_progress
      SET current_lesson_id = $3
      WHERE course_id = $1 AND user_id = $2
      RETURNING *`,
      [courseId, userId, lessonId],
    );
    return result.rows[0];
  }

  // Advance the current lesson, creating the progress row if it is missing.
  async upsertCurrentLesson({ courseId, userId, lessonId }, client = this.db) {
    const result = await client.query(
      `INSERT INTO learn_progress (course_id, user_id, current_lesson_id)
       VALUES ($1, $2, $3)
       ON CONFLICT (user_id, course_id)
       DO UPDATE SET current_lesson_id = EXCLUDED.current_lesson_id
       RETURNING *`,
      [courseId, userId, lessonId],
    );
    return result.rows[0];
  }

  async findOne({ courseId, userId }) {
    const result = await this.db.query(
      `SELECT * FROM learn_progress WHERE course_id = $1 AND user_id = $2`,
      [courseId, userId],
    );
    return result.rows[0];
  }
}

export { LearningProgressRepository };

export default new LearningProgressRepository();
