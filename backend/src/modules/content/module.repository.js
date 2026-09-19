import pgPool from "../../config/database.js";

class ModuleRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({ courseId, name, description, position, status }) {
    const result = await this.db.query(
      `INSERT INTO modules (course_id,name,description,position,status)
        VALUES ($1,$2,$3,$4,$5)
        RETURNING *
      `,
      [courseId, name, description, position, status],
    );
    return result.rows[0];
  }
  async update({ id, name, description, position, status }) {
    const result = await this.db.query(
      `UPDATE modules
        SET name=$1,description=$2,position=$3,status=$4
        WHERE id=$5
        RETURNING *
      `,
      [name, description, position, status, id],
    );
    return result.rows[0];
  }
  async findById(moduleId) {
    const result = await this.db.query(
      `SELECT *
        FROM modules
        WHERE id = $1
      `,
      [moduleId],
    );
    return result.rows[0];
  }
  async delete(moduleId) {
    const result = await this.db.query(
      `DELETE FROM modules
        WHERE id = $1
        RETURNING *
      `,
      [moduleId],
    );
    return result.rows[0];
  }
  async getModulesWithCountsByCourseId(courseId) {
    const result = await this.db.query(
      `SELECT
         m.*,
         COALESCE(ch.chapter_count, 0)::int AS chapter_count,
         COALESCE(ls.lesson_count, 0)::int AS lesson_count
       FROM modules m
       LEFT JOIN (
         SELECT module_id, COUNT(*) AS chapter_count
         FROM chapters
         GROUP BY module_id
       ) ch ON ch.module_id = m.id
       LEFT JOIN (
         SELECT ch2.module_id, COUNT(l.id) AS lesson_count
         FROM chapters ch2
         LEFT JOIN lessons l ON l.chapter_id = ch2.id
         GROUP BY ch2.module_id
       ) ls ON ls.module_id = m.id
       WHERE m.course_id = $1
       ORDER BY m.position ASC`,
      [courseId],
    );
    return result.rows;
  }
  async getInstructor(id) {
    const query = `
    SELECT c.instructor_id, c.status AS course_status FROM courses c
    JOIN modules m ON m.course_id = c.id 
    WHERE m.id = $1
    `;
    const result = await this.db.query(query, [id]);
    return result.rows[0];
  }
}

export { ModuleRepository };
export default new ModuleRepository();
