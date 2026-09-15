import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import {
  courseObjectiveIdParamValidator,
  courseObjectiveValidator,
} from "./validation.js";

// Mounted at /api/v1/courses/:courseId/objectives
export const objectivesCollectionRoute = express.Router({ mergeParams: true });

objectivesCollectionRoute.get("/", controller.getCourseObjectives);
objectivesCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseObjectiveValidator,
  validateResult,
  controller.createCourseObjective,
);

// Mounted at /api/v1/objectives
export const objectivesItemRoute = express.Router();

objectivesItemRoute.patch(
  "/:objectiveId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseObjectiveValidator,
  validateResult,
  controller.updateCourseObjective,
);
objectivesItemRoute.delete(
  "/:objectiveId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseObjectiveIdParamValidator,
  validateResult,
  controller.deleteCourseObjective,
);
