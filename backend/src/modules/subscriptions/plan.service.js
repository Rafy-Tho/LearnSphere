import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import subscriptionRepository from "./subscription.repository.js";

class PlanService {
  constructor({ subscriptionRepository }) {
    this.subscriptionRepository = subscriptionRepository;
  }

  async getPlan(planId) {
    const plan = await this.subscriptionRepository.findById(planId);
    if (!plan) {
      throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");
    }
    return plan;
  }

  async getPlans(query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [plans, total] = await Promise.all([
      this.subscriptionRepository.findAllPlans({ limit, offset }),
      this.subscriptionRepository.countPlans(),
    ]);

    return { plans, pagination: buildPagination({ total, page, limit }) };
  }

  async createPlan({ name, duration_days, price }) {
    if (!name || !duration_days || price === undefined) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Name, duration_days, and price are required",
      );
    }
    return this.subscriptionRepository.createPlan({
      name,
      durationDays: duration_days,
      price,
    });
  }

  async updatePlan(planId, { name, duration_days, price }) {
    const existingPlan = await this.subscriptionRepository.findById(planId);
    if (!existingPlan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    return this.subscriptionRepository.updatePlan(planId, {
      name: name || existingPlan.name,
      durationDays: duration_days || existingPlan.duration_days,
      price: price !== undefined ? price : existingPlan.price,
    });
  }

  async deletePlan(planId) {
    const existingPlan = await this.subscriptionRepository.findById(planId);
    if (!existingPlan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    await this.subscriptionRepository.deletePlan(planId);
  }
}

export { PlanService };
export default new PlanService({ subscriptionRepository });
