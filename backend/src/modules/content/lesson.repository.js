import pgPool from "../../config/database.js";

class LessonRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async create({
    chapterId,
    position,
    name,
    description,
    type,
    status,
    xpPoints,
    accessType,
    durationMinutes,
  }) {
    const query = `INSERT INTO lessons (
      chapter_id,
      position,
      name,
      description,
      type,
      status,
      xp_points,
      access_type,
      duration_minutes
    ) 
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) 
    RETURNING * `;
    const values = [
      chapterId,
      position,
      name,
      description,
      type,
      status,
      xpPoints,
      accessType,
      durationMinutes,
    ];
    const result = await this.db.query(query, values);
    return result.rows[0];
  }
  async update({
    lessonId,
    chapterId,
    position,
    name,
    description,
    type,
    status,
    xpPoints,
    accessType,
    durationMinutes,
  }) {
    const query = `UPDATE lessons
    SET
      chapter_id = $1,
      position = $2,
      name = $3,
      description = $4,
      type = $5,
      status = $6,
      xp_points = $7,
      duration_minutes = $8,
      access_type = $9
    WHERE
      id = $10
    RETURNING *
  `;
    const values = [
      chapterId,
      position,
      name,
      description,
      type,
      status,
      xpPoints,
      durationMinutes,
      accessType,
      lessonId,
    ];
    const result = await this.db.query(query, values);
    return result.rows[0];
  }
  async delete(id) {
    const query = `DELETE FROM lessons WHERE id = $1 RETURNING *`;
    const values = [id];
    const result = await this.db.query(query, values);
    return result.rows[0];
  }
  async findById(id) {
    const query = `SELECT * FROM lessons WHERE id = $1`;
    const values = [id];
    const result = await this.db.query(query, values);
    return result.rows[0];
  }
  async findByChapterId(chapter_id) {
    const query = `SELECT * FROM lessons WHERE chapter_id = $1 ORDER BY position ASC`;
    const values = [chapter_id];
    const result = await this.db.query(query, values);
    return result.rows;
  }

  async findByChapterIdWithCounts(chapterId, courseId) {
    const query = `
      SELECT
        ls.*,
        COALESCE(lc.content_count, 0)::int AS content_count,
        COALESCE(qz.quiz_count, 0)::int AS quiz_count
      FROM lessons ls
      JOIN chapters ch ON ls.chapter_id = ch.id
      JOIN modules m ON ch.module_id = m.id
      LEFT JOIN (
        SELECT lesson_id, COUNT(*) AS content_count
        FROM lesson_contents
        GROUP BY lesson_id
      ) lc ON lc.lesson_id = ls.id
      LEFT JOIN (
        SELECT lesson_id, COUNT(*) AS quiz_count
        FROM quizzes
        GROUP BY lesson_id
      ) qz ON qz.lesson_id = ls.id
      WHERE ls.chapter_id = $1 AND m.course_id = $2
      ORDER BY ls.position ASC`;
    const values = [chapterId, courseId];
    const result = await this.db.query(query, values);
    return result.rows;
  }

  async getFirstLesson(courseId) {
    const query = `
     SELECT l.id
     FROM lessons AS l
     JOIN chapters AS c ON l.chapter_id = c.id
     JOIN modules AS m ON c.module_id = m.id
     WHERE m.course_id = $1
     ORDER BY 
     m.position ASC,
     c.position ASC,
     l.position ASC
     LIMIT 1`;
    const values = [courseId];
    const result = await this.db.query(query, values);
    return result.rows[0];
  }

  // Learner-safe: never exposes the answer key (`is_correct`) or explanation.
  async getQuestions(lessonId) {
    const query = `SELECT 
  q.id,
  q.question,
  q.position,
  json_agg(
    json_build_object(
      'id', qo.id,
      'text', qo.text,
      'position', qo.position
    ) ORDER BY qo.position
  ) AS options
  FROM quizzes q
  JOIN quiz_options qo ON qo.quiz_id = q.id
  WHERE q.lesson_id = $1
  GROUP BY q.id
  ORDER BY q.position;`;
    const values = [lessonId];
    const result = await this.db.query(query, values);
    return result.rows;
  }

  // Server-side only: includes the answer key for grading.
  async getQuestionsWithAnswers(lessonId) {
    const query = `SELECT 
  q.id,
  q.question,
  q.explanation,
  q.position,
  json_agg(
    json_build_object(
      'id', qo.id,
      'text', qo.text,
      'is_correct', qo.is_correct,
      'position', qo.position
    ) ORDER BY qo.position
  ) AS options
  FROM quizzes q
  JOIN quiz_options qo ON qo.quiz_id = q.id
  WHERE q.lesson_id = $1
  GROUP BY q.id
  ORDER BY q.position;`;
    const values = [lessonId];
    const result = await this.db.query(query, values);
    return result.rows;
  }

  async getInstructor(id) {
    const query = `
    SELECT c.instructor_id, c.status AS course_status FROM courses c
    JOIN modules m ON m.course_id = c.id 
    JOIN  chapters ch ON ch.module_id = m.id
    JOIN lessons ls ON ls.chapter_id = ch.id
    WHERE ls.id = $1
    `;
    const result = await this.db.query(query, [id]);
    return result.rows[0];
  }

  async getCourse(id) {
    const query = `
    SELECT c.id AS course_id, c.instructor_id
    FROM courses c
    JOIN modules m ON m.course_id = c.id
    JOIN chapters ch ON ch.module_id = m.id
    JOIN lessons ls ON ls.chapter_id = ch.id
    WHERE ls.id = $1
    `;
    const result = await this.db.query(query, [id]);
    return result.rows[0];
  }
}
export { LessonRepository };
export default new LessonRepository();
