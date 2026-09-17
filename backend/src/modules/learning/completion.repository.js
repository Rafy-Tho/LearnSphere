import pgPool from "../../config/database.js";

class LessonCompletionRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({ courseId, userId, lessonId }, client = this.db) {
    const result = await client.query(
      `INSERT INTO lesson_completion (course_id, user_id, lesson_id)
       VALUES ($1, $2, $3)
       RETURNING *`,
      [courseId, userId, lessonId],
    );
    return result.rows[0];
  }

  async getCompletion({ courseId, userId, lessonId }, client = this.db) {
    const result = await client.query(
      `SELECT * FROM lesson_completion
       WHERE course_id = $1 AND user_id = $2 AND lesson_id = $3`,
      [courseId, userId, lessonId],
    );
    return result.rows[0];
  }

  async getCourseCompletions(courseId, userId) {
    const result = await this.db.query(
      `SELECT lesson_id FROM lesson_completion
       WHERE course_id = $1 AND user_id = $2`,
      [courseId, userId],
    );
    return result.rows.map((row) => row.lesson_id);
  }

  async isCourseComplete({ courseId, userId }, client = this.db) {
    const result = await client.query(
      `SELECT
         COUNT(DISTINCT l.id) AS total,
         COUNT(DISTINCT lc.lesson_id) AS completed
       FROM lessons l
       JOIN chapters ch ON ch.id = l.chapter_id
       JOIN modules m ON m.id = ch.module_id
       LEFT JOIN lesson_completion lc
         ON lc.lesson_id = l.id AND lc.user_id = $1
       WHERE m.course_id = $2`,
      [userId, courseId],
    );

    const total = Number(result.rows[0].total);
    const completed = Number(result.rows[0].completed);
    return total > 0 && total === completed;
  }
}

export { LessonCompletionRepository };

export default new LessonCompletionRepository();
