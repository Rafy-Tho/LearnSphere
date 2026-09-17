import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import planService from "./plan.service.js";

class PlanController {
  constructor({ planService }) {
    this.planService = planService;
  }

  getPlan = asyncHandler(async (req, res) => {
    const plan = await this.planService.getPlan(req.params.planId);

    return sendSuccess(res, plan, { message: "Plan retrieved successfully" });
  });

  getPlans = asyncHandler(async (req, res) => {
    const { plans, pagination } = await this.planService.getPlans(req.query);

    return sendSuccess(res, plans, {
      message: "Plans retrieved successfully",
      pagination,
    });
  });

  getActivePlans = asyncHandler(async (req, res) => {
    const plans = await this.planService.getActivePlans();

    return sendSuccess(res, plans, {
      message: "Plans retrieved successfully",
    });
  });

  createPlan = asyncHandler(async (req, res) => {
    const plan = await this.planService.createPlan(req.body);

    return sendSuccess(res, plan, {
      statusCode: StatusCode.CREATED,
      message: "Plan created successfully",
    });
  });

  updatePlan = asyncHandler(async (req, res) => {
    const plan = await this.planService.updatePlan(req.params.planId, req.body);

    return sendSuccess(res, plan, { message: "Plan updated successfully" });
  });

  deletePlan = asyncHandler(async (req, res) => {
    await this.planService.deletePlan(req.params.planId);

    return sendSuccess(res, null, { message: "Plan deleted successfully" });
  });
}

export { PlanController };
export default new PlanController({ planService });
