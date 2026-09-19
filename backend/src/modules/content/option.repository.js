import pgPool from "../../config/database.js";

class OptionRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async createOption({ questionId, text, isCorrect, position }) {
    const result = await this.db.query(
      `INSERT INTO quiz_options (
        quiz_id,
        text,
        is_correct,
        position
      )
      VALUES ($1, $2, $3, $4)
      RETURNING *
      `,
      [questionId, text, isCorrect, position],
    );
    return result.rows[0];
  }

  async findByQuestionId({ questionId }) {
    const result = await this.db.query(
      `SELECT * FROM quiz_options WHERE quiz_id = $1`,
      [questionId],
    );
    return result.rows;
  }

  async updateOption({ optionId, text, isCorrect, position }) {
    const result = await this.db.query(
      `UPDATE quiz_options
      SET text = $1,
          is_correct = $2,
          position = $3
      WHERE id = $4
      RETURNING *
      `,
      [text, isCorrect, position, optionId],
    );
    return result.rows[0];
  }

  async deleteOption(optionId) {
    const result = await this.db.query(
      `DELETE FROM quiz_options
      WHERE id = $1
      RETURNING *
      `,
      [optionId],
    );
    return result.rows[0];
  }

  async findById(optionId) {
    const result = await this.db.query(
      `SELECT * FROM quiz_options WHERE id = $1`,
      [optionId],
    );
    return result.rows[0];
  }
}

export { OptionRepository };
export default new OptionRepository();
