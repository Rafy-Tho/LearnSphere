import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
// TODO(refactor): nested routers move into their own modules.
import certificateRoute from "../certificates/routes.js";
import enrollmentRoute from "../learning/enrollment.routes.js";
import progressRoute from "../learning/progress.routes.js";
import lessonRoute from "../content/lesson.routes.js";
import moduleRoute from "../content/module.routes.js";
import reviewsRoute from "../reviews/routes.js";
import { getCourseLessonCompletions } from "../learning/controller.js";
import objectivesRoute from "./objectives.routes.js";
import * as controller from "./controller.js";
import { courseValidator } from "./validation.js";

const coursesRoute = express.Router();

// Nested resources
coursesRoute.use("/:id/modules", moduleRoute);
coursesRoute.use("/:id/objectives", objectivesRoute);
coursesRoute.use("/:id/lessons", lessonRoute);
coursesRoute.use("/:id/reviews", reviewsRoute);
coursesRoute.use("/:id/enrollments", enrollmentRoute);
coursesRoute.use("/:id/progresses", progressRoute);
coursesRoute.use("/:id/certificates", certificateRoute);

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

coursesRoute.get("/recently-viewed", requireAuth, controller.getRecentlyViewedCourses);
coursesRoute.get("/recommended", requireAuth, controller.getRecommendedCourses);
coursesRoute.get("/popular", controller.getPopularCourses);
coursesRoute.get("/in-progress", requireAuth, controller.getCourseInprogress);
coursesRoute.get("/completed", requireAuth, controller.getCourseCompleted);
coursesRoute.get(
  "/dashboard",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  controller.getCoursesDashboard,
);
coursesRoute.get(
  "/:id/dashboard-details",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  controller.getCourseDetailsDashboard,
);

coursesRoute
  .route("/:id")
  .get(controller.getCourseDetails)
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseValidator,
    validateResult,
    controller.updateCourse,
  )
  .delete(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.deleteCourse);

coursesRoute.get("/:id/learn", controller.getCourseLearningData);
coursesRoute.get(
  "/:id/lesson-completions",
  requireAuth,
  getCourseLessonCompletions,
);

export default coursesRoute;
