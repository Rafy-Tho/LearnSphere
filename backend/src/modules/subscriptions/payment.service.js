import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import subscriptionRepository from "./subscription.repository.js";

class PaymentService {
  constructor({ subscriptionRepository }) {
    this.subscriptionRepository = subscriptionRepository;
  }

  async getPayments(query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [payments, total] = await Promise.all([
      this.subscriptionRepository.findAllPayments({ limit, offset }),
      this.subscriptionRepository.countPayments(),
    ]);

    return { payments, pagination: buildPagination({ total, page, limit }) };
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
    return this.subscriptionRepository.adminCreatePayment({
      userSubscriptionId: user_subscription_id,
      amount,
      paymentStatus: payment_status,
      stripePaymentIntentId: stripe_payment_intent_id,
    });
  }

  async updatePayment(paymentId, paymentData) {
    const existingPayment =
      await this.subscriptionRepository.findPaymentById(paymentId);
    if (!existingPayment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }

    return this.subscriptionRepository.updatePayment(paymentId, {
      amount:
        paymentData.amount !== undefined
          ? paymentData.amount
          : existingPayment.amount,
      paymentStatus: paymentData.payment_status || existingPayment.payment_status,
      stripePaymentIntentId:
        paymentData.stripe_payment_intent_id !== undefined
          ? paymentData.stripe_payment_intent_id
          : existingPayment.stripe_payment_intent_id,
    });
  }

  async deletePayment(paymentId) {
    await this.subscriptionRepository.deletePayment(paymentId);
  }
}

export { PaymentService };
export default new PaymentService({ subscriptionRepository });
