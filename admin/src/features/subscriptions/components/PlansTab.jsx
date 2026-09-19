import { Pencil, Plus, Power, Trash2 } from "lucide-react";
import { DataTable } from "@/components/common/DataTable";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Button } from "@/components/ui/button";

export function PlansTab({ plans, onAdd, onEdit, onToggle, onDelete }) {
  const columns = [
    {
      key: "name",
      header: "Plan Name",
      render: (p) => (
        <span className="font-medium text-foreground">{p.name}</span>
      ),
    },
    {
      key: "duration_days",
      header: "Duration",
      render: (p) => (
        <span className="text-sm text-muted-foreground">
          {p.duration_days} days
        </span>
      ),
    },
    {
      key: "price",
      header: "Price",
      render: (p) => (
        <span className="text-sm font-semibold text-foreground">
          ${Number(p.price).toFixed(2)}
        </span>
      ),
    },
    {
      key: "usage",
      header: "Subscriptions",
      render: (p) => (
        <span className="text-sm text-muted-foreground">
          {p.active_subscription_count ?? 0} active / {p.subscription_count ?? 0}{" "}
          total
        </span>
      ),
    },
    {
      key: "is_active",
      header: "Status",
      render: (p) => (
        <StatusBadge status={p.is_active ? "ACTIVE" : "INACTIVE"} />
      ),
    },
    {
      key: "actions",
      header: "Actions",
      render: (p) => (
        <div className="flex gap-1">
          <Button
            variant="ghost"
            size="icon"
            onClick={(e) => {
              e.stopPropagation();
              onEdit(p);
            }}
          >
            <Pencil className="h-4 w-4" />
          </Button>
          <Button
            variant="ghost"
            size="icon"
            className={
              p.is_active
                ? "text-warning hover:text-warning"
                : "text-success hover:text-success"
            }
            title={p.is_active ? "Deactivate plan" : "Activate plan"}
            onClick={(e) => {
              e.stopPropagation();
              onToggle(p.id, p.is_active);
            }}
          >
            <Power className="h-4 w-4" />
          </Button>
          <Button
            variant="ghost"
            size="icon"
            className="text-destructive hover:text-destructive"
            onClick={(e) => {
              e.stopPropagation();
              onDelete(p.id);
            }}
          >
            <Trash2 className="h-4 w-4" />
          </Button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      <div className="flex justify-end">
        <Button onClick={onAdd} className="gap-2">
          <Plus className="h-4 w-4" /> Add Plan
        </Button>
      </div>
      <DataTable columns={columns} data={plans} />
    </div>
  );
}
