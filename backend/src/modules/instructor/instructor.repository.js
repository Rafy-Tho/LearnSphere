import pgPool from "../../config/database.js";
import { buildPagination } from "../../common/query/pagination.js";
import { INSTRUCTOR_REVENUE_SHARE_DEFAULT } from "../../common/constants/constants.js";

const REVENUE_SHARE_KEY = "instructor_revenue_share_percent";

class InstructorRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async getDashboardStats(instructorId) {
    const [courseCounts, engagement, reviews] = await Promise.all([
      this.db.query(
        `SELECT
           COUNT(*) AS total,
           COUNT(*) FILTER (WHERE status = 'PUBLISHED') AS published,
           COUNT(*) FILTER (WHERE status = 'PENDING') AS pending,
           COUNT(*) FILTER (WHERE status = 'DRAFT') AS draft,
           COUNT(*) FILTER (WHERE status = 'REJECTED') AS rejected
         FROM courses
         WHERE instructor_id = $1 AND deleted_at IS NULL`,
        [instructorId],
      ),
      this.db.query(
        `SELECT
           COUNT(DISTINCT e.user_id) AS total_students,
           COUNT(e.id) AS total_enrollments
         FROM enrollments e
         JOIN courses c ON c.id = e.course_id
         WHERE c.instructor_id = $1 AND c.deleted_at IS NULL`,
        [instructorId],
      ),
      this.db.query(
        `SELECT
           COUNT(*) AS total_reviews,
           COALESCE(ROUND(AVG(cr.rating)::numeric, 2), 0) AS average_rating
         FROM course_reviews cr
         JOIN courses c ON c.id = cr.course_id
         WHERE c.instructor_id = $1 AND c.deleted_at IS NULL`,
        [instructorId],
      ),
    ]);

    const courseRow = courseCounts.rows[0];
    const engagementRow = engagement.rows[0];
    const reviewRow = reviews.rows[0];

