import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import stripe from "../../config/stripe.js";
import { withTransaction } from "../../config/database.js";
import paymentRepository from "./payment.repository.js";
import refundRepository from "./refund.repository.js";
import {
  mapRefundStatus,
  syncPaymentRefundStatus,
} from "./refund-status.js";

const STRIPE_REFUND_REASONS = [
  "duplicate",
  "fraudulent",
  "requested_by_customer",
];
const REFUNDABLE_STATUSES = ["COMPLETED", "PARTIALLY_REFUNDED"];

function roundMoney(value) {
  return Math.round(Number(value) * 100) / 100;
}

class RefundService {
  constructor({ paymentRepository, refundRepository }) {
    this.paymentRepository = paymentRepository;
    this.refundRepository = refundRepository;
  }

  async getRefunds(paymentId) {
    const payment = await this.paymentRepository.findPaymentById(paymentId);
    if (!payment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }

    const refunds = await this.refundRepository.listByPayment(paymentId);
    const refunded = await this.refundRepository.sumByPayment(paymentId);
    const committed = await this.refundRepository.sumCommittedByPayment(
      paymentId,
    );

    return {
      refunds,
      original_amount: Number(payment.amount),
      refunded_total: refunded,
      refundable_amount: roundMoney(Number(payment.amount) - committed),
    };
  }

  async createRefund({ paymentId, amount, reason, adminId }) {
    const payment = await this.paymentRepository.findPaymentById(paymentId);
    if (!payment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }
    if (!REFUNDABLE_STATUSES.includes(payment.payment_status)) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Only completed payments can be refunded",
      );
    }
    if (!payment.stripe_payment_intent_id) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Payment has no Stripe reference to refund",
      );
    }

    const committed = await this.refundRepository.sumCommittedByPayment(
      paymentId,
    );
    const refundable = roundMoney(Number(payment.amount) - committed);
    if (refundable <= 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Payment is already fully refunded",
      );
    }

    const requested =
      amount === undefined || amount === null || amount === ""
        ? refundable
        : roundMoney(amount);

    if (!Number.isFinite(requested) || requested <= 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Refund amount must be greater than 0",
      );
    }
    if (requested > refundable + 0.001) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Refund amount exceeds the refundable balance",
      );
    }

    const stripeReason = STRIPE_REFUND_REASONS.includes(reason)
      ? reason
      : "requested_by_customer";

    let stripeRefund;
    try {
      stripeRefund = await stripe.refunds.create({
        payment_intent: payment.stripe_payment_intent_id,
        amount: Math.round(requested * 100),
        reason: stripeReason,
        metadata: { paymentId, reason: reason || "" },
      });
    } catch (error) {
      logger.error("Stripe refund failed", {
        paymentId,
        message: error.message,
      });
      throw new ApiError(
        StatusCode.BAD_GATEWAY,
        "Stripe could not process the refund",
      );
    }

    const status = mapRefundStatus(stripeRefund.status);

    const result = await withTransaction(async (client) => {
      const refund = await this.refundRepository.upsertByStripeRefundId(
        {
          paymentId,
          amount: Number(stripeRefund.amount) / 100,
          currency: stripeRefund.currency || payment.currency || "usd",
          status,
          stripeRefundId: stripeRefund.id,
          reason: reason || null,
          refundedAt: status === "SUCCEEDED" ? new Date() : null,
        },
        client,
      );

      const sync = await syncPaymentRefundStatus({
        paymentRepository: this.paymentRepository,
        refundRepository: this.refundRepository,
        payment,
        client,
      });

      return { refund, ...sync };
    });

    logger.audit("payment.refund.create", {
      adminId,
      paymentId,
      amount: requested,
      stripeRefundId: stripeRefund.id,
      status,
    });

    return result;
  }
}

export { RefundService };
export default new RefundService({ paymentRepository, refundRepository });
