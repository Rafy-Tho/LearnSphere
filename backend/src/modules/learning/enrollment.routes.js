import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import * as controller from "./controller.js";

const enrollmentRoute = express.Router({ mergeParams: true });

enrollmentRoute
  .route("/")
  .post(requireAuth, controller.enrollCourse)
  .get(requireAuth, controller.getEnrollment);

export default enrollmentRoute;
