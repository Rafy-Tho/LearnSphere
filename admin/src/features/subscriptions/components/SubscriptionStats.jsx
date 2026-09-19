import {
  ClipboardList,
  CreditCard,
  DollarSign,
  RotateCcw,
  Ticket,
  Users,
} from "lucide-react";
import { StatsCard } from "@/features/dashboard/components/StatsCard";

export function SubscriptionStats({ stats }) {
  const currency = stats?.currency?.toUpperCase() || "USD";
  const money = (value) => `${currency} ${Number(value ?? 0).toFixed(2)}`;

  return (
    <div className="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3">
      <StatsCard
        title="Gross Revenue"
        value={money(stats?.total_revenue)}
        icon={DollarSign}
      />
      <StatsCard
        title="Refunded"
        value={money(stats?.total_refunds)}
        icon={RotateCcw}
      />
      <StatsCard
        title="Net Revenue"
        value={money(stats?.net_revenue)}
        icon={DollarSign}
      />
      <StatsCard
        title="Active Subscriptions"
        value={stats?.active_subscriptions ?? 0}
        icon={Users}
      />
      <StatsCard
        title="Pending Refund Requests"
        value={stats?.pending_refund_requests ?? 0}
        icon={ClipboardList}
      />
      <StatsCard
        title="Active Coupons"
        value={stats?.active_coupons ?? 0}
        icon={Ticket}
      />
      <StatsCard
        title="Total Payments"
        value={stats?.total_payments ?? 0}
        icon={CreditCard}
      />
    </div>
  );
}
