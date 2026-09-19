import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import environment from "../../config/environment.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import paymentRepository from "./payment.repository.js";
import refundRepository from "./refund.repository.js";
import refundRequestRepository from "./refund-request.repository.js";

const REFUNDABLE_STATUSES = ["COMPLETED", "PARTIALLY_REFUNDED"];

function roundMoney(value) {
  return Math.round(Number(value) * 100) / 100;
}

class RefundRequestService {
  constructor({
    refundRequestRepository,
    paymentRepository,
    refundRepository,
  }) {
    this.refundRequestRepository = refundRequestRepository;
    this.paymentRepository = paymentRepository;
    this.refundRepository = refundRepository;
  }

  async createRequest({
    userId,
    paymentId,
    requestedAmount,
    reason,
    userNote,
  }) {
    const payment = await this.paymentRepository.findUserPaymentById({
      userId,
      paymentId,
    });
    if (!payment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }

    if (!REFUNDABLE_STATUSES.includes(payment.payment_status)) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "This payment is not eligible for a refund",
      );
    }

    const paidAt = payment.paid_at ? new Date(payment.paid_at) : null;
    if (!paidAt) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "This payment has no confirmed payment date",
      );
    }

    const windowMs = Number(environment.REFUND_WINDOW_DAYS) * 24 * 60 * 60 * 1000;
    if (Date.now() > paidAt.getTime() + windowMs) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "The refund window for this payment has passed",
      );
    }

    const refunded = await this.refundRepository.sumByPayment(paymentId);
    const refundable = roundMoney(Number(payment.amount) - refunded);
    if (refundable <= 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "This payment has already been fully refunded",
      );
    }

    const requested =
      requestedAmount === undefined ||
      requestedAmount === null ||
      requestedAmount === ""
        ? refundable
        : roundMoney(requestedAmount);

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

    const existingPending =
      await this.refundRequestRepository.findPendingByPayment(paymentId);
    if (existingPending) {
      throw new ApiError(
        StatusCode.CONFLICT,
        "A refund request is already pending for this payment",
      );
    }

    let request;
    try {
      request = await this.refundRequestRepository.create({
        paymentId,
        userId,
        requestedAmount: requested,
        currency: payment.currency || "usd",
        reason,
        userNote,
      });
    } catch (error) {
      if (error.code === "23505") {
        throw new ApiError(
          StatusCode.CONFLICT,
          "A refund request is already pending for this payment",
        );
      }
      throw error;
    }

    logger.audit("refund_request.created", {
      userId,
      paymentId,
      requestId: request.id,
      amount: requested,
    });

    return request;
  }

  async getMyRequests(userId, query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [requests, total] = await Promise.all([
      this.refundRequestRepository.listByUser({ userId, limit, offset }),
      this.refundRequestRepository.countByUser(userId),
    ]);

    return {
      requests,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async getMyRequest(userId, requestId) {
    const request = await this.refundRequestRepository.findByIdForUser({
      id: requestId,
      userId,
    });
    if (!request) {
      throw new ApiError(StatusCode.NOT_FOUND, "Refund request not found");
    }
    return request;
  }

  async getPaymentRequests(userId, paymentId) {
    const payment = await this.paymentRepository.findUserPaymentById({
      userId,
      paymentId,
    });
    if (!payment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }
    return this.refundRequestRepository.listByPayment(paymentId);
  }

  // --- Admin review workflow (never calls Stripe) -------------------------

  async getAdminRequests(query = {}) {
    const { page, limit, offset } = parsePagination(query, {
      defaultLimit: 20,
    });
    const filters = {
      status: query.status,
      search: query.search,
      paymentId: query.payment_id,
      dateFrom: query.date_from,
      dateTo: query.date_to,
    };

    const [requests, total] = await Promise.all([
      this.refundRequestRepository.findAll({ limit, offset, ...filters }),
      this.refundRequestRepository.countAll(filters),
    ]);

    return {
      requests: requests.map((request) => this.#decorateRequest(request)),
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async getAdminRequest(requestId) {
    const request = await this.refundRequestRepository.findDetailById(requestId);
    if (!request) {
      throw new ApiError(StatusCode.NOT_FOUND, "Refund request not found");
    }
    return this.#decorateRequest(request);
  }

  // Surfaces refund-window eligibility from the same rule used on creation.
  #decorateRequest(request) {
    if (!request) return request;
    const windowMs =
      Number(environment.REFUND_WINDOW_DAYS) * 24 * 60 * 60 * 1000;
    const paidAt = request.paid_at ? new Date(request.paid_at) : null;
    return {
      ...request,
      refund_window_days: Number(environment.REFUND_WINDOW_DAYS),
      within_refund_window: Boolean(
        paidAt && Date.now() <= paidAt.getTime() + windowMs,
      ),
    };
  }

  async approveRequest({ requestId, adminId, note = null }) {
    const request =
      await this.refundRequestRepository.findDetailById(requestId);
    if (!request) {
      throw new ApiError(StatusCode.NOT_FOUND, "Refund request not found");
    }
    if (request.status !== "PENDING") {
      throw new ApiError(
        StatusCode.CONFLICT,
        "This refund request has already been reviewed",
      );
    }

    const payment = await this.paymentRepository.findPaymentById(
      request.payment_id,
    );
    if (!payment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }
    if (!REFUNDABLE_STATUSES.includes(payment.payment_status)) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "This payment is no longer refundable",
      );
    }

    const committed = await this.refundRepository.sumCommittedByPayment(
      request.payment_id,
    );
    const refundable = roundMoney(Number(payment.amount) - committed);
    if (refundable <= 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "This payment has already been fully refunded",
      );
    }
    if (Number(request.requested_amount) > refundable + 0.001) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "The requested amount exceeds the current refundable balance",
      );
    }

    const updated = await this.refundRequestRepository.updateStatus({
      id: requestId,
      status: "APPROVED",
      reviewedBy: adminId,
      adminNote: note,
    });
    if (!updated) {
      throw new ApiError(
        StatusCode.CONFLICT,
        "This refund request has already been reviewed",
      );
    }

    logger.audit("refund.request.approve", {
      adminId,
      requestId,
      paymentId: request.payment_id,
      amount: Number(request.requested_amount),
      note: note || null,
    });

    return updated;
  }

  async rejectRequest({ requestId, adminId, reason }) {
    if (!reason) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "A reason is required to reject a refund request",
      );
    }

    const request = await this.refundRequestRepository.findById(requestId);
    if (!request) {
      throw new ApiError(StatusCode.NOT_FOUND, "Refund request not found");
    }
    if (request.status !== "PENDING") {
      throw new ApiError(
        StatusCode.CONFLICT,
        "This refund request has already been reviewed",
      );
    }

    const updated = await this.refundRequestRepository.updateStatus({
      id: requestId,
      status: "REJECTED",
      reviewedBy: adminId,
      adminNote: reason,
    });
    if (!updated) {
      throw new ApiError(
        StatusCode.CONFLICT,
        "This refund request has already been reviewed",
      );
    }

    logger.audit("refund.request.reject", {
      adminId,
      requestId,
      paymentId: request.payment_id,
      reason,
    });

    return updated;
  }
}

export { RefundRequestService };
export default new RefundRequestService({
  refundRequestRepository,
  paymentRepository,
  refundRepository,
});
