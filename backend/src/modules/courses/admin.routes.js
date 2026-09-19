import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import {
  chapterIdParamValidator,
  lessonIdParamValidator,
  moduleIdParamValidator,
} from "../content/validation.js";
import courseController from "./course.controller.js";
import {
  adminCourseListQueryValidator,
  courseIdParamValidator,
  courseRejectValidator,
} from "./validation.js";

// Mounted at /api/v1/admin/courses
const adminCoursesRoute = express.Router();

adminCoursesRoute.get(
  "/",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  adminCourseListQueryValidator,
  courseController.getCoursesDashboard,
);

// Review workflow (admin only). The queue itself is served by the list
// endpoint: GET /admin/courses?status=PENDING. Reject requires a reason.
adminCoursesRoute.post(
  "/:courseId/approve",
  requireAuth,
  authorize(ADMIN),
  courseIdParamValidator,
  validateResult,
  courseController.approveCourse,
);
adminCoursesRoute.post(
  "/:courseId/reject",
  requireAuth,
  authorize(ADMIN),
  courseIdParamValidator,
  courseRejectValidator,
  validateResult,
  courseController.rejectCourse,
);

// Lightweight summary: course + objectives + modules with counts.
adminCoursesRoute.get(
  "/:courseId/summary",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  courseIdParamValidator,
  validateResult,
  courseController.getCourseSummary,
);

// Lazy branch reads, loaded on demand as the admin expands the tree.
adminCoursesRoute.get(
  "/:courseId/modules/:moduleId/chapters",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  courseIdParamValidator,
  moduleIdParamValidator,
  validateResult,
  courseController.getModuleChapters,
);
adminCoursesRoute.get(
  "/:courseId/chapters/:chapterId/lessons",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  courseIdParamValidator,
  chapterIdParamValidator,
  validateResult,
  courseController.getChapterLessons,
);
adminCoursesRoute.get(
  "/:courseId/lessons/:lessonId/contents",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  courseIdParamValidator,
  lessonIdParamValidator,
  validateResult,
  courseController.getLessonContents,
);
adminCoursesRoute.get(
  "/:courseId/lessons/:lessonId/questions",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  courseIdParamValidator,
  lessonIdParamValidator,
  validateResult,
  courseController.getLessonQuestions,
);

export default adminCoursesRoute;
