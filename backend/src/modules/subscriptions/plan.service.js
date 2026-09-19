import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
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

  async createPlan(
    {
      name,
      description,
      duration_days,
      price,
      currency,
      features,
      is_active,
    },
    adminId = null,
  ) {
    if (!name || !duration_days || price === undefined) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Name, duration_days, and price are required",
      );
    }
    if (Number(duration_days) <= 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "duration_days must be greater than 0",
      );
    }
    if (Number(price) < 0) {
      throw new ApiError(StatusCode.BAD_REQUEST, "price must be at least 0");
    }
    const plan = await this.planRepository.create({
      name,
      description,
      durationDays: duration_days,
      price,
      currency,
      features,
      isActive: is_active,
    });

    logger.audit("plan.create", {
      adminId,
      planId: plan.id,
      name: plan.name,
      price: Number(plan.price),
      durationDays: plan.duration_days,
    });

    return plan;
  }

  async updatePlan(
    planId,
    { name, description, duration_days, price, currency, is_active, features },
    adminId = null,
  ) {
    const existingPlan = await this.planRepository.findById(planId);
    if (!existingPlan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    if (duration_days !== undefined && Number(duration_days) <= 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "duration_days must be greater than 0",
      );
    }
    if (price !== undefined && Number(price) < 0) {
      throw new ApiError(StatusCode.BAD_REQUEST, "price must be at least 0");
    }

    const plan = await this.planRepository.update(planId, {
      name: name || existingPlan.name,
      description:
        description !== undefined ? description : existingPlan.description,
      durationDays: duration_days || existingPlan.duration_days,
      price: price !== undefined ? price : existingPlan.price,
      currency: currency || existingPlan.currency,
      isActive:
        is_active !== undefined ? is_active : existingPlan.is_active,
      features:
        features !== undefined ? features : existingPlan.features || [],
    });

    logger.audit("plan.update", {
      adminId,
      planId,
      name: plan.name,
      price: Number(plan.price),
      durationDays: plan.duration_days,
    });

    return plan;
  }

  async setPlanStatus(planId, isActive, adminId = null) {
    const existingPlan = await this.planRepository.findById(planId);
    if (!existingPlan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    const plan = await this.planRepository.setActive(planId, isActive);

    logger.audit(isActive ? "plan.activate" : "plan.deactivate", {
      adminId,
      planId,
    });

    return plan;
  }

  async deletePlan(planId, adminId = null) {
    const existingPlan = await this.planRepository.findById(planId);
    if (!existingPlan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    // Preserve billing history: a plan referenced by any subscription or
    // checkout order is deactivated, never hard-deleted.
    const references = await this.planRepository.countReferences(planId);
    if (references > 0) {
      const plan = await this.planRepository.setActive(planId, false);
      logger.audit("plan.deactivate", {
        adminId,
        planId,
        reason: "referenced-by-history",
      });
      return plan;
    }

    await this.planRepository.delete(planId);
    logger.audit("plan.delete", { adminId, planId });
    return null;
  }
}

export { PlanService };
export default new PlanService({ planRepository });
