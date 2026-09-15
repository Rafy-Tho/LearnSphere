import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import { withTransaction } from "../../config/database.js";
import lessonRepository from "../content/lesson.repository.js";
import courseRepository from "../courses/repository.js";
import subscriptionRepository from "../subscriptions/subscription.repository.js";
import enrollmentRepository from "./enrollment.repository.js";
import learningProgressRepository from "./progress.repository.js";

class EnrollmentService {
  constructor({
    courseRepository,
    subscriptionRepository,
    lessonRepository,
    enrollmentRepository,
    learningProgressRepository,
  }) {
    this.courseRepository = courseRepository;
    this.subscriptionRepository = subscriptionRepository;
    this.lessonRepository = lessonRepository;
    this.enrollmentRepository = enrollmentRepository;
    this.learningProgressRepository = learningProgressRepository;
  }

  async enrollCourse({ courseId, userId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    if (course.access_type === "SUBSCRIPTION") {
      const activeSubscription =
        await this.subscriptionRepository.getActivePaidSubscription(userId);
      if (!activeSubscription) {
        throw new ApiError(
          StatusCode.FORBIDDEN,
          "A paid subscription is required to enroll in this course",
        );
      }
    }

    const firstLesson = await this.lessonRepository.getFirstLesson(courseId);
    if (!firstLesson) {
      throw new ApiError(StatusCode.NOT_FOUND, "First lesson not found");
    }

    const existingEnrollment = await this.enrollmentRepository.findOne({
      courseId,
      userId,
    });
    if (existingEnrollment) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "You are already enrolled in this course",
      );
    }

    return withTransaction(async (client) => {
      const enrollment = await this.enrollmentRepository.enroll(
        { courseId, userId, accessType: course.access_type },
        client,
      );

      await this.learningProgressRepository.create(
        { courseId, userId, lessonId: firstLesson.id },
        client,
      );

      return enrollment;
    });
  }

  async getEnrollment({ courseId, userId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return this.enrollmentRepository.findOne({ courseId, userId });
  }
}

export { EnrollmentService };
export default new EnrollmentService({
  courseRepository,
  subscriptionRepository,
  lessonRepository,
  enrollmentRepository,
  learningProgressRepository,
});
