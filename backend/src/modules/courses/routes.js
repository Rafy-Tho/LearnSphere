import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import lessonController from "../content/lesson.controller.js";
import completionController from "../learning/completion.controller.js";
import enrollmentRoute from "../learning/enrollment.routes.js";
import progressRoute from "../learning/progress.routes.js";
import { courseCertificateRoute } from "../certificates/routes.js";
import { reviewsCollectionRoute } from "../reviews/routes.js";
import { savedCourseRoute } from "../saved-courses/routes.js";
import courseController from "./course.controller.js";
import { objectivesCollectionRoute } from "./objectives.routes.js";
import { courseIdParamValidator, courseValidator } from "./validation.js";

const coursesRoute = express.Router();

// Nested collections (max 1 level)
coursesRoute.use("/:courseId/objectives", objectivesCollectionRoute);
coursesRoute.use("/:courseId/reviews", reviewsCollectionRoute);
coursesRoute.use("/:courseId/enrollments", enrollmentRoute);
coursesRoute.use("/:courseId/progress", progressRoute);
coursesRoute.use("/:courseId/certificates", courseCertificateRoute);
coursesRoute.use("/:courseId/saved", savedCourseRoute);

// Courses
coursesRoute
  .route("/")
  .get(courseController.listCourses)
  .post(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseValidator,
    validateResult,
    courseController.createCourse,
  );

coursesRoute.get("/popular", courseController.getPopularCourses);

coursesRoute
  .route("/:courseId")
  .get(courseController.getCourseDetails)
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseValidator,
    validateResult,
    courseController.updateCourse,
  )
  .delete(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseIdParamValidator,
    validateResult,
    courseController.deleteCourse,
  );

coursesRoute.get(
  "/:courseId/curriculum",
  courseController.getCourseLearningData,
);
coursesRoute.get("/:courseId/first-lesson", lessonController.getFirstLesson);
coursesRoute.get(
  "/:courseId/completions",
  requireAuth,
  completionController.getCourseLessonCompletions,
);

export default coursesRoute;
