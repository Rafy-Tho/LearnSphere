import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import refundService from "./refund.service.js";

class RefundController {
  constructor({ refundService }) {
    this.refundService = refundService;
  }

  getAllRefunds = asyncHandler(async (req, res) => {
    const { refunds, pagination } = await this.refundService.getAllRefunds(
      req.query,
    );

    return sendSuccess(res, refunds, {
      message: "Refunds retrieved successfully",
      pagination,
    });
  });

  getPaymentRefunds = asyncHandler(async (req, res) => {
    const result = await this.refundService.getRefunds(req.params.paymentId);

    return sendSuccess(res, result, {
      message: "Refunds retrieved successfully",
    });
  });

  createPaymentRefund = asyncHandler(async (req, res) => {
    const result = await this.refundService.createRefund({
      paymentId: req.params.paymentId,
      amount: req.body?.amount,
      reason: req.body?.reason,
      adminId: req.session.user.id,
      refundRequestId: req.body?.refund_request_id || null,
      idempotencyKey: req.body?.idempotency_key || null,
    });

    return sendSuccess(res, result, {
      statusCode: StatusCode.CREATED,
      message: "Refund submitted to Stripe successfully",
    });
  });
}

export { RefundController };
export default new RefundController({ refundService });
