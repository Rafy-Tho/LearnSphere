import { FormModal } from "@/components/common/FormModal";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { useSubscription } from "@/features/subscriptions/hooks";

export function SubscriptionDetailModal({ open, onOpenChange, subscriptionId }) {
  const { subscription, isLoading } = useSubscription(
    open ? subscriptionId : undefined,
  );

  return (
    <FormModal
      open={open}
      onOpenChange={onOpenChange}
      title="Subscription Details"
    >
      {isLoading || !subscription ? (
        <Skeleton className="h-24 w-full" />
      ) : (
        <div className="space-y-3 text-sm">
          <div className="flex justify-between">
            <span className="text-muted-foreground">User</span>
            <span className="font-medium">
              {subscription.user_name} ({subscription.user_email})
            </span>
          </div>
          <div className="flex justify-between">
            <span className="text-muted-foreground">Plan</span>
            <span className="font-medium">{subscription.plan_name}</span>
          </div>
          <div className="flex justify-between">
            <span className="text-muted-foreground">Source</span>
            <StatusBadge status={subscription.source || "PAID"} />
          </div>
          <div className="flex justify-between">
            <span className="text-muted-foreground">Status</span>
            <StatusBadge status={subscription.status} />
          </div>
          <div className="flex justify-between">
            <span className="text-muted-foreground">Start</span>
            <span className="font-medium">
              {new Date(subscription.start_date).toLocaleDateString()}
            </span>
          </div>
          <div className="flex justify-between">
            <span className="text-muted-foreground">End</span>
            <span className="font-medium">
              {new Date(subscription.end_date).toLocaleDateString()}
            </span>
          </div>

          <div>
            <p className="mb-2 font-semibold text-foreground">Payments</p>
            {(subscription.payments || []).length === 0 ? (
              <p className="text-muted-foreground">
                No payment (administrative override).
              </p>
            ) : (
              <div className="space-y-2">
                {subscription.payments.map((p) => (
                  <div
                    key={p.id}
                    className="flex items-center justify-between rounded-lg border border-border p-2"
                  >
                    <span>
                      ${Number(p.amount).toFixed(2)} {p.currency}
                    </span>
                    <StatusBadge status={p.payment_status} />
                  </div>
                ))}
              </div>
            )}
          </div>

          <div>
            <p className="mb-2 font-semibold text-foreground">Refunds</p>
            {(subscription.refunds || []).length === 0 ? (
              <p className="text-muted-foreground">No refunds.</p>
            ) : (
              <div className="space-y-2">
                {subscription.refunds.map((r) => (
                  <div
                    key={r.id}
                    className="flex items-center justify-between rounded-lg border border-border p-2"
                  >
                    <span>
                      ${Number(r.amount).toFixed(2)} {r.currency}
                    </span>
                    <StatusBadge status={r.refund_status} />
                  </div>
                ))}
              </div>
            )}
          </div>

          <div className="flex justify-end pt-2">
            <Button variant="outline" onClick={() => onOpenChange(false)}>
              Close
            </Button>
          </div>
        </div>
      )}
    </FormModal>
  );
}
