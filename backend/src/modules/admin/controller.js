import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as adminService from "./service.js";

export const getDashboardData = asyncHandler(async (req, res) => {
  const data = await adminService.getDashboardData(req.session.user.id);

  return sendSuccess(res, data, {
    message: "Dashboard data retrieved successfully",
  });
});
