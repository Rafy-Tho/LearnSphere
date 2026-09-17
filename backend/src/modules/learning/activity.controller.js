import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import activityService from "./activity.service.js";

class ActivityController {
  constructor({ activityService }) {
    this.activityService = activityService;
  }

  getMyActivities = asyncHandler(async (req, res) => {
    const { activities, pagination } = await this.activityService.getMyActivities(
      req.session.user.id,
      req.query,
    );

    return sendSuccess(res, activities, {
      message: "Activities retrieved successfully",
      pagination,
    });
  });
}

export { ActivityController };
export default new ActivityController({ activityService });
