import { useState } from "react";
import { toast } from "react-toastify";
import Modal from "@/components/ui/Modal";
import Button from "@/components/ui/Button";
import Input from "@/components/ui/Input";
import Textarea from "@/components/ui/Textarea";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import BillingStatusBadge from "@/features/subscriptions/components/BillingStatusBadge";
import {
  usePayment,
  usePaymentRefundRequests,
} from "@/features/subscriptions/hooks/useSubscriptions";
import { useCreateRefundRequest } from "@/features/subscriptions/hooks/useSubscriptionMutations";
import {
  formatDate,
  formatMoney,
  maskPaymentId,
} from "@/features/subscriptions/utils/money";

const REFUNDABLE_STATUSES = ["COMPLETED", "PARTIALLY_REFUNDED"];

function Row({ label, value, valueClassName = "" }) {
  return (
    <div className="flex items-center justify-between gap-4 py-2">
      <span className="shrink-0 text-sm text-foreground-muted">{label}</span>
      <span
        className={`min-w-0 break-all text-right text-sm font-medium text-foreground ${valueClassName}`}
      >
        {value}
      </span>
    </div>
  );
}

export default function PaymentDetailsModal({ paymentId, open, onClose }) {
  const { data, isPending, error, refetch } = usePayment(
    open ? paymentId : null,
  );
  const { data: refundRequests = [] } = usePaymentRefundRequests(
    open ? paymentId : null,
  );
  const createRefundRequest = useCreateRefundRequest();

  const [showForm, setShowForm] = useState(false);
  const [reason, setReason] = useState("");
  const [note, setNote] = useState("");
  const [formError, setFormError] = useState("");

  const currency = data?.currency;
  const refunded = Number(data?.refunded_total || 0);
  const refundable = Number(
    data?.refundable_amount ?? Math.max(Number(data?.amount || 0) - refunded, 0),
  );
  const hasPending = refundRequests.some(
    (request) => request.status === "PENDING",
  );
  const canRequest =
    refundable > 0 &&
    !hasPending &&
    REFUNDABLE_STATUSES.includes(data?.payment_status);

  function closeForm() {
    setShowForm(false);
    setReason("");
    setNote("");
    setFormError("");
  }

  async function submitRefund(event) {
    event.preventDefault();
    setFormError("");

    const trimmedReason = reason.trim();
    if (trimmedReason.length < 3) {
      setFormError("Please provide a reason (at least 3 characters).");
      return;
    }

    try {
      await createRefundRequest.mutateAsync({
        paymentId,
        reason: trimmedReason,
        userNote: note.trim() || undefined,
      });
      toast.success("Refund request submitted. We'll review it shortly.");
      closeForm();
    } catch (err) {
      setFormError(err.message || "Could not submit your refund request.");
    }
  }

  return (
    <Modal open={open} onClose={onClose} title="Payment details" size="md">
      {isPending ? (
        <div className="flex justify-center py-10">
          <SpinnerLoader />
        </div>
      ) : error ? (
        <ErrorMessage
          title="We couldn't load this payment"
          message={error.message}
          onRetry={() => refetch()}
        />
      ) : data ? (
        <div className="space-y-4">
          <div className="flex items-center justify-between">
            <p className="text-base font-semibold text-foreground">
              {data.plan_name || "Subscription"}
            </p>
            <BillingStatusBadge status={data.payment_status} />
          </div>

          <div className="rounded-lg border border-border divide-y divide-border px-4">
            <Row
              label="Subtotal"
              value={formatMoney(data.subtotal ?? data.amount, currency)}
            />
            {data.coupon_code && (
              <Row label="Coupon" value={data.coupon_code} />
            )}
            {Number(data.discount_amount) > 0 && (
              <Row
                label="Discount"
                value={`-${formatMoney(data.discount_amount, currency)}`}
                valueClassName="text-success"
              />
            )}
            <Row
              label="Total"
              value={formatMoney(data.amount, currency)}
              valueClassName="font-semibold"
            />
          </div>

          <div className="rounded-lg border border-border divide-y divide-border px-4">
            <Row
              label="Payment date"
              value={formatDate(data.paid_at || data.created_at)}
            />
            <Row
              label="Payment ID"
              value={maskPaymentId(
                data.stripe_payment_intent_id || data.id,
              )}
            />
          </div>

          {(refunded > 0 || refundable > 0) && (
            <div className="rounded-lg border border-border divide-y divide-border px-4">
              <Row
                label="Original payment"
                value={formatMoney(data.amount, currency)}
              />
              {refunded > 0 && (
                <Row
                  label="Refunded"
                  value={formatMoney(refunded, currency)}
                  valueClassName="text-warning"
                />
              )}
              <Row
                label="Refundable"
                value={formatMoney(refundable, currency)}
              />
            </div>
          )}

          <div className="space-y-3">
            <div className="flex items-center justify-between">
              <p className="text-sm font-semibold text-foreground">
                Refund requests
              </p>
              {data.refund_request_status && (
                <BillingStatusBadge status={data.refund_request_status} />
              )}
            </div>

            {refundRequests.length > 0 && (
              <div className="rounded-lg border border-border divide-y divide-border px-4">
                {refundRequests.map((request) => (
                  <div
                    key={request.id}
                    className="flex items-center justify-between gap-3 py-2"
                  >
                    <div className="min-w-0">
                      <p className="truncate text-sm font-medium text-foreground">
                        {formatMoney(request.requested_amount, request.currency)}
                      </p>
                      <p className="text-xs text-foreground-muted">
                        {formatDate(request.requested_at || request.created_at)}
                      </p>
                    </div>
                    <BillingStatusBadge status={request.status} />
                  </div>
                ))}
              </div>
            )}

            {canRequest && !showForm && (
              <Button
                variant="secondary"
                fullWidth
                onClick={() => setShowForm(true)}
              >
                Request refund
              </Button>
            )}

            {showForm && (
              <form onSubmit={submitRefund} className="space-y-3">
                <p className="text-xs text-foreground-muted">
                  You are requesting a refund of{" "}
                  {formatMoney(refundable, currency)}. Our team will review it.
                </p>
                <Input
                  label="Reason"
                  value={reason}
                  onChange={(event) => setReason(event.target.value)}
                  placeholder="Why are you requesting a refund?"
                  autoComplete="off"
                />
                <Textarea
                  label="Additional note (optional)"
                  value={note}
                  onChange={(event) => setNote(event.target.value)}
                  rows={3}
                />
                {formError && (
                  <p className="text-sm text-destructive">{formError}</p>
                )}
                <div className="flex gap-2">
                  <Button
                    type="submit"
                    isLoading={createRefundRequest.isPending}
                  >
                    Submit request
                  </Button>
                  <Button
                    type="button"
                    variant="ghost"
                    onClick={closeForm}
                    disabled={createRefundRequest.isPending}
                  >
                    Cancel
                  </Button>
                </div>
              </form>
            )}
          </div>
        </div>
      ) : null}
    </Modal>
  );
}
