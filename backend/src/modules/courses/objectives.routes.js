import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import courseObjectiveController from "./objective.controller.js";
import {
  courseObjectiveIdParamValidator,
  courseObjectiveValidator,
} from "./validation.js";

// Mounted at /api/v1/courses/:courseId/objectives
export const objectivesCollectionRoute = express.Router({ mergeParams: true });

objectivesCollectionRoute.get(
  "/",
  courseObjectiveController.getCourseObjectives,
);
objectivesCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseObjectiveValidator,
  validateResult,
  courseObjectiveController.createCourseObjective,
);

// Mounted at /api/v1/objectives
export const objectivesItemRoute = express.Router();

objectivesItemRoute.patch(
  "/:objectiveId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseObjectiveValidator,
  validateResult,
  courseObjectiveController.updateCourseObjective,
);
objectivesItemRoute.delete(
  "/:objectiveId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseObjectiveIdParamValidator,
  validateResult,
  courseObjectiveController.deleteCourseObjective,
);
