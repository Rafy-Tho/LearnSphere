import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import assertOwnership from "../../common/auth/ownership.js";
import Answer from "../../modules/content/answer.repository.js";
import Chapter from "../../modules/content/chapter.repository.js";
import LessonContent from "../../modules/content/lessonContent.repository.js";
import Lesson from "../../modules/content/lesson.repository.js";
import Module from "../../modules/content/module.repository.js";
import Question from "../../modules/content/question.repository.js";
import Subscription from "../subscriptions/repository.js";
import User from "../users/repository.js";
import Course from "./repository.js";
import CourseObjective from "./objectives.repository.js";

// TODO(refactor): content/learning/subscription/user repositories move to their
// modules; replace these transitional imports with module services.

export async function createCourse({ instructorId, data }) {
  return Course.create({ instructorId, ...data });
}

export async function listCourses(query) {
  return Course.getAllCourses(query);
}

export async function updateCourse(courseId, data, user) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  assertOwnership({
    ownerId: course.instructor_id,
    user,
    message: "You are not authorized to update this course",
  });

  return Course.update({ id: courseId, ...data });
}

export async function deleteCourse(courseId, user) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  assertOwnership({
    ownerId: course.instructor_id,
    user,
    message: "You are not authorized to delete this course",
  });

  return Course.delete(courseId);
}

export async function getCourseDetails(courseId) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  return Course.getCourseDetailsById(courseId);
}

export async function getLearningData(courseId, userId) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const activePlan = userId
    ? await Subscription.getActivePaidSubscription(userId)
    : null;

  const moduleDetails = await Course.getLearningData(courseId);

  return {
    ...moduleDetails,
    modules: moduleDetails.modules.map((module) => ({
      ...module,
      lessons: module.lessons.map((lesson) =>
        lesson.access_type === "SUBSCRIPTION" && activePlan
          ? { ...lesson, access_type: "FREE" }
          : lesson,
      ),
    })),
  };
}

export async function getRecentlyViewed(userId) {
  const user = await User.findById(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  return Course.getRecentlyViewed(userId);
}

export async function getRecommended(userId) {
  const user = await User.findById(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  let recommended = await Course.getRecommended(userId);
  if (recommended.length === 0) {
    recommended = await Course.getHighlyRated();
  }
  return recommended;
}

export async function getPopular() {
  return Course.getPopular();
}

export async function getInProgress(userId, query) {
  const user = await User.findById(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  return Course.getCourseInProgress({ userId, queryString: query });
}

export async function getCompleted(userId, query) {
  const user = await User.findById(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  return Course.getCompletedCourses({ userId, queryString: query });
}

export async function getDashboard(query) {
  return Course.getAllCoursesDashboard(query);
}

export async function getDashboardDetails(courseId) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  // TODO(perf): consolidate these into 1-2 aggregate queries (audit P1-1).
  const objectives = await CourseObjective.getObjectivesByCourseId(courseId);
  const modules = await Module.getModulesByCourseId(courseId);
  const chapters = await Chapter.getChaptersByCourseId(courseId);
  const lessons = await Lesson.getLessonsByCourseId(courseId);
  const lessonContents =
    await LessonContent.getLessonContentsByCourseId(courseId);
  const quizzes = await Question.getQuestionsByCourseId(courseId);
  const options = await Answer.getOptionsByCourseId(courseId);

  return {
    course,
    objectives,
    modules,
    chapters,
    lessons,
    lessonContents,
    quizzes,
    options,
  };
}

// --- Course objectives ---

export async function getCourseObjectives(courseId) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

  return CourseObjective.getByCourseId(courseId);
}

export async function createCourseObjective({ courseId, data, user }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

  assertOwnership({
    ownerId: course.instructor_id,
    user,
    message: "You are not authorized to do this",
  });

  return CourseObjective.create({
    courseId,
    content: data.content,
    position: data.position,
  });
}

export async function updateCourseObjective(objectiveId, data, user) {
  const objective = await CourseObjective.findById(objectiveId);
  if (!objective) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Course objective not found");
  }

  const course = await Course.findById(objective.course_id);
  if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

  assertOwnership({
    ownerId: course.instructor_id,
    user,
    message: "You are not authorized to do this",
  });

  return CourseObjective.update({
    id: objectiveId,
    content: data.content,
    position: data.position,
  });
}

export async function deleteCourseObjective(objectiveId, user) {
  const objective = await CourseObjective.findById(objectiveId);
  if (!objective) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Course objective not found");
  }

  const course = await Course.findById(objective.course_id);
  if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

  assertOwnership({
    ownerId: course.instructor_id,
    user,
    message: "You are not authorized to do this",
  });

  return CourseObjective.delete(objectiveId);
}
