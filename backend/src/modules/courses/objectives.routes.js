import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { courseObjectiveValidator } from "./validation.js";

const objectivesRoute = express.Router({ mergeParams: true });

objectivesRoute
  .route("/")
  .get(controller.getCourseObjectives)
  .post(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseObjectiveValidator,
    validateResult,
    controller.createCourseObjective,
  );

objectivesRoute
  .route("/:id")
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    courseObjectiveValidator,
    validateResult,
    controller.updateCourseObjective,
  )
  .delete(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.deleteCourseObjective);

export default objectivesRoute;
