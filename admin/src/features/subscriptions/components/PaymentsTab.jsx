import { Eye, Undo2 } from "lucide-react";
import { DataTable } from "@/components/common/DataTable";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import PaginatedTable from "@/components/common/PaginationTable";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

export function PaymentsTab({
  payments,
  filters,
  onFilterChange,
  plans,
  page,
  totalPages,
  onPageChange,
  onRefund,
  onView,
}) {
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
      key: "refundable_amount",
      header: "Refundable",
      render: (p) => (
        <span className="text-sm text-muted-foreground">
          ${Number(p.refundable_amount ?? p.amount).toFixed(2)}
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
            onClick={(e) => {
              e.stopPropagation();
              onView(p.id);
            }}
          >
            <Eye className="h-4 w-4" /> View
          </Button>
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
      <div className="flex flex-wrap items-center gap-3">
        <Input
          placeholder="Search user, email, or plan"
          value={filters.search}
          onChange={(e) => onFilterChange({ search: e.target.value })}
          className="max-w-xs"
        />
        <Select
          value={filters.status || "ALL"}
          onValueChange={(v) =>
            onFilterChange({ status: v === "ALL" ? "" : v })
          }
        >
          <SelectTrigger className="w-44">
            <SelectValue placeholder="Status" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="ALL">All statuses</SelectItem>
            <SelectItem value="COMPLETED">Completed</SelectItem>
            <SelectItem value="PARTIALLY_REFUNDED">Partially refunded</SelectItem>
            <SelectItem value="REFUNDED">Refunded</SelectItem>
            <SelectItem value="PENDING">Pending</SelectItem>
            <SelectItem value="FAILED">Failed</SelectItem>
          </SelectContent>
        </Select>
        <Select
          value={filters.plan_id || "ALL"}
          onValueChange={(v) =>
            onFilterChange({ plan_id: v === "ALL" ? "" : v })
          }
        >
          <SelectTrigger className="w-44">
            <SelectValue placeholder="Plan" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="ALL">All plans</SelectItem>
            {plans.map((p) => (
              <SelectItem key={p.id} value={p.id}>
                {p.name}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
      <DataTable
        columns={columns}
        data={payments}
        onRowClick={(p) => onView(p.id)}
      />
      {totalPages > 1 && (
        <PaginatedTable
          totalPage={totalPages}
          currentPage={page}
          onPageChange={onPageChange}
        />
      )}
    </div>
  );
}
