import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as contentService from "./service.js";

// --- Modules ---

export const createModule = asyncHandler(async (req, res) => {
  const module = await contentService.createModule({
    courseId: req.params.id,
    data: req.body,
    user: req.session.user,
  });

  return sendSuccess(res, module, {
    statusCode: StatusCode.CREATED,
    message: "Module created successfully",
  });
});

export const getModule = asyncHandler(async (req, res) => {
  const module = await contentService.getModule(req.params.id);

  return sendSuccess(res, module, { message: "Modules retrieved successfully" });
});

export const updateModule = asyncHandler(async (req, res) => {
  const module = await contentService.updateModule(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, module, { message: "Module updated successfully" });
});

export const deleteModule = asyncHandler(async (req, res) => {
  const module = await contentService.deleteModule(
    req.params.id,
    req.session.user,
  );

  return sendSuccess(res, module, { message: "Module deleted successfully" });
});

// --- Chapters ---

export const createChapter = asyncHandler(async (req, res) => {
  const chapter = await contentService.createChapter({
    moduleId: req.params.id,
    data: req.body,
    user: req.session.user,
  });

  return sendSuccess(res, chapter, {
    statusCode: StatusCode.CREATED,
    message: "Chapter created successfully",
  });
});

export const getChapters = asyncHandler(async (req, res) => {
  const chapters = await contentService.getChapters(req.params.id);

  return sendSuccess(res, chapters, {
    message: "Chapters retrieved successfully",
  });
});

export const getChapter = asyncHandler(async (req, res) => {
  const chapter = await contentService.getChapter(req.params.id);

  return sendSuccess(res, chapter, {
    message: "Chapter retrieved successfully",
  });
});

export const updateChapter = asyncHandler(async (req, res) => {
  const chapter = await contentService.updateChapter(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, chapter, { message: "Chapter updated successfully" });
});

export const deleteChapter = asyncHandler(async (req, res) => {
  await contentService.deleteChapter(req.params.id, req.session.user);

  return sendSuccess(res, null, { message: "Chapter deleted successfully" });
});

// --- Lessons ---

export const createLesson = asyncHandler(async (req, res) => {
  const lesson = await contentService.createLesson({
    chapterId: req.params.id,
    data: req.body,
    user: req.session.user,
  });

  return sendSuccess(res, lesson, {
    statusCode: StatusCode.CREATED,
    message: "Lesson created successfully",
  });
});

export const updateLesson = asyncHandler(async (req, res) => {
  const lesson = await contentService.updateLesson(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, lesson, { message: "Lesson updated successfully" });
});

export const deleteLesson = asyncHandler(async (req, res) => {
  await contentService.deleteLesson(req.params.id, req.session.user);

  return sendSuccess(res, null, { message: "Lesson deleted successfully" });
});

export const getFirstLesson = asyncHandler(async (req, res) => {
  const lesson = await contentService.getFirstLesson(req.params.id);

  return sendSuccess(res, lesson, {
    message: "First lesson retrieved successfully",
  });
});

export const getQuestions = asyncHandler(async (req, res) => {
  const questions = await contentService.getQuestions(req.params.id);

  return sendSuccess(res, questions, {
    message: "Questions retrieved successfully",
  });
});

// --- Lesson contents ---

export const createLessonContent = asyncHandler(async (req, res) => {
  const content = await contentService.createLessonContent({
    lessonId: req.params.id,
    data: req.body,
    user: req.session.user,
  });

  return sendSuccess(res, content, {
    statusCode: StatusCode.CREATED,
    message: "Lesson content created successfully",
  });
});

export const updateLessonContent = asyncHandler(async (req, res) => {
  const content = await contentService.updateLessonContent(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, content, {
    message: "Lesson content updated successfully",
  });
});

export const deleteLessonContent = asyncHandler(async (req, res) => {
  const content = await contentService.deleteLessonContent(
    req.params.id,
    req.session.user,
  );

  return sendSuccess(res, content, {
    message: "Lesson content delete successfully",
  });
});

export const getLessonContents = asyncHandler(async (req, res) => {
  const contents = await contentService.getLessonContents(
    req.params.id,
    req.session?.user?.id || null,
  );

  return sendSuccess(res, contents, {
    message: "Lesson contents fetched successfully",
  });
});

// --- Questions ---

export const createQuestion = asyncHandler(async (req, res) => {
  const question = await contentService.createQuestion({
    lessonId: req.params.id,
    data: req.body,
    user: req.session.user,
  });

  return sendSuccess(res, question, {
    statusCode: StatusCode.CREATED,
    message: "Question created successfully",
  });
});

export const updateQuestion = asyncHandler(async (req, res) => {
  const question = await contentService.updateQuestion(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, question, { message: "Question updated successfully" });
});

export const deleteQuestion = asyncHandler(async (req, res) => {
  const question = await contentService.deleteQuestion(
    req.params.id,
    req.session.user,
  );

  return sendSuccess(res, question, { message: "Question deleted successfully" });
});

// --- Answers (options) ---

export const createAnswer = asyncHandler(async (req, res) => {
  const answer = await contentService.createAnswer({
    questionId: req.params.id,
    data: req.body,
    user: req.session.user,
  });

  return sendSuccess(res, answer, {
    statusCode: StatusCode.CREATED,
    message: "Answer created successfully",
  });
});

export const updateAnswer = asyncHandler(async (req, res) => {
  const answer = await contentService.updateAnswer(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, answer, { message: "Answer updated successfully" });
});

export const deleteAnswer = asyncHandler(async (req, res) => {
  const answer = await contentService.deleteAnswer(
    req.params.id,
    req.session.user,
  );

  return sendSuccess(res, answer, { message: "Answer deleted successfully" });
});
