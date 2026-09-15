import express from "express";
import { validateResult } from "../../common/middleware/validate-result.js";
import planController from "./plan.controller.js";
import { planIdParamValidator } from "./validation.js";

const plansRoute = express.Router();

plansRoute.get(
  "/:planId",
  planIdParamValidator,
  validateResult,
  planController.getPlan,
);

export default plansRoute;
