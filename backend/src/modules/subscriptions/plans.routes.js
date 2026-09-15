import express from "express";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { planIdParamValidator } from "./validation.js";

const plansRoute = express.Router();

plansRoute.get(
  "/:planId",
  planIdParamValidator,
  validateResult,
  controller.getPlan,
);

export default plansRoute;
