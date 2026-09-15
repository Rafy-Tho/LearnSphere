import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import adminService from "./admin.service.js";

class AdminController {
  constructor({ adminService }) {
    this.adminService = adminService;
  }

  getDashboardData = asyncHandler(async (req, res) => {
    const dashboard = await this.adminService.getDashboardData(
      req.session.user.id,
    );

    return sendSuccess(res, dashboard, {
      message: "Dashboard data retrieved successfully",
    });
  });
}

export { AdminController };
export default new AdminController({ adminService });
