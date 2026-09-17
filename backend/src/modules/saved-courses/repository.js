import pgPool from "../../config/database.js";

class SavedCourseRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async save({ userId, courseId }) {
    const query = `
    INSERT INTO saved_courses (user_id, course_id)
    VALUES ($1, $2)
    ON CONFLICT (user_id, course_id)
    DO UPDATE SET user_id = EXCLUDED.user_id
    RETURNING id, user_id, course_id, created_at;
    `;
    const result = await this.db.query(query, [userId, courseId]);
    return result.rows[0];
  }

  async unsave({ userId, courseId }) {
    const query = `
    DELETE FROM saved_courses
    WHERE user_id = $1 AND course_id = $2
    RETURNING id;
    `;
    const result = await this.db.query(query, [userId, courseId]);
    return result.rows[0];
  }

  async getSavedCourseIds(userId) {
    const query = `
    SELECT course_id
    FROM saved_courses
    WHERE user_id = $1
    ORDER BY created_at DESC;
    `;
    const result = await this.db.query(query, [userId]);
    return result.rows.map((row) => row.course_id);
  }

  async getSavedCourses({ userId, queryString }) {
    const page = Math.max(1, Number(queryString.page) || 1);
    const limit = Math.max(1, Number(queryString.limit) || 20);
    const offset = (page - 1) * limit;

    const countQuery = `
      SELECT COUNT(*) AS total
      FROM saved_courses sc
      JOIN courses c ON c.id = sc.course_id
      WHERE sc.user_id = $1 AND c.deleted_at IS NULL;
    `;

    const countResult = await this.db.query(countQuery, [userId]);
    const totalItems = Number(countResult.rows[0].total);
    const totalPages = Math.ceil(totalItems / limit);

    const query = `
      SELECT
        c.*,
        sc.created_at AS saved_at,
        lp.current_lesson_id AS lesson_progress,
        COUNT(DISTINCT lc.lesson_id) AS completed_lessons,
        COUNT(DISTINCT l.id) AS total_lessons,
        COALESCE(SUM(l.duration_minutes), 0) AS total_duration,
        ROUND(
          COUNT(DISTINCT lc.lesson_id)::DECIMAL
          / NULLIF(COUNT(DISTINCT l.id), 0) * 100,
          2
        ) AS progress_percentage
      FROM saved_courses sc
      JOIN courses c ON c.id = sc.course_id
      LEFT JOIN modules m ON m.course_id = c.id
      LEFT JOIN chapters ch ON ch.module_id = m.id
      LEFT JOIN lessons l ON l.chapter_id = ch.id
      LEFT JOIN lesson_completion lc
        ON lc.lesson_id = l.id
        AND lc.user_id = $1
      LEFT JOIN learn_progress lp
        ON lp.course_id = c.id
        AND lp.user_id = $1
      WHERE sc.user_id = $1 AND c.deleted_at IS NULL
      GROUP BY c.id, sc.created_at, lp.id
      ORDER BY sc.created_at DESC
      LIMIT $2 OFFSET $3;
    `;

    const result = await this.db.query(query, [userId, limit, offset]);

    return {
      data: result.rows,
      pagination: {
        totalItems,
        currentPage: page,
        totalPages,
        limit,
        next: page * limit < totalItems ? page + 1 : null,
        prev: page > 1 ? page - 1 : null,
      },
    };
  }
}

export { SavedCourseRepository };
export default new SavedCourseRepository();
