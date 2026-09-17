import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import billingStatsService from "./billing-stats.service.js";

class BillingStatsController {
  constructor({ billingStatsService }) {
    this.billingStatsService = billingStatsService;
  }

  getStats = asyncHandler(async (req, res) => {
    const stats = await this.billingStatsService.getStats();

    return sendSuccess(res, stats, {
      message: "Billing statistics retrieved successfully",
    });
  });
}

export { BillingStatsController };
export default new BillingStatsController({ billingStatsService });
