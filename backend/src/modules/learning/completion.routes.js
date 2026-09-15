import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import * as controller from "./controller.js";

const completionRoute = express.Router({ mergeParams: true });

completionRoute
  .route("/")
  .post(requireAuth, controller.createLessonCompletion)
  .get(requireAuth, controller.getLessonCompletion);

export default completionRoute;
