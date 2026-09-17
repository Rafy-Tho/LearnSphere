import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import xpService from "./xp.service.js";

class XpController {
  constructor({ xpService }) {
    this.xpService = xpService;
  }

  getSummary = asyncHandler(async (req, res) => {
    const summary = await this.xpService.getSummary(req.session.user.id);

    return sendSuccess(res, summary, {
      message: "XP summary retrieved successfully",
    });
  });

  getTransactions = asyncHandler(async (req, res) => {
    const { transactions, pagination } = await this.xpService.getTransactions(
      req.session.user.id,
      req.query,
    );

    return sendSuccess(res, transactions, {
      message: "XP transactions retrieved successfully",
      pagination,
    });
  });
}

export { XpController };
export default new XpController({ xpService });
