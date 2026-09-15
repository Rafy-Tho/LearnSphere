import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import optionController from "./option.controller.js";
import { optionIdParamValidator, optionValidator } from "./validation.js";

// Mounted at /api/v1/questions/:questionId/options
export const optionCollectionRoute = express.Router({ mergeParams: true });

optionCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  optionValidator,
  validateResult,
  optionController.createOption,
);

// Mounted at /api/v1/options
export const optionItemRoute = express.Router();

optionItemRoute.patch(
  "/:optionId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  optionValidator,
  validateResult,
  optionController.updateOption,
);
optionItemRoute.delete(
  "/:optionId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  optionIdParamValidator,
  validateResult,
  optionController.deleteOption,
);
