import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import courseRepository from "../courses/repository.js";
import chapterRepository from "./chapter.repository.js";
import lessonRepository from "./lesson.repository.js";

const OWNER_MESSAGE = "You are not authorized to do this";

class LessonService {
  constructor({ lessonRepository, chapterRepository, courseRepository }) {
    this.lessonRepository = lessonRepository;
    this.chapterRepository = chapterRepository;
    this.courseRepository = courseRepository;
  }

  async createLesson({ chapterId, lessonData, user }) {
    const chapter = await this.chapterRepository.findById(chapterId);
    if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");

    const instructor = await this.chapterRepository.getInstructor(chapterId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    return this.lessonRepository.create({
      name: lessonData.name,
      description: lessonData.description,
      status: lessonData.status,
      xpPoints: lessonData.xpPoints,
      durationMinutes: lessonData.durationMinutes,
      position: lessonData.position,
      type: lessonData.type,
      chapterId,
      accessType: lessonData.accessType,
    });
  }

  async updateLesson(lessonId, lessonData, user) {
    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const instructor = await this.lessonRepository.getInstructor(lessonId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    return this.lessonRepository.update({
      lessonId,
      chapterId: lesson.chapter_id,
      name: lessonData.name,
      description: lessonData.description,
      status: lessonData.status,
      xpPoints: lessonData.xpPoints,
      durationMinutes: lessonData.durationMinutes,
      position: lessonData.position,
      type: lessonData.type,
      accessType: lessonData.accessType,
    });
  }

  async deleteLesson(lessonId, user) {
    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const instructor = await this.lessonRepository.getInstructor(lessonId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    await this.lessonRepository.delete(lessonId);
  }

  async getFirstLesson(courseId) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const firstLesson = await this.lessonRepository.getFirstLesson(courseId);
    if (!firstLesson) {
      throw new ApiError(StatusCode.NOT_FOUND, "First lesson not found");
    }
    return firstLesson;
  }
}

export { LessonService };
export default new LessonService({
  lessonRepository,
  chapterRepository,
  courseRepository,
});
