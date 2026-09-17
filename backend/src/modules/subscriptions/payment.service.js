import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
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
    const filters = {
      search: query.search,
      status: query.status,
      planId: query.plan_id,
    };

    const [payments, total] = await Promise.all([
      this.paymentRepository.findAllPayments({ limit, offset, ...filters }),
      this.paymentRepository.countPayments(filters),
    ]);

    return { payments, pagination: buildPagination({ total, page, limit }) };
  }

  async getPayment(paymentId) {
    const payment = await this.paymentRepository.findPaymentById(paymentId);
    if (!payment) {
      throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");
    }
    return payment;
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
}

export { PaymentService };
export default new PaymentService({ paymentRepository });
