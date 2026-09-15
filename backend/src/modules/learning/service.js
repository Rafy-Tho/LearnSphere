import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import Course from "../courses/repository.js";
import Lesson from "../content/lesson.repository.js";
import Enrollment from "./repository.js";
import LearningProgress from "./progress.repository.js";
import LessonCompletion from "./completion.repository.js";

// TODO(refactor): course/lesson cross-module calls should go through their services.

// --- Enrollments ---

export async function enrollCourse({ courseId, userId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const firstLesson = await Lesson.getFirstLesson(courseId);
  if (!firstLesson) {
    throw new ApiError(StatusCode.NOT_FOUND, "First lesson not found");
  }

  const existing = await Enrollment.findOne({ courseId, userId });
  if (existing) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "You are already enrolled in this course",
    );
  }

  const enrollment = await Enrollment.enroll({
    courseId,
    userId,
    accessType: course.access_type,
  });

  await LearningProgress.create({
    courseId,
    userId,
    lessonId: firstLesson.id,
  });

  return enrollment;
}

export async function getEnrollment({ courseId, userId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  return Enrollment.findOne({ courseId, userId });
}

// --- Learning progress ---

export async function createProgress({ courseId, userId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const firstLesson = await Lesson.getFirstLesson(courseId);
  if (!firstLesson) {
    throw new ApiError(StatusCode.NOT_FOUND, "First lesson not found");
  }

  const lesson = await Lesson.findById(firstLesson.id);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  const progressExists = await LearningProgress.findOne({ courseId, userId });
  if (progressExists) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "Learning progress already exists",
    );
  }

  return LearningProgress.create({
    courseId,
    userId,
    lessonId: firstLesson.id,
  });
}

export async function updateProgress({ courseId, userId, lessonId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const progress = await LearningProgress.findOne({ courseId, userId });
  if (!progress) {
    const created = await LearningProgress.create({
      courseId,
      userId,
      lessonId,
    });
    return { created: true, progress: created };
  }

  const updated = await LearningProgress.update({ courseId, userId, lessonId });
  return { created: false, progress: updated };
}

export async function getProgress({ courseId, userId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  return LearningProgress.findOne({ courseId, userId });
}

// --- Lesson completions ---

export async function createCompletion({ lessonId, userId }) {
  const courseId = await Course.getCourseIdByLessonId(lessonId);
  if (!courseId) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  return LessonCompletion.create({
    lessonId,
    userId,
    courseId,
    timeSpentMinutes: lesson.duration_minutes,
    xpEarned: lesson.xp_points,
  });
}

export async function getCourseCompletions({ courseId, userId }) {
  return LessonCompletion.getCourseCompletions(courseId, userId);
}

export async function getCompletion({ lessonId, userId }) {
  const courseId = await Course.getCourseIdByLessonId(lessonId);
  if (!courseId) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  return LessonCompletion.getCompletion({ lessonId, userId, courseId });
}
