import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import planRepository from "./plan.repository.js";

class PlanService {
  constructor({ planRepository }) {
    this.planRepository = planRepository;
  }

  async getPlan(planId) {
    const plan = await this.planRepository.findById(planId);
    if (!plan) {
      throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");
    }
    return plan;
  }

  async getActivePlans() {
    return this.planRepository.findAll({ activeOnly: true });
  }

  async getPlans(query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [plans, total] = await Promise.all([
      this.planRepository.findAll({ limit, offset }),
      this.planRepository.count(),
    ]);

    return { plans, pagination: buildPagination({ total, page, limit }) };
  }

  async createPlan({ name, description, duration_days, price, currency }) {
    if (!name || !duration_days || price === undefined) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Name, duration_days, and price are required",
      );
    }
    return this.planRepository.create({
      name,
      description,
      durationDays: duration_days,
      price,
      currency,
    });
  }

  async updatePlan(
    planId,
    { name, description, duration_days, price, currency, is_active },
  ) {
    const existingPlan = await this.planRepository.findById(planId);
    if (!existingPlan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    return this.planRepository.update(planId, {
      name: name || existingPlan.name,
      description:
        description !== undefined ? description : existingPlan.description,
      durationDays: duration_days || existingPlan.duration_days,
      price: price !== undefined ? price : existingPlan.price,
      currency: currency || existingPlan.currency,
      isActive:
        is_active !== undefined ? is_active : existingPlan.is_active,
    });
  }

  async deletePlan(planId) {
    const existingPlan = await this.planRepository.findById(planId);
    if (!existingPlan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    // Preserve billing history: deactivate a plan that has subscriptions.
    const references = await this.planRepository.countReferences(planId);
    if (references > 0) {
      return this.planRepository.setActive(planId, false);
    }

    await this.planRepository.delete(planId);
    return null;
  }
}

export { PlanService };
export default new PlanService({ planRepository });
