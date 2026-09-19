import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import assertCourseEditable from "../../common/auth/course-lock.js";
import emailService from "../../common/services/email-service.js";
import { ADMIN, REJECTABLE_STATUS } from "../../common/constants/constants.js";
import chapterRepository from "../content/chapter.repository.js";
import lessonContentRepository from "../content/lesson-content.repository.js";
import lessonRepository from "../content/lesson.repository.js";
import moduleRepository from "../content/module.repository.js";
import questionRepository from "../content/question.repository.js";
import subscriptionService from "../subscriptions/subscription.service.js";
import userRepository from "../users/repository.js";
import courseObjectiveRepository from "./objective.repository.js";
import courseRepository from "./repository.js";

class CourseService {
  constructor({
    courseRepository,
    courseObjectiveRepository,
    subscriptionService,
    moduleRepository,
    chapterRepository,
    lessonRepository,
    lessonContentRepository,
    questionRepository,
    userRepository,
    emailService,
  }) {
    this.courseRepository = courseRepository;
    this.courseObjectiveRepository = courseObjectiveRepository;
    this.subscriptionService = subscriptionService;
    this.moduleRepository = moduleRepository;
    this.chapterRepository = chapterRepository;
    this.lessonRepository = lessonRepository;
    this.lessonContentRepository = lessonContentRepository;
    this.questionRepository = questionRepository;
    this.userRepository = userRepository;
    this.emailService = emailService;
  }

  async createCourse({ instructorId, courseData, user }) {
    // Instructors always start in DRAFT and move through the review workflow.
    const status =
      user?.role === ADMIN && courseData.status ? courseData.status : "DRAFT";

    return this.courseRepository.create({
      instructorId,
      ...courseData,
      status,
    });
  }

  async listCourses(query) {
    return this.courseRepository.getAllCourses(query);
  }

  async updateCourse(courseId, courseData, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to update this course",
    });
    assertCourseEditable({ courseStatus: course.status, user });

    // Only admins may change lifecycle status through the generic update;
    // instructors use submit/approve/reject so review state is never bypassed.
    const status = user?.role === ADMIN ? courseData.status : course.status;

    return this.courseRepository.update({
      id: courseId,
      ...courseData,
      status,
    });
  }

  async submitForReview(courseId, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to submit this course",
    });

    if (!REJECTABLE_STATUS.includes(course.status)) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Only draft or rejected courses can be submitted for review",
      );
    }

    const modules =
      await this.moduleRepository.getModulesWithCountsByCourseId(courseId);
    if (!modules || modules.length === 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Add at least one module before submitting for review",
      );
    }

    return this.courseRepository.submitForReview(courseId);
  }

  async approveCourse(courseId, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    if (course.status !== "PENDING") {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Only courses pending review can be approved",
      );
    }

    const updated = await this.courseRepository.updateReviewStatus({
      id: courseId,
      status: "PUBLISHED",
      reviewedBy: user?.id,
    });

    await this.#notifyInstructor(course, {
      subject: `Your course "${course.name}" was approved`,
      message: `Good news! "${course.name}" has been approved and is now published.`,
    });

    return updated;
  }

  async rejectCourse(courseId, reason, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    if (course.status !== "PENDING") {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Only courses pending review can be rejected",
      );
    }

    const updated = await this.courseRepository.updateReviewStatus({
      id: courseId,
      status: "REJECTED",
      reviewedBy: user?.id,
      rejectionReason: reason,
    });

    await this.#notifyInstructor(course, {
      subject: `Your course "${course.name}" needs changes`,
      message: `"${course.name}" was not approved. Reason: ${reason}`,
    });

    return updated;
  }

  async #notifyInstructor(course, { subject, message }) {
    try {
      const instructor = await this.userRepository.findById(
        course.instructor_id,
      );
      if (!instructor?.email) return;

      await this.emailService.send({
        to: instructor.email,
        subject,
        text: message,
      });
    } catch {
      // Notification failures must never fail the review action.
    }
  }

  async deleteCourse(courseId, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to delete this course",
    });
    assertCourseEditable({ courseStatus: course.status, user });

    return this.courseRepository.delete(courseId);
  }

  async getCourseDetails(courseId) {
    const course = await this.courseRepository.getCourseDetailsById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return course;
  }

  async getLearningData(courseId, userId) {
    const hasActiveSubscription =
      await this.subscriptionService.hasActiveSubscription(userId);

    const curriculum = await this.courseRepository.getLearningData(courseId);
    if (!curriculum) {
      throw new ApiError(StatusCode.NOT_FOUND, "Course not found");
    }

    return {
      ...curriculum,
      modules: curriculum.modules.map((courseModule) => ({
        ...courseModule,
        lessons: courseModule.lessons.map((lesson) =>
          lesson.access_type === "SUBSCRIPTION" && hasActiveSubscription
            ? { ...lesson, access_type: "FREE" }
            : lesson,
        ),
      })),
    };
  }

  async getRecentlyViewed(userId) {
    return this.courseRepository.getRecentlyViewed(userId);
  }

  async getRecommended(userId) {
    let recommended = await this.courseRepository.getRecommended(userId);
    if (recommended.length === 0) {
      recommended = await this.courseRepository.getHighlyRated();
    }
    return recommended;
  }

  async getPopular() {
    return this.courseRepository.getPopular();
  }

  async getInProgress(userId, query) {
    return this.courseRepository.getCourseInProgress({
      userId,
      queryString: query,
    });
  }

  async getCompleted(userId, query) {
    return this.courseRepository.getCompletedCourses({
      userId,
      queryString: query,
    });
  }

  async getDashboard(query, user) {
    // Instructors only ever see their own courses; admins see everything and
    // may additionally filter by instructorId.
    const scopedQuery =
      user?.role === ADMIN ? query : { ...query, instructorId: user?.id };

    return this.courseRepository.getAllCoursesDashboard(scopedQuery);
  }

  async assertDashboardAccess(courseId, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to view this course dashboard",
    });

    return course;
  }

  async getCourseSummary(courseId, user) {
    const course = await this.assertDashboardAccess(courseId, user);

    const [objectives, modules] = await Promise.all([
      this.courseObjectiveRepository.getObjectivesByCourseId(courseId),
      this.moduleRepository.getModulesWithCountsByCourseId(courseId),
    ]);

    return { course, objectives, modules };
  }

  async getModuleChapters(courseId, moduleId, user) {
    await this.assertDashboardAccess(courseId, user);

    return this.chapterRepository.findByModuleIdWithCounts(moduleId, courseId);
  }

  async getChapterLessons(courseId, chapterId, user) {
    await this.assertDashboardAccess(courseId, user);

    return this.lessonRepository.findByChapterIdWithCounts(chapterId, courseId);
  }

  async getLessonContents(courseId, lessonId, user) {
    await this.assertDashboardAccess(courseId, user);

    return this.lessonContentRepository.findByLessonIdInCourse(
      lessonId,
      courseId,
    );
  }

  async getLessonQuestions(courseId, lessonId, user) {
    await this.assertDashboardAccess(courseId, user);

    return this.questionRepository.getQuestionsWithOptionsByLessonId(
      lessonId,
      courseId,
    );
  }
}

export { CourseService };
export default new CourseService({
  courseRepository,
  courseObjectiveRepository,
  subscriptionService,
  moduleRepository,
  chapterRepository,
  lessonRepository,
  lessonContentRepository,
  questionRepository,
  userRepository,
  emailService,
});
