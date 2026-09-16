import pgPool from "../../config/database.js";

class QuizAttemptRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async createAttempt({ userId, lessonId }, client = this.db) {
    const result = await client.query(
      `INSERT INTO quiz_attempts (user_id, lesson_id, status)
      VALUES ($1, $2, 'in_progress')
      RETURNING *`,
      [userId, lessonId],
    );
    return result.rows[0];
  }

  async createAnswers({ attemptId, answers }, client = this.db) {
    if (!answers.length) return [];

    const values = [];
    const placeholders = answers.map((answer, index) => {
      const base = index * 4;
      values.push(
        attemptId,
        answer.questionId,
        answer.selectedOptionId,
        answer.isCorrect,
      );
      return `($${base + 1}, $${base + 2}, $${base + 3}, $${base + 4})`;
    });

    const result = await client.query(
      `INSERT INTO quiz_answers (attempt_id, quiz_id, selected_option_id, is_correct)
      VALUES ${placeholders.join(", ")}
      RETURNING *`,
      values,
    );
    return result.rows;
  }

  async finalizeAttempt({ attemptId, score, totalQuestions }, client = this.db) {
    const result = await client.query(
      `UPDATE quiz_attempts
      SET status = 'completed',
          score = $1,
          total_questions = $2,
          completed_at = NOW()
      WHERE id = $3
      RETURNING *`,
      [score, totalQuestions, attemptId],
    );
    return result.rows[0];
  }

  async findCompletedByLesson({ userId, lessonId }) {
    const result = await this.db.query(
      `SELECT * FROM quiz_attempts
      WHERE user_id = $1 AND lesson_id = $2 AND status = 'completed'
      ORDER BY completed_at DESC`,
      [userId, lessonId],
    );
    return result.rows;
  }

  async findLatestCompleted({ userId, lessonId }) {
    const result = await this.db.query(
      `SELECT * FROM quiz_attempts
      WHERE user_id = $1 AND lesson_id = $2 AND status = 'completed'
      ORDER BY completed_at DESC
      LIMIT 1`,
      [userId, lessonId],
    );
    return result.rows[0];
  }

  async findAnswersWithQuestions(attemptId) {
    const result = await this.db.query(
      `SELECT
        qa.quiz_id,
        qa.selected_option_id,
        qa.is_correct,
        qa.answered_at,
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
      FROM quiz_answers qa
      JOIN quizzes q ON q.id = qa.quiz_id
      JOIN quiz_options qo ON qo.quiz_id = q.id
      WHERE qa.attempt_id = $1
      GROUP BY qa.id, q.id
      ORDER BY q.position`,
      [attemptId],
    );
    return result.rows;
  }
}

export { QuizAttemptRepository };
export default new QuizAttemptRepository();
