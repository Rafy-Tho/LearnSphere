import pgPool from "../../config/database.js";

class ChapterRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({ moduleId, position, name, description, status }) {
    const result = await this.db.query(
      "INSERT INTO chapters (module_id, position, name, description, status) VALUES ($1, $2, $3, $4, $5) RETURNING *",
      [moduleId, position, name, description, status],
    );
    return result.rows[0];
  }
  async findById(id) {
    const result = await this.db.query("SELECT * FROM chapters WHERE id = $1", [
      id,
    ]);
    return result.rows[0];
  }
  async findByModuleId(moduleId) {
    const result = await this.db.query(
      "SELECT * FROM chapters WHERE module_id = $1 ORDER BY position ASC",
      [moduleId],
    );
    return result.rows;
  }

  async findByModuleIdWithCounts(moduleId, courseId) {
    const result = await this.db.query(
      `SELECT
         ch.*,
         COALESCE(l.lesson_count, 0)::int AS lesson_count
       FROM chapters ch
       JOIN modules m ON ch.module_id = m.id
       LEFT JOIN (
         SELECT chapter_id, COUNT(*) AS lesson_count
         FROM lessons
         GROUP BY chapter_id
       ) l ON l.chapter_id = ch.id
       WHERE ch.module_id = $1 AND m.course_id = $2
       ORDER BY ch.position ASC`,
      [moduleId, courseId],
    );
    return result.rows;
  }
  async update({ id, position, name, description, status }) {
    const result = await this.db.query(
      "UPDATE chapters SET position = $1, name = $2, description = $3, status = $4 WHERE id = $5 RETURNING *",
      [position, name, description, status, id],
    );
    return result.rows[0];
  }
  async delete(id) {
    const result = await this.db.query(
      "DELETE FROM chapters WHERE id = $1 RETURNING *",
      [id],
    );
    return result.rows[0];
  }

  async getInstructor(id) {
    const query = `
    SELECT c.instructor_id FROM courses c
    JOIN modules m ON m.course_id = c.id 
    JOIN  chapters ch ON ch.module_id = m.id
    WHERE ch.id = $1
    `;
    const result = await this.db.query(query, [id]);
    return result.rows[0];
  }
}
export { ChapterRepository };
export default new ChapterRepository();
