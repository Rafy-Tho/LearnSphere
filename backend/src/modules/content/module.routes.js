import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import moduleController from "./module.controller.js";
import { moduleIdParamValidator, moduleValidators } from "./validation.js";

// Mounted at /api/v1/courses/:courseId/modules
export const moduleCollectionRoute = express.Router({ mergeParams: true });

moduleCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  moduleValidators,
  validateResult,
  moduleController.createModule,
);

// Mounted at /api/v1/modules
export const moduleItemRoute = express.Router();

moduleItemRoute.get("/:moduleId", moduleController.getModule);
moduleItemRoute.patch(
  "/:moduleId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  moduleValidators,
  validateResult,
  moduleController.updateModule,
);
moduleItemRoute.delete(
  "/:moduleId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  moduleIdParamValidator,
  validateResult,
  moduleController.deleteModule,
);
