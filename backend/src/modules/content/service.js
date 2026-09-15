import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import assertOwnership from "../../common/auth/ownership.js";
import Subscription from "../subscriptions/repository.js";
import Course from "../courses/repository.js";
import Module from "./module.repository.js";
import Chapter from "./chapter.repository.js";
import Lesson from "./lesson.repository.js";
import LessonContent from "./lessonContent.repository.js";
import Question from "./question.repository.js";
import Answer from "./answer.repository.js";

// TODO(refactor): subscription moves to its module; call its service then.
const OWNER_MESSAGE = "You are not authorized to do this";

// --- Modules ---

export async function createModule({ courseId, data, user }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  assertOwnership({ ownerId: course.instructor_id, user, message: OWNER_MESSAGE });

  return Module.create({
    name: data.name,
    description: data.description,
    position: data.position,
    status: data.status,
    courseId,
  });
}

export async function getModule(moduleId) {
  const module = await Module.findById(moduleId);
  if (!module) throw new ApiError(StatusCode.NOT_FOUND, "Module not found");
  return module;
}

export async function updateModule(moduleId, data, user) {
  const module = await Module.findById(moduleId);
  if (!module) throw new ApiError(StatusCode.NOT_FOUND, "Module not found");

  const instructor = await Module.getInstructor(module.id);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  await Module.update({
    id: moduleId,
    name: data.name,
    description: data.description,
    position: data.position,
    status: data.status,
  });

  return module;
}

export async function deleteModule(moduleId, user) {
  const module = await Module.findById(moduleId);
  if (!module) throw new ApiError(StatusCode.NOT_FOUND, "Module not found");

  const instructor = await Module.getInstructor(module.id);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  await Module.delete(moduleId);
  return module;
}

// --- Chapters ---

export async function createChapter({ moduleId, data, user }) {
  const module = await Module.findById(moduleId);
  if (!module) throw new ApiError(StatusCode.NOT_FOUND, "Module not found");

  const instructor = await Module.getInstructor(module.id);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Chapter.create({
    moduleId,
    name: data.name,
    description: data.description,
    position: data.position,
    status: data.status,
  });
}

export async function getChapters(moduleId) {
  const module = await Module.findById(moduleId);
  if (!module) throw new ApiError(StatusCode.NOT_FOUND, "Module not found");

  return Chapter.find({ moduleId });
}

export async function getChapter(chapterId) {
  const chapter = await Chapter.findById(chapterId);
  if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");
  return chapter;
}

