import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import instructorService from "./instructor.service.js";

class InstructorController {
  constructor({ instructorService }) {
    this.instructorService = instructorService;
  }

  getDashboard = asyncHandler(async (req, res) => {
    const dashboard = await this.instructorService.getDashboard(
      req.session.user,
    );

    return sendSuccess(res, dashboard, {
      message: "Instructor dashboard retrieved successfully",
    });
  });

  getStudents = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.instructorService.getStudents(
      req.params.courseId,
      req.session.user,
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Students retrieved successfully",
      pagination,
    });
  });

  getAnalytics = asyncHandler(async (req, res) => {
    const analytics = await this.instructorService.getAnalytics(
      req.params.courseId,
      req.session.user,
    );

    return sendSuccess(res, analytics, {
      message: "Course analytics retrieved successfully",
    });
  });

  getReviews = asyncHandler(async (req, res) => {
    const { reviews, summary, pagination } =
      await this.instructorService.getReviews(
        req.params.courseId,
        req.session.user,
        req.query,
      );

    return sendSuccess(res, { reviews, summary }, {
      message: "Reviews retrieved successfully",
      pagination,
    });
  });

  getCertificates = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.instructorService.getCertificates(
      req.params.courseId,
      req.session.user,
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Certificates retrieved successfully",
      pagination,
    });
  });

  getEarnings = asyncHandler(async (req, res) => {
    const earnings = await this.instructorService.getEarnings(req.session.user);

    return sendSuccess(res, earnings, {
      message: "Earnings retrieved successfully",
    });
  });

  getPayouts = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.instructorService.getPayouts(
      req.session.user,
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Payouts retrieved successfully",
      pagination,
    });
  });

  getRevenueSettings = asyncHandler(async (req, res) => {
    const settings = await this.instructorService.getRevenueSettings();

    return sendSuccess(res, settings, {
      message: "Settings retrieved successfully",
    });
  });

  updateRevenueSettings = asyncHandler(async (req, res) => {
    const settings = await this.instructorService.updateRevenueSettings(
      req.body.revenueSharePercent,
    );

    return sendSuccess(res, settings, {
      message: "Settings updated successfully",
    });
  });

  listPayouts = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.instructorService.listPayouts(
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Payouts retrieved successfully",
      pagination,
    });
  });

  createPayout = asyncHandler(async (req, res) => {
    const payout = await this.instructorService.createPayout(
      req.body,
      req.session.user,
    );

    return sendSuccess(res, payout, {
      statusCode: StatusCode.CREATED,
      message: "Payout recorded successfully",
    });
  });

  updatePayout = asyncHandler(async (req, res) => {
    const payout = await this.instructorService.updatePayout(
      req.params.payoutId,
      req.body,
    );

    return sendSuccess(res, payout, {
      message: "Payout updated successfully",
    });
  });
}

export { InstructorController };
export default new InstructorController({ instructorService });
