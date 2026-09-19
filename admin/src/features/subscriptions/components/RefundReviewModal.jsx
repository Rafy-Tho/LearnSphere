import { useState } from "react";
import { FormModal } from "@/components/common/FormModal";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

function Row({ label, value }) {
  return (
    <div className="flex justify-between gap-4 text-sm">
      <span className="text-muted-foreground">{label}</span>
      <span className="text-right font-medium text-foreground">{value}</span>
    </div>
  );
}

export function RefundReviewModal({
  open,
  onOpenChange,
  request,
  onApprove,
  onReject,
  isApproving,
  isRejecting,
}) {
  const [note, setNote] = useState("");
  const [reason, setReason] = useState("");

  if (!request) return null;
  const pending = request.status === "PENDING";

  return (
    <FormModal
      open={open}
      onOpenChange={onOpenChange}
      title="Review Refund Request"
    >
      <div className="space-y-4">
        <div className="space-y-2 rounded-lg border border-border bg-muted/30 p-3">
          <Row label="User" value={`${request.user_name} (${request.user_email})`} />
          <Row label="Plan" value={request.plan_name} />
          <Row
            label="Payment"
            value={`$${Number(request.payment_amount).toFixed(2)} ${
              request.payment_currency
            }`}
          />
          <Row
            label="Payment status"
            value={<StatusBadge status={request.payment_status} />}
          />
          <Row
            label="Requested"
            value={`$${Number(request.requested_amount).toFixed(2)}`}
          />
          <Row
            label="Refundable"
            value={`$${Number(
              request.refundable_amount ?? request.payment_amount,
            ).toFixed(2)}`}
          />
          <Row label="Reason" value={request.reason} />
          {request.user_note && <Row label="User note" value={request.user_note} />}
          <Row
            label="Status"
            value={<StatusBadge status={request.status} />}
          />
        </div>

        {pending ? (
          <>
            <div>
              <label className="text-sm font-medium text-foreground">
                Admin note (optional)
              </label>
              <Input
                value={note}
                onChange={(e) => setNote(e.target.value)}
                placeholder="Internal note for the approval"
                className="mt-1"
              />
            </div>
            <div>
              <label className="text-sm font-medium text-foreground">
                Rejection reason (required to reject)
              </label>
              <Input
                value={reason}
                onChange={(e) => setReason(e.target.value)}
                placeholder="Reason shown for rejection"
                className="mt-1"
              />
            </div>
            <div className="flex justify-end gap-3 pt-2">
              <Button variant="outline" onClick={() => onOpenChange(false)}>
                Cancel
              </Button>
              <Button
                variant="destructive"
                disabled={!reason.trim() || isApproving || isRejecting}
                onClick={() => onReject({ reason: reason.trim() })}
              >
                Reject
              </Button>
              <Button
                disabled={isApproving || isRejecting}
                onClick={() => onApprove({ note: note.trim() || null })}
              >
                Approve
              </Button>
            </div>
          </>
        ) : (
          <div className="flex justify-end pt-2">
            <Button variant="outline" onClick={() => onOpenChange(false)}>
              Close
            </Button>
          </div>
        )}
      </div>
    </FormModal>
  );
}