export async function updateChapter(chapterId, data, user) {
  const chapter = await Chapter.findById(chapterId);
  if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");

  const instructor = await Chapter.getInstructor(chapterId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Chapter.update({
    id: chapterId,
    name: data.name,
    description: data.description,
    position: data.position,
    status: data.status,
  });
}

export async function deleteChapter(chapterId, user) {
  const chapter = await Chapter.findById(chapterId);
  if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");

  const instructor = await Chapter.getInstructor(chapterId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  await Chapter.delete(chapterId);
}

// --- Lessons ---

export async function createLesson({ chapterId, data, user }) {
  const chapter = await Chapter.findById(chapterId);
  if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");

  const instructor = await Chapter.getInstructor(chapterId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Lesson.create({
    name: data.name,
    description: data.description,
    status: data.status,
    xpPoints: data.xpPoints,
    durationMinutes: data.durationMinutes,
    position: data.position,
    type: data.type,
    chapterId,
    accessType: data.accessType,
  });
}

export async function updateLesson(lessonId, data, user) {
  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  const instructor = await Lesson.getInstructor(lessonId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Lesson.update({
    lessonId,
    chapterId: lesson.chapter_id,
    name: data.name,
    description: data.description,
    status: data.status,
    xpPoints: data.xpPoints,
    durationMinutes: data.durationMinutes,
    position: data.position,
    type: data.type,
    accessType: data.accessType,
  });
}

export async function deleteLesson(lessonId, user) {
  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  const instructor = await Lesson.getInstructor(lessonId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  await Lesson.delete(lessonId);
}

export async function getFirstLesson(courseId) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const firstLesson = await Lesson.getFirstLesson(courseId);
  if (!firstLesson) {
    throw new ApiError(StatusCode.NOT_FOUND, "First lesson not found");
  }
  return firstLesson;
}

export async function getQuestions(lessonId) {
  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  const questions = await Lesson.getQuestions(lessonId);
  if (!questions) throw new ApiError(StatusCode.NOT_FOUND, "Questions not found");
  return questions;
}

// --- Lesson contents ---

export async function createLessonContent({ lessonId, data, user }) {
  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  const instructor = await Lesson.getInstructor(lessonId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return LessonContent.create({
    lessonId,
    name: data.name,
    position: data.position,
    content: data.content,
  });
}

export async function updateLessonContent(contentId, data, user) {
  const lessonContent = await LessonContent.findById(contentId);
  if (!lessonContent) {
    throw new ApiError(StatusCode.NOT_FOUND, "Lesson content not found");
  }

  const instructor = await LessonContent.getInstructor(contentId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return LessonContent.update({
    id: contentId,
    name: data.name,
    position: data.position,
    content: data.content,
  });
}

export async function deleteLessonContent(contentId, user) {
  const lessonContent = await LessonContent.findById(contentId);
  if (!lessonContent) {
    throw new ApiError(StatusCode.NOT_FOUND, "Lesson content not found");
  }

  const instructor = await LessonContent.getInstructor(contentId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return LessonContent.delete(contentId);
}

export async function getLessonContents(lessonId, userId) {
  if (!lessonId) throw new ApiError(StatusCode.BAD_REQUEST, "Lesson ID is required");

  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  if (lesson.access_type === "SUBSCRIPTION") {
    if (!userId) throw new ApiError(StatusCode.UNAUTHORIZED, "Unauthorized");

    const activePlan = await Subscription.getActivePaidSubscription(userId);
    if (!activePlan) {
      throw new ApiError(
        StatusCode.FORBIDDEN,
        "You don't have a paid subscription",
      );
    }
  }

  return LessonContent.findByLessonId(lessonId);
}

// --- Questions ---

export async function createQuestion({ lessonId, data, user }) {
  const lesson = await Lesson.findById(lessonId);
  if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

  const instructor = await Lesson.getInstructor(lessonId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Question.createQuestion({
    lessonId,
    question: data.question,
    explanation: data.explanation,
    position: data.position,
  });
}

export async function updateQuestion(questionId, data, user) {
  const quiz = await Question.findById(questionId);
  if (!quiz) throw new ApiError(StatusCode.NOT_FOUND, "Question not found");

  const instructor = await Question.getInstructor(questionId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Question.updateQuestion({
    questionId,
    question: data.question,
    explanation: data.explanation,
    position: data.position,
  });
}

export async function deleteQuestion(questionId, user) {
  const quiz = await Question.findById(questionId);
  if (!quiz) throw new ApiError(StatusCode.NOT_FOUND, "Question not found");

  const instructor = await Question.getInstructor(questionId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Question.deleteQuestion(questionId);
}

// --- Answers (options) ---

export async function createAnswer({ questionId, data, user }) {
  const question = await Question.findById(questionId);
  if (!question) throw new ApiError(StatusCode.NOT_FOUND, "Question not found");

  const instructor = await Question.getInstructor(questionId);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Answer.createAnswer({
    questionId,
    text: data.text,
    isCorrect: data.isCorrect,
    position: data.position,
  });
}

export async function updateAnswer(answerId, data, user) {
  const answer = await Answer.findById(answerId);
  if (!answer) throw new ApiError(StatusCode.NOT_FOUND, "Answer not found");

  const instructor = await Question.getInstructor(answer.quiz_id);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Answer.updateAnswer({
    answerId,
    text: data.text,
    isCorrect: data.isCorrect,
    position: data.position,
  });
}

export async function deleteAnswer(answerId, user) {
  const answer = await Answer.findById(answerId);
  if (!answer) throw new ApiError(StatusCode.NOT_FOUND, "Answer not found");

  const instructor = await Question.getInstructor(answer.quiz_id);
  assertOwnership({
    ownerId: instructor?.instructor_id,
    user,
    message: OWNER_MESSAGE,
  });

  return Answer.deleteAnswer(answerId);
}
