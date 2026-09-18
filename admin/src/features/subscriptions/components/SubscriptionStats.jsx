import { CreditCard, DollarSign, Ticket, Users } from "lucide-react";
import { StatsCard } from "@/features/dashboard/components/StatsCard";

export function SubscriptionStats({ stats }) {
  const currency = stats?.currency?.toUpperCase() || "USD";
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-4">
      <StatsCard
        title="Active Subscriptions"
        value={stats?.active_subscriptions ?? 0}
        icon={Users}
      />
      <StatsCard
        title="Total Payments"
        value={stats?.total_payments ?? 0}
        icon={CreditCard}
      />
      <StatsCard
        title="Net Revenue"
        value={`${currency} ${Number(stats?.net_revenue ?? 0).toFixed(2)}`}
        icon={DollarSign}
      />
      <StatsCard
        title="Active Coupons"
        value={stats?.active_coupons ?? 0}
        icon={Ticket}
      />
    </div>
  );
}