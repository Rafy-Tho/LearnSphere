import pgPool from "../../config/database.js";

class EnrollmentRepository {
  constructor({ db = pgPool } = {}) {
    this.db = db;
  }

  async enroll({ courseId, userId, accessType }, client = this.db) {
    const result = await client.query(
      `INSERT INTO enrollments 
      (course_id, user_id, access_type) 
      VALUES ($1, $2, $3)
      RETURNING *`,
      [courseId, userId, accessType],
    );
    return result.rows[0];
  }
  async findOne({ courseId, userId }) {
    const result = await this.db.query(
      `SELECT * FROM enrollments WHERE course_id = $1 AND user_id = $2`,
      [courseId, userId],
    );
    return result.rows[0];
  }
  async getTotalEnrollments() {
    const result = await this.db.query(`SELECT COUNT(*) FROM enrollments`);
    return result.rows[0].count;
  }
}

export { EnrollmentRepository };

export default new EnrollmentRepository();
