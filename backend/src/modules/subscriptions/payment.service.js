import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import paymentRepository from "./payment.repository.js";

class PaymentService {
  constructor({ paymentRepository }) {
    this.paymentRepository = paymentRepository;
  }

  async getPayments(query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [payments, total] = await Promise.all([
      this.paymentRepository.findAllPayments({ limit, offset }),
      this.paymentRepository.countPayments(),
    ]);

    return { payments, pagination: buildPagination({ total, page, limit }) };
  }

  async getMyPayments(userId, query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [payments, total] = await Promise.all([
      this.paymentRepository.findUserPayments({ userId, limit, offset }),
      this.paymentRepository.countUserPayments(userId),
    ]);

    return { payments, pagination: buildPagination({ total, page, limit }) };
  }

  async getMyPayment(userId, paymentId) {
    const payment = await this.paymentRepository.findUserPaymentById({
      userId,
      paymentId,
    });
    if (!payment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }
    return payment;
  }

  async createPayment({
    user_subscription_id,
    amount,
    payment_status,
    stripe_payment_intent_id,
  }) {
    if (!user_subscription_id || amount === undefined) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "user_subscription_id and amount are required",
      );
    }
    const payment = await this.paymentRepository.adminCreatePayment({
      userSubscriptionId: user_subscription_id,
      amount,
      paymentStatus: payment_status,
      stripePaymentIntentId: stripe_payment_intent_id,
    });

    logger.audit("payment.admin.create", {
      paymentId: payment?.id,
      amount,
    });
    return payment;
  }

  async updatePayment(paymentId, paymentData) {
    const existingPayment =
      await this.paymentRepository.findPaymentById(paymentId);
    if (!existingPayment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }

    const updatedPayment = await this.paymentRepository.updatePayment(
      paymentId,
      {
        amount:
          paymentData.amount !== undefined
            ? paymentData.amount
            : existingPayment.amount,
        paymentStatus:
          paymentData.payment_status || existingPayment.payment_status,
        stripePaymentIntentId:
          paymentData.stripe_payment_intent_id !== undefined
            ? paymentData.stripe_payment_intent_id
            : existingPayment.stripe_payment_intent_id,
      },
    );

    logger.audit("payment.admin.update", { paymentId });
    return updatedPayment;
  }

  async deletePayment(paymentId) {
    await this.paymentRepository.deletePayment(paymentId);
    logger.audit("payment.admin.delete", { paymentId });
  }
}

export { PaymentService };
export default new PaymentService({ paymentRepository });
