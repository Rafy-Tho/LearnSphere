import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import refundRequestService from "./refund-request.service.js";

class RefundRequestController {
  constructor({ refundRequestService }) {
    this.refundRequestService = refundRequestService;
  }

  createRefundRequest = asyncHandler(async (req, res) => {
    const request = await this.refundRequestService.createRequest({
      userId: req.session.user.id,
      paymentId: req.params.paymentId,
      requestedAmount: req.body?.requested_amount,
      reason: req.body?.reason,
      userNote: req.body?.user_note,
    });

    return sendSuccess(res, request, {
      statusCode: StatusCode.CREATED,
      message: "Refund request submitted successfully",
    });
  });

  getPaymentRefundRequests = asyncHandler(async (req, res) => {
    const requests = await this.refundRequestService.getPaymentRequests(
      req.session.user.id,
      req.params.paymentId,
    );

    return sendSuccess(res, requests, {
      message: "Refund requests retrieved successfully",
    });
  });

  getMyRefundRequests = asyncHandler(async (req, res) => {
    const { requests, pagination } =
      await this.refundRequestService.getMyRequests(
        req.session.user.id,
        req.query,
      );

    return sendSuccess(res, requests, {
      message: "Refund requests retrieved successfully",
      pagination,
    });
  });

  getMyRefundRequest = asyncHandler(async (req, res) => {
    const request = await this.refundRequestService.getMyRequest(
      req.session.user.id,
      req.params.requestId,
    );

    return sendSuccess(res, request, {
      message: "Refund request retrieved successfully",
    });
  });

  // --- Admin review -------------------------------------------------------

  getRefundRequests = asyncHandler(async (req, res) => {
    const { requests, pagination } =
      await this.refundRequestService.getAdminRequests(req.query);

    return sendSuccess(res, requests, {
      message: "Refund requests retrieved successfully",
      pagination,
    });
  });

  getRefundRequest = asyncHandler(async (req, res) => {
    const request = await this.refundRequestService.getAdminRequest(
      req.params.requestId,
    );

    return sendSuccess(res, request, {
      message: "Refund request retrieved successfully",
    });
  });

  approveRefundRequest = asyncHandler(async (req, res) => {
    const request = await this.refundRequestService.approveRequest({
      requestId: req.params.requestId,
      adminId: req.session.user.id,
      note: req.body?.note,
    });

    return sendSuccess(res, request, {
      message: "Refund request approved successfully",
    });
  });

  rejectRefundRequest = asyncHandler(async (req, res) => {
    const request = await this.refundRequestService.rejectRequest({
      requestId: req.params.requestId,
      adminId: req.session.user.id,
      reason: req.body?.reason,
    });

    return sendSuccess(res, request, {
      message: "Refund request rejected successfully",
    });
  });
}

export { RefundRequestController };
export default new RefundRequestController({ refundRequestService });
