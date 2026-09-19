import { useMemo } from "react";
import { DataTable } from "@/components/common/DataTable";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Input } from "@/components/ui/input";
import PaginatedTable from "@/components/common/PaginationTable";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

export function RefundsTab({
  refunds,
  isLoading,
  filters,
  onFilterChange,
  page,
  totalPages,
  onPageChange,
}) {
  const columns = useMemo(
    () => [
      {
        key: "user_name",
      header: "User",
      render: (r) => (
        <div>
          <p className="font-medium text-foreground">{r.user_name}</p>
          <p className="text-xs text-muted-foreground">{r.user_email}</p>
        </div>
      ),
    },
    {
      key: "plan_name",
      header: "Plan",
      render: (r) => (
        <span className="text-sm text-muted-foreground">{r.plan_name}</span>
      ),
    },
    {
      key: "amount",
      header: "Amount",
      render: (r) => (
        <span className="text-sm font-semibold text-foreground">
          ${Number(r.amount).toFixed(2)} {r.currency}
        </span>
      ),
    },
    {
      key: "refund_status",
      header: "Status",
      render: (r) => <StatusBadge status={r.refund_status} />,
    },
    {
      key: "reason",
      header: "Reason",
      render: (r) => (
        <span className="text-sm text-muted-foreground">{r.reason || "-"}</span>
      ),
    },
    {
      key: "stripe_refund_id",
      header: "Stripe refund",
      render: (r) => (
        <span className="font-mono text-xs text-muted-foreground">
          {r.stripe_refund_id || "-"}
        </span>
      ),
    },
    {
      key: "created_at",
      header: "Created",
      render: (r) => (
        <span className="text-sm text-muted-foreground">
          {new Date(r.created_at).toLocaleDateString()}
        </span>
      ),
    },
    ],
    [],
  );

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap gap-3">
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
          <SelectTrigger className="w-40">
            <SelectValue placeholder="Status" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="ALL">All statuses</SelectItem>
            <SelectItem value="PENDING">Pending</SelectItem>
            <SelectItem value="SUCCEEDED">Succeeded</SelectItem>
            <SelectItem value="FAILED">Failed</SelectItem>
          </SelectContent>
        </Select>
      </div>
      <DataTable columns={columns} data={refunds} isLoading={isLoading} />
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
