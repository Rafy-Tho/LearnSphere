import pgPool from "../../config/database.js";

class QuestionRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async createQuestion({ lessonId, question, explanation, position }) {
    const result = await this.db.query(
      `INSERT INTO quizzes (
        lesson_id,
        question,
        explanation,
        position
      )
      VALUES ($1, $2, $3, $4)
      RETURNING *
      `,
      [lessonId, question, explanation, position],
    );
    return result.rows[0];
  }
  async updateQuestion({ questionId, question, explanation, position }) {
    const result = await this.db.query(
      `UPDATE quizzes
      SET question = $1,
          explanation = $2,
          position = $3
      WHERE id = $4
      RETURNING *
      `,
      [question, explanation, position, questionId],
    );
    return result.rows[0];
  }
  async deleteQuestion({ questionId }) {
    const result = await this.db.query(
      `DELETE FROM quizzes
      WHERE id = $1
      RETURNING *
      `,
      [questionId],
    );
    return result.rows[0];
  }
  async findById(questionId) {
    const result = await this.db.query(
      `SELECT * FROM quizzes
      WHERE id = $1
      `,
      [questionId],
    );
    return result.rows[0];
  }
  // Admin-safe: includes the answer key (`is_correct`) and explanation.
  async getQuestionsWithOptionsByLessonId(lessonId, courseId) {
    const query = `
      SELECT
        q.id,
        q.question,
        q.explanation,
        q.position,
        COALESCE(
          json_agg(
            json_build_object(
              'id', qo.id,
              'text', qo.text,
              'is_correct', qo.is_correct,
              'position', qo.position
            ) ORDER BY qo.position
          ) FILTER (WHERE qo.id IS NOT NULL),
          '[]'::json
        ) AS options
      FROM quizzes q
      JOIN lessons ls ON q.lesson_id = ls.id
      JOIN chapters ch ON ls.chapter_id = ch.id
      JOIN modules m ON ch.module_id = m.id
      LEFT JOIN quiz_options qo ON qo.quiz_id = q.id
      WHERE q.lesson_id = $1 AND m.course_id = $2
      GROUP BY q.id
      ORDER BY q.position ASC`;
    const result = await this.db.query(query, [lessonId, courseId]);
    return result.rows;
  }
  async getInstructor(id) {
    const query = `
    SELECT c.instructor_id FROM courses c
    JOIN modules m ON m.course_id = c.id 
    JOIN  chapters ch ON ch.module_id = m.id
    JOIN lessons ls ON ls.chapter_id = ch.id
    JOIN quizzes qz ON qz.lesson_id = ls.id
    WHERE qz.id = $1
    `;
    const result = await this.db.query(query, [id]);
    return result.rows[0];
  }
}

const Question = new QuestionRepository();

export default Question;
