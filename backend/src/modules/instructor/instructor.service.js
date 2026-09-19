import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import courseRepository from "../courses/repository.js";
import instructorRepository from "./instructor.repository.js";

class InstructorService {
  constructor({ courseRepository, instructorRepository }) {
    this.courseRepository = courseRepository;
    this.instructorRepository = instructorRepository;
  }

  async #assertCourseAccess(courseId, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to view this course",
    });

    return course;
  }

  async getDashboard(user) {
    const [stats, recentEnrollments, recentReviews] = await Promise.all([
      this.instructorRepository.getDashboardStats(user.id),
      this.instructorRepository.getRecentEnrollments(user.id),
      this.instructorRepository.getRecentReviews(user.id),
    ]);

    return { ...stats, recentEnrollments, recentReviews };
  }

  async getStudents(courseId, user, query) {
    await this.#assertCourseAccess(courseId, user);

    return this.instructorRepository.getCourseStudents(
      {
        courseId,
        search: query.search || "",
        completion: query.completion || "",
      },
      { page: Number(query.page) || 1, limit: Number(query.limit) || 10 },
    );
  }

  async getAnalytics(courseId, user) {
    await this.#assertCourseAccess(courseId, user);

    const [summary, lessons, quiz] = await Promise.all([
      this.instructorRepository.getCourseSummaryStats(courseId),
      this.instructorRepository.getLessonDropOff(courseId),
      this.instructorRepository.getQuizStats(courseId),
    ]);

    return { ...summary, lessons, quiz };
  }

  async getReviews(courseId, user, query) {
    await this.#assertCourseAccess(courseId, user);

    const [reviews, summary] = await Promise.all([
      this.instructorRepository.getCourseReviews({
        courseId,
        page: Number(query.page) || 1,
        limit: Number(query.limit) || 10,
      }),
      this.instructorRepository.getReviewSummary(courseId),
    ]);

    return {
      reviews: reviews.data,
      summary,
      pagination: reviews.pagination,
    };
  }

  async getCertificates(courseId, user, query) {
    await this.#assertCourseAccess(courseId, user);

    return this.instructorRepository.getCourseCertificates({
      courseId,
      page: Number(query.page) || 1,
      limit: Number(query.limit) || 10,
    });
  }

  async getEarnings(user) {
    const [sharePercent, attributed, byCourse] = await Promise.all([
      this.instructorRepository.getRevenueSharePercent(),
      this.instructorRepository.getAttributedRevenue(user.id),
      this.instructorRepository.getRevenueByCourse(user.id),
    ]);

    const estimatedEarnings =
      Math.round(attributed * (sharePercent / 100) * 100) / 100;

    return {
      revenueSharePercent: sharePercent,
      attributedRevenue: Math.round(attributed * 100) / 100,
      estimatedEarnings,
      currency: "USD",
      courses: byCourse.map((row) => ({
        courseId: row.course_id,
        name: row.name,
        status: row.status,
        attributedRevenue: Number(row.attributed_revenue),
        estimatedEarnings:
          Math.round(
            Number(row.attributed_revenue) * (sharePercent / 100) * 100,
          ) / 100,
      })),
      isEstimate: true,
    };
  }

  async getPayouts(user, query) {
    return this.instructorRepository.getPayouts({
      instructorId: user.id,
      page: Number(query.page) || 1,
      limit: Number(query.limit) || 10,
    });
  }

  async getRevenueSettings() {
    const percent = await this.instructorRepository.getRevenueSharePercent();
    return { revenueSharePercent: percent };
  }

  async updateRevenueSettings(percent) {
    const saved = await this.instructorRepository.setRevenueSharePercent(
      percent,
    );
    return { revenueSharePercent: saved };
  }

  async listPayouts(query) {
    return this.instructorRepository.getPayouts({
      instructorId: query.instructorId || null,
      page: Number(query.page) || 1,
      limit: Number(query.limit) || 10,
    });
  }

  async createPayout(payload, user) {
    return this.instructorRepository.createPayout({
      instructorId: payload.instructorId,
      amount: payload.amount,
      currency: payload.currency || "USD",
      status: payload.status || "PENDING",
      periodStart: payload.periodStart || null,
      periodEnd: payload.periodEnd || null,
      note: payload.note || null,
      createdBy: user?.id || null,
    });
  }

  async updatePayout(payoutId, payload) {
    const payout = await this.instructorRepository.findPayoutById(payoutId);
    if (!payout) throw new ApiError(StatusCode.NOT_FOUND, "Payout not found");

    return this.instructorRepository.updatePayout({
      id: payoutId,
      status: payload.status,
      amount: payload.amount,
      note: payload.note,
    });
  }
}

export { InstructorService };
export default new InstructorService({
  courseRepository,
  instructorRepository,
});
