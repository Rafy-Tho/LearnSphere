import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as learningService from "./service.js";

// --- Enrollments ---

export const enrollCourse = asyncHandler(async (req, res) => {
  const enrollment = await learningService.enrollCourse({
    courseId: req.params.courseId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, enrollment, {
    message: "Course enrolled successfully",
  });
});

export const getEnrollment = asyncHandler(async (req, res) => {
  const enrollment = await learningService.getEnrollment({
    courseId: req.params.courseId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, enrollment || null, {
    message: "Enrollment retrieved successfully",
  });
});

// --- Learning progress ---

export const createLearningProgress = asyncHandler(async (req, res) => {
  const progress = await learningService.createProgress({
    courseId: req.params.courseId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, progress, {
    statusCode: StatusCode.CREATED,
    message: "Learning progress created successfully",
  });
});

export const updateLearningProgress = asyncHandler(async (req, res) => {
  const { created, progress } = await learningService.updateProgress({
    courseId: req.params.courseId,
    userId: req.session.user.id,
    lessonId: req.body.lessonId,
  });

  return sendSuccess(res, progress, {
    statusCode: StatusCode.OK,
    message: created
      ? "Learning progress created successfully"
      : "Learning progress updated successfully",
  });
});

export const getLearningProgress = asyncHandler(async (req, res) => {
  const progress = await learningService.getProgress({
    courseId: req.params.courseId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, progress || null, {
    message: "Learning progress retrieved successfully",
  });
});

// --- Lesson completions ---

export const createLessonCompletion = asyncHandler(async (req, res) => {
  const completion = await learningService.createCompletion({
    lessonId: req.params.lessonId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, completion, {
    statusCode: StatusCode.CREATED,
    message: "Lesson completion created successfully",
  });
});

export const getCourseLessonCompletions = asyncHandler(async (req, res) => {
  const completions = await learningService.getCourseCompletions({
    courseId: req.params.courseId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, completions, {
    message: "Course lesson completions fetched successfully",
  });
});

export const getLessonCompletion = asyncHandler(async (req, res) => {
  const completion = await learningService.getCompletion({
    lessonId: req.params.lessonId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, completion || null, {
    message: "Lesson completion fetched successfully",
  });
});
