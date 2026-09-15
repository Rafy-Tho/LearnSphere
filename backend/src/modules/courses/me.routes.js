import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import * as controller from "./controller.js";

// Mounted at /api/v1/users/me/courses
const meCoursesRoute = express.Router();

meCoursesRoute.get(
  "/recently-viewed",
  requireAuth,
  controller.getRecentlyViewedCourses,
);
meCoursesRoute.get("/recommended", requireAuth, controller.getRecommendedCourses);
meCoursesRoute.get("/in-progress", requireAuth, controller.getCourseInprogress);
meCoursesRoute.get("/completed", requireAuth, controller.getCourseCompleted);

export default meCoursesRoute;
