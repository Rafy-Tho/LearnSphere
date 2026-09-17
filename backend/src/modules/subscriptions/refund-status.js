export const REFUND_STATUS_MAP = {
  pending: "PENDING",
  requires_action: "PENDING",
  succeeded: "SUCCEEDED",
  failed: "FAILED",
  canceled: "FAILED",
};

export function mapRefundStatus(status) {
  return REFUND_STATUS_MAP[status] || "PENDING";
}

// Recomputes a payment's status from its SUCCEEDED refunds.
export async function syncPaymentRefundStatus({
  paymentRepository,
  refundRepository,
  payment,
  client,
}) {
  const refunded = await refundRepository.sumByPayment(payment.id, client);
  const total = Number(payment.amount);

  let status = payment.payment_status;
  if (total > 0 && refunded >= total) status = "REFUNDED";
  else if (refunded > 0) status = "PARTIALLY_REFUNDED";

  if (status !== payment.payment_status) {
    await paymentRepository.updatePaymentStatus(payment.id, status, null, client);
  }

  return { paymentId: payment.id, refunded, status };
}
