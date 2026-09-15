import StatusCode from "../../common/constants/status-code.js";
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

  createPayment = asyncHandler(async (req, res) => {
    const payment = await this.paymentService.createPayment(req.body);

    return sendSuccess(res, payment, {
      statusCode: StatusCode.CREATED,
      message: "Payment created successfully",
    });
  });

  updatePayment = asyncHandler(async (req, res) => {
    const payment = await this.paymentService.updatePayment(
      req.params.paymentId,
      req.body,
    );

    return sendSuccess(res, payment, { message: "Payment updated successfully" });
  });

  deletePayment = asyncHandler(async (req, res) => {
    await this.paymentService.deletePayment(req.params.paymentId);

    return sendSuccess(res, null, { message: "Payment deleted successfully" });
  });
}

export { PaymentController };
export default new PaymentController({ paymentService });
