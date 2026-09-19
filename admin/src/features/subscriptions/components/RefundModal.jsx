import { useState } from "react";
import { FormModal } from "@/components/common/FormModal";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

export function RefundModal({
  open,
  onOpenChange,
  payment,
  onConfirm,
  isRefunding,
}) {
  const original = Number(payment?.amount ?? 0);
  const alreadyRefunded = Number(payment?.refunded_total ?? 0);
  const remaining = Number(
    payment?.refundable_amount ?? Math.max(original - alreadyRefunded, 0),
  );

  const [amount, setAmount] = useState(remaining);
  const [reason, setReason] = useState("");
  const [confirming, setConfirming] = useState(false);

  const parsedAmount = Number(amount) || 0;
  const invalid =
    parsedAmount <= 0 || parsedAmount > remaining + 0.001 || !reason.trim();

  return (
    <FormModal
      open={open}
      onOpenChange={(next) => {
        setConfirming(false);
        onOpenChange(next);
      }}
      title={`Refund Payment - ${payment?.user_name ?? ""}`}
    >
      <div className="space-y-4">
        <div className="space-y-1 rounded-lg border border-border bg-muted/30 p-3 text-sm">
          <div className="flex justify-between">
            <span className="text-muted-foreground">Payment amount</span>
            <span className="font-medium">${original.toFixed(2)}</span>
          </div>
          <div className="flex justify-between">
            <span className="text-muted-foreground">Already refunded</span>
            <span className="font-medium">${alreadyRefunded.toFixed(2)}</span>
          </div>
          <div className="flex justify-between">
            <span className="text-muted-foreground">Remaining refundable</span>
            <span className="font-medium">${remaining.toFixed(2)}</span>
          </div>
        </div>

        <div>
          <label className="text-sm font-medium text-foreground">
            Refund amount ($)
          </label>
          <Input
            type="number"
            step="0.01"
            min="0"
            max={remaining}
            value={amount}
            onChange={(e) => {
              setAmount(e.target.value);
              setConfirming(false);
            }}
            className="mt-1"
          />
          {parsedAmount > remaining + 0.001 && (
            <p className="mt-1 text-xs text-destructive">
              Amount exceeds the remaining refundable balance.
            </p>
          )}
        </div>

        <div>
          <label className="text-sm font-medium text-foreground">
            Reason (required)
          </label>
          <Input
            value={reason}
            onChange={(e) => {
              setReason(e.target.value);
              setConfirming(false);
            }}
            placeholder="e.g. Duplicate charge"
            className="mt-1"
          />
        </div>

        <p className="text-xs text-muted-foreground">
          The refund is submitted to Stripe. Payment status updates once Stripe
          confirms.
        </p>

        <div className="flex justify-end gap-3 pt-2">
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          {confirming ? (
            <Button
              variant="destructive"
              disabled={invalid || isRefunding}
              onClick={() =>
                onConfirm({ amount: parsedAmount, reason: reason.trim() })
              }
            >
              {isRefunding ? "Processing..." : `Confirm $${parsedAmount.toFixed(2)}`}
            </Button>
          ) : (
            <Button
              disabled={invalid}
              onClick={() => setConfirming(true)}
            >
              Submit Refund
            </Button>
          )}
        </div>
      </div>
    </FormModal>
  );
}
