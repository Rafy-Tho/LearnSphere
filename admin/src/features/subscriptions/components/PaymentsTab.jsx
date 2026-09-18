import { Undo2 } from "lucide-react";
import { DataTable } from "@/components/DataTable";
import { StatusBadge } from "@/components/StatusBadge";
import { Button } from "@/components/ui/button";

export function PaymentsTab({ payments, onRefund }) {
  const columns = [
    {
      key: "user_name",
      header: "User",
      render: (p) => (
        <span className="font-medium text-foreground">{p.user_name}</span>
      ),
    },
    {
      key: "plan_name",
      header: "Plan",
      render: (p) => (
        <span className="text-sm text-muted-foreground">{p.plan_name}</span>
      ),
    },
    {
      key: "amount",
      header: "Amount",
      render: (p) => (
        <span className="text-sm font-semibold text-foreground">
          ${Number(p.amount).toFixed(2)}
        </span>
      ),
    },
    {
      key: "payment_status",
      header: "Status",
      render: (p) => <StatusBadge status={p.payment_status} />,
    },
    {
      key: "created_at",
      header: "Date",
      render: (p) => (
        <span className="text-sm text-muted-foreground">
          {new Date(p.created_at).toLocaleDateString()}
        </span>
      ),
    },
    {
      key: "actions",
      header: "Actions",
      render: (p) => (
        <div className="flex gap-1">
          <Button
            variant="ghost"
            size="sm"
            className="gap-1"
            disabled={!["COMPLETED", "PARTIALLY_REFUNDED"].includes(
              p.payment_status,
            )}
            onClick={(e) => {
              e.stopPropagation();
              onRefund(p);
            }}
          >
            <Undo2 className="h-4 w-4" /> Refund
          </Button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      <DataTable columns={columns} data={payments} />
    </div>
  );
}