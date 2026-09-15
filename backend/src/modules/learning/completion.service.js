import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import lessonRepository from "../content/lesson.repository.js";
import courseRepository from "../courses/repository.js";
import enrollmentRepository from "./enrollment.repository.js";
import lessonCompletionRepository from "./completion.repository.js";

class CompletionService {
  constructor({
    courseRepository,
    lessonRepository,
    enrollmentRepository,
    lessonCompletionRepository,
  }) {
    this.courseRepository = courseRepository;
    this.lessonRepository = lessonRepository;
    this.enrollmentRepository = enrollmentRepository;
    this.lessonCompletionRepository = lessonCompletionRepository;
  }

  async createCompletion({ lessonId, userId }) {
    const courseId = await this.courseRepository.getCourseIdByLessonId(lessonId);
    if (!courseId) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const enrollment = await this.enrollmentRepository.findOne({
      courseId,
      userId,
    });
    if (!enrollment) {
      throw new ApiError(
        StatusCode.FORBIDDEN,
        "You must be enrolled in this course",
      );
    }

    return this.lessonCompletionRepository.create({
      lessonId,
      userId,
      courseId,
      timeSpentMinutes: lesson.duration_minutes,
      xpEarned: lesson.xp_points,
    });
  }

  async getCourseCompletions({ courseId, userId }) {
    return this.lessonCompletionRepository.getCourseCompletions(
      courseId,
      userId,
    );
  }

  async getCompletion({ lessonId, userId }) {
    const courseId = await this.courseRepository.getCourseIdByLessonId(lessonId);
    if (!courseId) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    return this.lessonCompletionRepository.getCompletion({
      lessonId,
      userId,
      courseId,
    });
  }
}

export { CompletionService };
export default new CompletionService({
  courseRepository,
  lessonRepository,
  enrollmentRepository,
  lessonCompletionRepository,
});