    return {
      totalCourses: Number(courseRow.total),
      publishedCourses: Number(courseRow.published),
      pendingCourses: Number(courseRow.pending),
      draftCourses: Number(courseRow.draft),
      rejectedCourses: Number(courseRow.rejected),
      totalStudents: Number(engagementRow.total_students),
      totalEnrollments: Number(engagementRow.total_enrollments),
      totalReviews: Number(reviewRow.total_reviews),
      averageRating: Number(reviewRow.average_rating),
    };
  }

  async getRecentEnrollments(instructorId, limit = 5) {
    const result = await this.db.query(
      `SELECT
         e.id,
         e.enrolled_at,
         u.name AS student_name,
         u.email AS student_email,
         c.id AS course_id,
         c.name AS course_name
       FROM enrollments e
       JOIN users u ON u.id = e.user_id
       JOIN courses c ON c.id = e.course_id
       WHERE c.instructor_id = $1 AND c.deleted_at IS NULL
       ORDER BY e.enrolled_at DESC
       LIMIT $2`,
      [instructorId, limit],
    );
    return result.rows;
  }

  async getRecentReviews(instructorId, limit = 5) {
    const result = await this.db.query(
      `SELECT
         cr.id,
         cr.rating,
         cr.review,
         cr.created_at,
         u.name AS student_name,
         c.id AS course_id,
         c.name AS course_name
       FROM course_reviews cr
       JOIN users u ON u.id = cr.user_id
       JOIN courses c ON c.id = cr.course_id
       WHERE c.instructor_id = $1 AND c.deleted_at IS NULL
       ORDER BY cr.created_at DESC
       LIMIT $2`,
      [instructorId, limit],
    );
    return result.rows;
  }

  async getCourseStudents(
    { courseId, search = "", completion = "" },
    { page = 1, limit = 10 } = {},
  ) {
    const offset = (page - 1) * limit;
    const term = search ? `%${search}%` : "";

    const rosterCte = `
      WITH lesson_totals AS (
        SELECT m.course_id, COUNT(l.id) AS total_lessons
        FROM modules m
        JOIN chapters ch ON ch.module_id = m.id
        JOIN lessons l ON l.chapter_id = ch.id
        GROUP BY m.course_id
      ),
      roster AS (
        SELECT
          e.id,
          e.enrolled_at,
          e.access_type,
          u.id AS user_id,
          u.name,
          u.email,
          u.image_url,
          COALESCE(lt.total_lessons, 0) AS total_lessons,
          COALESCE(done.completed_lessons, 0) AS completed_lessons,
          CASE
            WHEN COALESCE(lt.total_lessons, 0) > 0
            THEN ROUND(
              COALESCE(done.completed_lessons, 0)::numeric * 100 / lt.total_lessons
            )
            ELSE 0
          END AS progress_percentage,
          done.last_activity
        FROM enrollments e
        JOIN users u ON u.id = e.user_id
        LEFT JOIN lesson_totals lt ON lt.course_id = e.course_id
        LEFT JOIN (
          SELECT
            lc.user_id,
            lc.course_id,
            COUNT(DISTINCT lc.lesson_id) AS completed_lessons,
            MAX(lc.created_at) AS last_activity
          FROM lesson_completion lc
          WHERE lc.course_id = $1
          GROUP BY lc.user_id, lc.course_id
        ) done
          ON done.user_id = e.user_id AND done.course_id = e.course_id
        WHERE e.course_id = $1
      )
    `;

    const filter = `
      WHERE ($2 = '' OR name ILIKE '%' || $2 || '%' OR email ILIKE '%' || $2 || '%')
        AND (
          $3 = ''
          OR ($3 = 'COMPLETED' AND progress_percentage >= 100)
          OR ($3 = 'IN_PROGRESS' AND progress_percentage < 100)
        )
    `;

    const [dataResult, countResult] = await Promise.all([
      this.db.query(
        `${rosterCte}
         SELECT * FROM roster
         ${filter}
         ORDER BY enrolled_at DESC
         LIMIT $4 OFFSET $5`,
        [courseId, term, completion, limit, offset],
      ),
      this.db.query(
        `${rosterCte}
         SELECT COUNT(*) FROM roster
         ${filter}`,
        [courseId, term, completion],
      ),
    ]);

    const total = Number(countResult.rows[0].count);

    return {
      data: dataResult.rows,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async getCourseSummaryStats(courseId) {
    const result = await this.db.query(
      `WITH totals AS (
         SELECT
           (SELECT COUNT(*) FROM enrollments WHERE course_id = $1) AS total_enrollments,
           (SELECT COUNT(l.id)
              FROM modules m
              JOIN chapters ch ON ch.module_id = m.id
              JOIN lessons l ON l.chapter_id = ch.id
             WHERE m.course_id = $1) AS total_lessons
       ),
       per_student AS (
         SELECT
           e.user_id,
           COUNT(DISTINCT lc.lesson_id) AS completed_lessons
         FROM enrollments e
         LEFT JOIN lesson_completion lc
           ON lc.course_id = e.course_id AND lc.user_id = e.user_id
         WHERE e.course_id = $1
         GROUP BY e.user_id
       )
       SELECT
         t.total_enrollments,
         COUNT(ps.user_id) AS total_students,
         t.total_lessons,
         COALESCE(SUM(ps.completed_lessons), 0) AS total_completions,
         COUNT(*) FILTER (
           WHERE t.total_lessons > 0 AND ps.completed_lessons = t.total_lessons
         ) AS completed_students,
         COALESCE(ROUND(AVG(ps.completed_lessons)::numeric, 2), 0) AS avg_completed_lessons
       FROM totals t
       LEFT JOIN per_student ps ON TRUE
       GROUP BY t.total_enrollments, t.total_lessons`,
      [courseId],
    );

    const row = result.rows[0];
    const totalStudents = Number(row.total_students);
    const totalLessons = Number(row.total_lessons);
    const totalCompletions = Number(row.total_completions);
    const completedStudents = Number(row.completed_students);
    const possibleCompletions = totalStudents * totalLessons;

    return {
      totalStudents,
      totalEnrollments: Number(row.total_enrollments),
      totalLessons,
      totalCompletions,
      completedStudents,
      avgCompletedLessons: Number(row.avg_completed_lessons),
      completionRate:
        possibleCompletions > 0
          ? Math.round((totalCompletions * 100) / possibleCompletions)
          : 0,
    };
  }

  async getLessonDropOff(courseId) {
    const result = await this.db.query(
      `SELECT
         m.id AS module_id,
         m.name AS module_name,
         m.position AS module_position,
         ch.id AS chapter_id,
         ch.name AS chapter_name,
         ch.position AS chapter_position,
         l.id AS lesson_id,
         l.name AS lesson_name,
         l.position AS lesson_position,
         COUNT(DISTINCT lc.user_id) AS completed_count
       FROM modules m
       JOIN chapters ch ON ch.module_id = m.id
       JOIN lessons l ON l.chapter_id = ch.id
       LEFT JOIN lesson_completion lc ON lc.lesson_id = l.id
       WHERE m.course_id = $1
       GROUP BY m.id, ch.id, l.id
       ORDER BY m.position, ch.position, l.position`,
      [courseId],
    );
    return result.rows;
  }

  async getQuizStats(courseId) {
    const result = await this.db.query(
      `SELECT
         COUNT(*) AS total_attempts,
         COUNT(*) FILTER (WHERE qa.status = 'completed') AS completed_attempts,
         COUNT(*) FILTER (
           WHERE qa.status = 'completed'
             AND qa.total_questions > 0
             AND qa.score::numeric * 100 / qa.total_questions >= 60
         ) AS passed_attempts,
         COALESCE(
           ROUND(AVG(
             CASE WHEN qa.total_questions > 0
               THEN qa.score::numeric * 100 / qa.total_questions
             END
           ), 2),
           0
         ) AS avg_score_percentage
       FROM quiz_attempts qa
       JOIN lessons l ON l.id = qa.lesson_id
       JOIN chapters ch ON ch.id = l.chapter_id
       JOIN modules m ON m.id = ch.module_id
       WHERE m.course_id = $1`,
      [courseId],
    );

    const row = result.rows[0];
    return {
      totalAttempts: Number(row.total_attempts),
      completedAttempts: Number(row.completed_attempts),
      passedAttempts: Number(row.passed_attempts),
      avgScorePercentage: Number(row.avg_score_percentage),
      passThreshold: 60,
    };
  }

  async getCourseReviews({ courseId, page = 1, limit = 10 }) {
    const offset = (page - 1) * limit;
    const [dataResult, countResult] = await Promise.all([
      this.db.query(
        `SELECT
           cr.id,
           cr.rating,
           cr.review,
           cr.created_at,
           u.name AS user_name,
           u.email AS user_email,
           u.image_url AS user_profile
         FROM course_reviews cr
         JOIN users u ON u.id = cr.user_id
         WHERE cr.course_id = $1
         ORDER BY cr.created_at DESC
         LIMIT $2 OFFSET $3`,
        [courseId, limit, offset],
      ),
      this.db.query(
        `SELECT COUNT(*) FROM course_reviews WHERE course_id = $1`,
        [courseId],
      ),
    ]);

    const total = Number(countResult.rows[0].count);
    return {
      data: dataResult.rows,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async getReviewSummary(courseId) {
    const result = await this.db.query(
      `SELECT
         COUNT(*) AS total,
         COALESCE(ROUND(AVG(rating)::numeric, 2), 0) AS average,
         COUNT(*) FILTER (WHERE rating = 5) AS rating_5,
         COUNT(*) FILTER (WHERE rating = 4) AS rating_4,
         COUNT(*) FILTER (WHERE rating = 3) AS rating_3,
         COUNT(*) FILTER (WHERE rating = 2) AS rating_2,
         COUNT(*) FILTER (WHERE rating = 1) AS rating_1
       FROM course_reviews
       WHERE course_id = $1`,
      [courseId],
    );
    const row = result.rows[0];
    return {
      total: Number(row.total),
      average: Number(row.average),
      ratings: {
        5: Number(row.rating_5),
        4: Number(row.rating_4),
        3: Number(row.rating_3),
        2: Number(row.rating_2),
        1: Number(row.rating_1),
      },
    };
  }

  async getCourseCertificates({ courseId, page = 1, limit = 10 }) {
    const offset = (page - 1) * limit;
    const [dataResult, countResult] = await Promise.all([
      this.db.query(
        `SELECT
           ce.id,
           ce.certificate_number,
           ce.confirm,
           ce.issued_at,
           ce.confirmed_at,
           u.name AS user_name,
           u.email AS user_email
         FROM certificates ce
         JOIN users u ON u.id = ce.user_id
         WHERE ce.course_id = $1
         ORDER BY ce.issued_at DESC
         LIMIT $2 OFFSET $3`,
        [courseId, limit, offset],
      ),
      this.db.query(
        `SELECT COUNT(*) FROM certificates WHERE course_id = $1`,
        [courseId],
      ),
    ]);

    const total = Number(countResult.rows[0].count);
    return {
      data: dataResult.rows,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async getRevenueSharePercent() {
    const result = await this.db.query(
      `SELECT value FROM platform_settings WHERE key = $1`,
      [REVENUE_SHARE_KEY],
    );
    const raw = result.rows[0]?.value;
    const value = Number(raw);
    return Number.isFinite(value)
      ? value
      : INSTRUCTOR_REVENUE_SHARE_DEFAULT;
  }

  async setRevenueSharePercent(percent) {
    const result = await this.db.query(
      `INSERT INTO platform_settings (key, value, updated_at)
       VALUES ($1, $2::jsonb, CURRENT_TIMESTAMP)
       ON CONFLICT (key)
       DO UPDATE SET value = EXCLUDED.value, updated_at = CURRENT_TIMESTAMP
       RETURNING value`,
      [REVENUE_SHARE_KEY, JSON.stringify(percent)],
    );
    return Number(result.rows[0].value);
  }

  async getAttributedRevenue(instructorId) {
    const result = await this.db.query(
      `WITH payments AS (
         SELECT sp.id, sp.amount, us.user_id
         FROM subscription_payments sp
         JOIN user_subscriptions us ON us.id = sp.user_subscription_id
         WHERE sp.payment_status IN ('COMPLETED', 'PARTIALLY_REFUNDED')
           AND sp.paid_at IS NOT NULL
       ),
       refunded AS (
         SELECT payment_id, SUM(amount) AS amount
         FROM payment_refunds
         WHERE refund_status = 'SUCCEEDED'
         GROUP BY payment_id
       ),
       net_payments AS (
         SELECT p.user_id, GREATEST(p.amount - COALESCE(r.amount, 0), 0) AS net_amount
         FROM payments p
         LEFT JOIN refunded r ON r.payment_id = p.id
       ),
       course_counts AS (
         SELECT user_id, COUNT(DISTINCT course_id) AS cnt
         FROM enrollments
         GROUP BY user_id
       ),
       attribution AS (
         SELECT np.net_amount / cc.cnt AS share_amount
         FROM net_payments np
         JOIN course_counts cc ON cc.user_id = np.user_id AND cc.cnt > 0
         JOIN enrollments e ON e.user_id = np.user_id
         JOIN courses c ON c.id = e.course_id
         WHERE c.instructor_id = $1 AND c.deleted_at IS NULL
       )
       SELECT COALESCE(SUM(share_amount), 0) AS attributed_revenue FROM attribution`,
      [instructorId],
    );
    return Number(result.rows[0].attributed_revenue);
  }

  async getRevenueByCourse(instructorId) {
    const result = await this.db.query(
      `WITH payments AS (
         SELECT sp.id, sp.amount, us.user_id
         FROM subscription_payments sp
         JOIN user_subscriptions us ON us.id = sp.user_subscription_id
         WHERE sp.payment_status IN ('COMPLETED', 'PARTIALLY_REFUNDED')
           AND sp.paid_at IS NOT NULL
       ),
       refunded AS (
         SELECT payment_id, SUM(amount) AS amount
         FROM payment_refunds
         WHERE refund_status = 'SUCCEEDED'
         GROUP BY payment_id
       ),
       net_payments AS (
         SELECT p.user_id, GREATEST(p.amount - COALESCE(r.amount, 0), 0) AS net_amount
         FROM payments p
         LEFT JOIN refunded r ON r.payment_id = p.id
       ),
       course_counts AS (
         SELECT user_id, COUNT(DISTINCT course_id) AS cnt
         FROM enrollments
         GROUP BY user_id
       ),
       per_course AS (
         SELECT e.course_id, SUM(np.net_amount / cc.cnt) AS attributed
         FROM net_payments np
         JOIN course_counts cc ON cc.user_id = np.user_id AND cc.cnt > 0
         JOIN enrollments e ON e.user_id = np.user_id
         JOIN courses c ON c.id = e.course_id
         WHERE c.instructor_id = $1 AND c.deleted_at IS NULL
         GROUP BY e.course_id
       )
       SELECT
         c.id AS course_id,
         c.name,
         c.status,
         COALESCE(pc.attributed, 0) AS attributed_revenue
       FROM courses c
       LEFT JOIN per_course pc ON pc.course_id = c.id
       WHERE c.instructor_id = $1 AND c.deleted_at IS NULL
       ORDER BY attributed_revenue DESC`,
      [instructorId],
    );
    return result.rows;
  }

  async getPayouts({ instructorId = null, page = 1, limit = 10 } = {}) {
    const offset = (page - 1) * limit;
    const [dataResult, countResult] = await Promise.all([
      this.db.query(
        `SELECT
           p.id,
           p.instructor_id,
           p.amount,
           p.currency,
           p.status,
           p.period_start,
           p.period_end,
           p.note,
           p.paid_at,
           p.created_at,
           u.name AS instructor_name,
           u.email AS instructor_email
         FROM instructor_payouts p
         JOIN users u ON u.id = p.instructor_id
         WHERE ($1::uuid IS NULL OR p.instructor_id = $1)
         ORDER BY p.created_at DESC
         LIMIT $2 OFFSET $3`,
        [instructorId, limit, offset],
      ),
      this.db.query(
        `SELECT COUNT(*) FROM instructor_payouts
         WHERE ($1::uuid IS NULL OR instructor_id = $1)`,
        [instructorId],
      ),
    ]);

    const total = Number(countResult.rows[0].count);
    return {
      data: dataResult.rows,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async createPayout({
    instructorId,
    amount,
    currency = "USD",
    status = "PENDING",
    periodStart = null,
    periodEnd = null,
    note = null,
    createdBy = null,
  }) {
    const result = await this.db.query(
      `INSERT INTO instructor_payouts
         (instructor_id, amount, currency, status, period_start, period_end, note, created_by)
       VALUES ($1, $2, $3, $4::payout_status, $5, $6, $7, $8)
       RETURNING *`,
      [
        instructorId,
        amount,
        currency,
        status,
        periodStart,
        periodEnd,
        note,
        createdBy,
      ],
    );
    return result.rows[0];
  }

  async updatePayout({ id, status, amount, note }) {
    const result = await this.db.query(
      `UPDATE instructor_payouts
       SET
         status = COALESCE($2::payout_status, status),
         amount = COALESCE($3, amount),
         note = COALESCE($4, note),
         paid_at = CASE
           WHEN $2::payout_status = 'PAID' THEN COALESCE(paid_at, CURRENT_TIMESTAMP)
           ELSE paid_at
         END,
         updated_at = CURRENT_TIMESTAMP
       WHERE id = $1
       RETURNING *`,
      [id, status ?? null, amount ?? null, note ?? null],
    );
    return result.rows[0];
  }

  async findPayoutById(id) {
    const result = await this.db.query(
      `SELECT * FROM instructor_payouts WHERE id = $1`,
      [id],
    );
    return result.rows[0];
  }
}

export { InstructorRepository };
export default new InstructorRepository();
