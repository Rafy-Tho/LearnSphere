import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import { withTransaction } from "../../config/database.js";
import lessonRepository from "../content/lesson.repository.js";
import courseRepository from "../courses/repository.js";
import enrollmentRepository from "./enrollment.repository.js";
import learningProgressRepository from "./progress.repository.js";
import activityService, { ACTIVITY_TYPE } from "./activity.service.js";

class ProgressService {
  constructor({
    courseRepository,
    lessonRepository,
    enrollmentRepository,
    learningProgressRepository,
    activityService,
  }) {
    this.courseRepository = courseRepository;
    this.lessonRepository = lessonRepository;
    this.enrollmentRepository = enrollmentRepository;
    this.learningProgressRepository = learningProgressRepository;
    this.activityService = activityService;
  }

  async createProgress({ courseId, userId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const firstLesson = await this.lessonRepository.getFirstLesson(courseId);
    if (!firstLesson) {
      throw new ApiError(StatusCode.NOT_FOUND, "First lesson not found");
    }

    const lesson = await this.lessonRepository.findById(firstLesson.id);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const existingProgress = await this.learningProgressRepository.findOne({
      courseId,
      userId,
    });
    if (existingProgress) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Learning progress already exists",
      );
    }

    return this.learningProgressRepository.create({
      courseId,
      userId,
      lessonId: firstLesson.id,
    });
  }

  async updateProgress({ courseId, userId, lessonId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const lessonCourseId =
      await this.courseRepository.getCourseIdByLessonId(lessonId);
    if (!lessonCourseId || lessonCourseId !== courseId) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Lesson does not belong to this course",
      );
    }

    const progress = await this.learningProgressRepository.findOne({
      courseId,
      userId,
    });
    if (!progress) {
      const createdProgress = await this.learningProgressRepository.create({
        courseId,
        userId,
        lessonId,
      });
      return { isCreated: true, progress: createdProgress };
    }

    const updatedProgress = await this.learningProgressRepository.update({
      courseId,
      userId,
      lessonId,
    });
    return { isCreated: false, progress: updatedProgress };
  }

  // Opening a lesson: point progress at it and record the start activities.
  // Both activity writes are idempotent, so revisiting a lesson is a no-op.
  async startLesson({ lessonId, userId }) {
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

    return withTransaction(async (client) => {
      const progress = await this.learningProgressRepository.upsertCurrentLesson(
        { courseId, userId, lessonId },
        client,
      );

      await this.activityService.record(
        { userId, type: ACTIVITY_TYPE.START_COURSE, courseId, once: true },
        client,
      );

      await this.activityService.record(
        {
          userId,
          type: ACTIVITY_TYPE.START_LESSON,
          courseId,
          lessonId,
          metadata: { lessonName: lesson.name },
          once: true,
        },
        client,
      );

      return progress;
    });
  }

  async getProgress({ courseId, userId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return this.learningProgressRepository.findOne({ courseId, userId });
  }
}

export { ProgressService };
export default new ProgressService({
  courseRepository,
  lessonRepository,
  enrollmentRepository,
  learningProgressRepository,
  activityService,
});
