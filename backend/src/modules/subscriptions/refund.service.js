import { randomUUID } from "node:crypto";
import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import stripe from "../../config/stripe.js";
import { withTransaction } from "../../config/database.js";
import paymentRepository from "./payment.repository.js";
import refundRepository from "./refund.repository.js";
import refundRequestRepository from "./refund-request.repository.js";
import subscriptionService from "./subscription.service.js";
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
  constructor({
    paymentRepository,
    refundRepository,
    refundRequestRepository,
    subscriptionService,
  }) {
    this.paymentRepository = paymentRepository;
    this.refundRepository = refundRepository;
    this.refundRequestRepository = refundRequestRepository;
    this.subscriptionService = subscriptionService;
  }

  async getAllRefunds(query = {}) {
    const { page, limit, offset } = parsePagination(query, {
      defaultLimit: 20,
    });
    const filters = { status: query.status, search: query.search };

    const [refunds, total] = await Promise.all([
      this.refundRepository.findAllRefunds({ limit, offset, ...filters }),
      this.refundRepository.countAllRefunds(filters),
    ]);

    return {
      refunds,
      pagination: buildPagination({ total, page, limit }),
    };
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

  async createRefund({
    paymentId,
    amount,
    reason,
    adminId,
    refundRequestId = null,
    idempotencyKey = null,
  }) {
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

    if (refundRequestId) {
      const request =
        await this.refundRequestRepository.findById(refundRequestId);
      if (!request || request.payment_id !== paymentId) {
        throw new ApiError(
          StatusCode.NOT_FOUND,
          "Refund request not found for this payment",
        );
      }
      if (request.status !== "APPROVED") {
        throw new ApiError(
          StatusCode.BAD_REQUEST,
          "Refund request must be approved before a refund can be created",
        );
      }
    }

    // Stable key so retries reuse the same row and the same Stripe request.
    const key =
      idempotencyKey ||
      (refundRequestId
        ? `refund_request_${refundRequestId}`
        : `admin_refund_${paymentId}_${randomUUID()}`);

    // Reserve the refund row under a payment row lock and validate the
    // refundable balance inside the same transaction.
    let placeholder;
    try {
      placeholder = await withTransaction(async (client) => {
        const locked = await this.paymentRepository.findPaymentByIdForUpdate(
          paymentId,
          client,
        );
        if (!locked) {
          throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
        }
        if (!REFUNDABLE_STATUSES.includes(locked.payment_status)) {
          throw new ApiError(
            StatusCode.BAD_REQUEST,
            "Only completed payments can be refunded",
          );
        }

        const committed = await this.refundRepository.sumCommittedByPayment(
          paymentId,
          client,
        );
        const refundable = roundMoney(Number(locked.amount) - committed);
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

        const row = await this.refundRepository.insertPendingRefund(
          {
            paymentId,
            amount: requested,
            currency: locked.currency || payment.currency || "usd",
            idempotencyKey: key,
            reason: reason || null,
          },
          client,
        );
        return { row, requested };
      });
    } catch (error) {
      if (error.code === "23505") {
        const existing =
          await this.refundRepository.findByIdempotencyKey(key);
        return {
          refund: existing,
          paymentId,
          status: existing?.refund_status || "PENDING",
          idempotent: true,
        };
      }
      throw error;
    }

    const requested = placeholder.requested;
    const stripeReason = STRIPE_REFUND_REASONS.includes(reason)
      ? reason
      : "requested_by_customer";

    let stripeRefund;
    try {
      stripeRefund = await stripe.refunds.create(
        {
          payment_intent: payment.stripe_payment_intent_id,
          amount: Math.round(requested * 100),
          reason: stripeReason,
          metadata: {
            paymentId,
            refundRequestId: refundRequestId || "",
            idempotencyKey: key,
            reason: reason || "",
          },
        },
        { idempotencyKey: key },
      );
    } catch (error) {
      logger.error("Stripe refund failed", {
        paymentId,
        message: error.message,
      });
      try {
        await withTransaction(async (client) => {
          await this.refundRepository.markFailed(
            placeholder.row.id,
            error.message,
            client,
          );
        });
      } catch (markError) {
        logger.error("Failed to mark refund as failed", {
          paymentId,
          refundId: placeholder.row.id,
          message: markError.message,
        });
      }
      logger.audit("payment.refund.failed", {
        adminId,
        paymentId,
        amount: requested,
        idempotencyKey: key,
        reason: error.message,
      });
      throw new ApiError(
        StatusCode.BAD_GATEWAY,
        "Stripe could not process the refund",
      );
    }

    const status = mapRefundStatus(stripeRefund.status);

    const result = await withTransaction(async (client) => {
      const refund = await this.refundRepository.applyStripeResult(
        {
          id: placeholder.row.id,
          stripeRefundId: stripeRefund.id,
          status,
          amount: Number(stripeRefund.amount) / 100,
          currency: stripeRefund.currency || payment.currency || "usd",
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

      if (refundRequestId) {
        await this.refundRequestRepository.setPaymentRefund(
          { id: refundRequestId, paymentRefundId: refund.id },
          client,
        );
      }

      await this.subscriptionService.applyRefundAccessRule({
        subscriptionId: payment.user_subscription_id,
        paymentStatus: sync.status,
        paymentId,
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
      refundRequestId: refundRequestId || null,
    });
    if (status === "SUCCEEDED") {
      logger.audit("payment.refund.success", {
        adminId,
        paymentId,
        stripeRefundId: stripeRefund.id,
        amount: requested,
      });
    } else if (status === "FAILED") {
      logger.audit("payment.refund.failed", {
        adminId,
        paymentId,
        stripeRefundId: stripeRefund.id,
        amount: requested,
      });
    }

    return result;
  }
}

export { RefundService };
export default new RefundService({
  paymentRepository,
  refundRepository,
  refundRequestRepository,
  subscriptionService,
});
