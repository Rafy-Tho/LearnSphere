import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import paymentService from "./payment.service.js";

class PaymentController {
  constructor({ paymentService }) {
    this.paymentService = paymentService;
  }

  getPayments = asyncHandler(async (req, res) => {
    const { payments, pagination } = await this.paymentService.getPayments(
      req.query,
    );

    return sendSuccess(res, payments, {
      message: "Payments retrieved successfully",
      pagination,
    });
  });

  getPayment = asyncHandler(async (req, res) => {
    const payment = await this.paymentService.getPayment(req.params.paymentId);

    return sendSuccess(res, payment, {
      message: "Payment retrieved successfully",
    });
  });

  getMyPayments = asyncHandler(async (req, res) => {
    const { payments, pagination } = await this.paymentService.getMyPayments(
      req.session.user.id,
      req.query,
    );

    return sendSuccess(res, payments, {
      message: "Payments retrieved successfully",
      pagination,
    });
  });

  getMyPayment = asyncHandler(async (req, res) => {
    const payment = await this.paymentService.getMyPayment(
      req.session.user.id,
      req.params.paymentId,
    );

    return sendSuccess(res, payment, {
      message: "Payment retrieved successfully",
    });
  });
}

export { PaymentController };
export default new PaymentController({ paymentService });
