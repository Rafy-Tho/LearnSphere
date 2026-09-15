import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import { getFirstLesson } from "../content/controller.js";
import { getCourseLessonCompletions } from "../learning/controller.js";
import enrollmentRoute from "../learning/enrollment.routes.js";
import progressRoute from "../learning/progress.routes.js";
import { courseCertificateRoute } from "../certificates/routes.js";
import { reviewsCollectionRoute } from "../reviews/routes.js";
import * as controller from "./controller.js";
import { objectivesCollectionRoute } from "./objectives.routes.js";
import { courseIdParamValidator, courseValidator } from "./validation.js";

const coursesRoute = express.Router();

// Nested collections (max 1 level)
coursesRoute.use("/:courseId/objectives", objectivesCollectionRoute);
coursesRoute.use("/:courseId/reviews", reviewsCollectionRoute);
coursesRoute.use("/:courseId/enrollments", enrollmentRoute);
coursesRoute.use("/:courseId/progress", progressRoute);
coursesRoute.use("/:courseId/certificates", courseCertificateRoute);

// Courses
coursesRoute
  .route("/")
  .get(controller.getAllCourses)
  .post(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseValidator,
    validateResult,
    controller.createCourse,
  );

coursesRoute.get("/popular", controller.getPopularCourses);

coursesRoute
  .route("/:courseId")
  .get(controller.getCourseDetails)
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseValidator,
    validateResult,
    controller.updateCourse,
  )
  .delete(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseIdParamValidator,
    validateResult,
    controller.deleteCourse,
  );

coursesRoute.get("/:courseId/curriculum", controller.getCourseLearningData);
coursesRoute.get("/:courseId/first-lesson", getFirstLesson);
coursesRoute.get(
  "/:courseId/completions",
  requireAuth,
  getCourseLessonCompletions,
);

export default coursesRoute;
