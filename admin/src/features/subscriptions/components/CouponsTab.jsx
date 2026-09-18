import { Pencil, Plus, Power } from "lucide-react";
import { DataTable } from "@/components/DataTable";
import { StatusBadge } from "@/components/StatusBadge";
import { Button } from "@/components/ui/button";

export function CouponsTab({ coupons, onAdd, onEdit, onToggle }) {
  const columns = [
    {
      key: "code",
      header: "Code",
      render: (c) => (
        <span className="font-mono font-medium text-foreground">
          {c.code.toUpperCase()}
        </span>
      ),
    },
    {
      key: "discount",
      header: "Discount",
      render: (c) => (
        <span className="text-sm font-semibold text-foreground">
          {c.discount_type === "PERCENTAGE"
            ? `${Number(c.discount_value)}%`
            : `$${Number(c.discount_value).toFixed(2)}`}
        </span>
      ),
    },
    {
      key: "max_redemptions",
      header: "Max Uses",
      render: (c) => (
        <span className="text-sm text-muted-foreground">
          {c.max_redemptions ?? "Unlimited"}
        </span>
      ),
    },
    {
      key: "expires_at",
      header: "Expires",
      render: (c) => (
        <span className="text-sm text-muted-foreground">
          {c.expires_at
            ? new Date(c.expires_at).toLocaleDateString()
            : "Never"}
        </span>
      ),
    },
    {
      key: "is_active",
      header: "Status",
      render: (c) => (
        <StatusBadge status={c.is_active ? "ACTIVE" : "INACTIVE"} />
      ),
    },
    {
      key: "actions",
      header: "Actions",
      render: (c) => (
        <div className="flex gap-1">
          <Button
            variant="ghost"
            size="icon"
            onClick={(e) => {
              e.stopPropagation();
              onEdit(c);
            }}
          >
            <Pencil className="h-4 w-4" />
          </Button>
          <Button
            variant="ghost"
            size="icon"
            className={c.is_active ? "text-warning" : "text-success"}
            title={c.is_active ? "Deactivate" : "Activate"}
            onClick={(e) => {
              e.stopPropagation();
              onToggle(c.id, c.is_active);
            }}
          >
            <Power className="h-4 w-4" />
          </Button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      <div className="flex justify-end">
        <Button onClick={onAdd} className="gap-2">
          <Plus className="h-4 w-4" /> Add Coupon
        </Button>
      </div>
      <DataTable columns={columns} data={coupons} />
    </div>
  );
}