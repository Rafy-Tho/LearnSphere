import { FormModal } from "@/components/FormModal";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

export function RefundModal({
  open,
  onOpenChange,
  payment,
  onConfirm,
  isRefunding,
}) {
  return (
    <FormModal
      open={open}
      onOpenChange={onOpenChange}
      title={`Refund Payment - ${payment?.user_name ?? ""}`}
    >
      <div className="space-y-4">
        <div>
          <label className="text-sm font-medium text-foreground">
            Amount ($)
          </label>
          <Input
            type="number"
            step="0.01"
            max={Number(payment?.amount ?? 0)}
            defaultValue={Number(payment?.amount ?? 0)}
            className="mt-1"
            id="refund-amount"
          />
        </div>
        <div>
          <label className="text-sm font-medium text-foreground">
            Reason (required)
          </label>
          <Input
            id="refund-reason"
            placeholder="e.g. Duplicate charge"
            className="mt-1"
          />
        </div>
        <p className="text-xs text-muted-foreground">
          The refund is submitted to Stripe for processing.
        </p>
        <div className="flex justify-end gap-3 pt-2">
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          <Button
            onClick={() => {
              const amountEl = document.getElementById("refund-amount");
              const reasonEl = document.getElementById("refund-reason");
              const amount = parseFloat(amountEl?.value) || 0;
              const reason = reasonEl?.value?.trim() || "";
              if (amount <= 0 || !reason) return;
              onConfirm({ amount, reason });
            }}
            disabled={isRefunding}
          >
            Submit Refund
          </Button>
        </div>
      </div>
    </FormModal>
  );
}