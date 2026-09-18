import { Repeat } from "lucide-react";
import { DataTable } from "@/components/DataTable";
import { StatusBadge } from "@/components/StatusBadge";
import { Button } from "@/components/ui/button";

export function SubscriptionsTab({ subscriptions, onOverride }) {
  const columns = [
    {
      key: "user_name",
      header: "User",
      render: (s) => (
        <span className="font-medium text-foreground">{s.user_name}</span>
      ),
    },
    {
      key: "plan_name",
      header: "Plan",
      render: (s) => (
        <span className="text-sm text-muted-foreground">{s.plan_name}</span>
      ),
    },
    {
      key: "start_date",
      header: "Start",
      render: (s) => (
        <span className="text-sm text-muted-foreground">
          {new Date(s.start_date).toLocaleDateString()}
        </span>
      ),
    },
    {
      key: "end_date",
      header: "End",
      render: (s) => (
        <span className="text-sm text-muted-foreground">
          {new Date(s.end_date).toLocaleDateString()}
        </span>
      ),
    },
    {
      key: "status",
      header: "Status",
      render: (s) => <StatusBadge status={s.status} />,
    },
  ];

  return (
    <div className="space-y-4">
      <div className="flex justify-end">
        <Button onClick={onOverride} className="gap-2">
          <Repeat className="h-4 w-4" /> Override Subscription
        </Button>
      </div>
      <DataTable columns={columns} data={subscriptions} />
    </div>
  );
}