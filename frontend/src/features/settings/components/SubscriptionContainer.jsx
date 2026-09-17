import { Link } from "react-router-dom";
import { CreditCard } from "lucide-react";
import SectionCard from "@/features/settings/components/SectionCard";
import { useActiveSubscription } from "@/features/subscriptions/hooks/useSubscriptions";
import { formatDate } from "@/features/subscriptions/utils/money";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import BillingStatusBadge from "@/features/subscriptions/components/BillingStatusBadge";

function SubscriptionContainer() {
  const { data, isPending, error } = useActiveSubscription();
  const subscription = data || null;

  return (
    <SectionCard title="Subscription" icon={<CreditCard size={15} />}>
      {isPending ? (
        <div className="flex justify-center py-6">
          <SpinnerLoader />
        </div>
      ) : error ? (
        <ErrorMessage
          title="We couldn't load your subscription"
          message={error.message}
        />
      ) : (
        <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <div>
            {subscription ? (
              <>
                <div className="flex items-center gap-2">
                  <p className="font-semibold text-foreground">
                    {subscription.name}
                  </p>
                  <BillingStatusBadge
                    status={
                      subscription.status ||
                      (subscription.is_active ? "ACTIVE" : "EXPIRED")
                    }
                  />
                </div>
                <p className="mt-1 text-sm text-foreground-muted">
                  {subscription.is_active
                    ? `Access until ${formatDate(subscription.end_date)}`
                    : `Access ended on ${formatDate(subscription.end_date)}`}
                </p>
              </>
            ) : (
              <p className="text-sm text-foreground-muted">
                You don't have an active plan yet.
              </p>
            )}
          </div>
          <Link
            to="/learning-dashboard/billing"
            className="inline-flex items-center justify-center rounded-xl bg-primary px-4 py-2.5 text-sm font-medium text-white transition-colors hover:bg-primary-hover"
          >
            Manage Billing
          </Link>
        </div>
      )}
    </SectionCard>
  );
}

export default SubscriptionContainer;
