import { ClipboardCheck } from "lucide-react";
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

export function RefundRequestsTab({
  requests,
  filters,
  onFilterChange,
  page,
  totalPages,
  onPageChange,
  onReview,
}) {
  const columns = [
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
      key: "payment_amount",
      header: "Payment",
      render: (r) => (
        <span className="text-sm text-muted-foreground">
          ${Number(r.payment_amount).toFixed(2)} {r.payment_currency}
        </span>
      ),
    },
    {
      key: "requested_amount",
      header: "Requested",
      render: (r) => (
        <span className="text-sm font-semibold text-foreground">
          ${Number(r.requested_amount).toFixed(2)}
        </span>
      ),
    },
    {
      key: "refundable_amount",
      header: "Refundable",
      render: (r) => (
        <span className="text-sm text-muted-foreground">
          ${Number(r.refundable_amount ?? r.payment_amount).toFixed(2)}
        </span>
      ),
    },
    {
      key: "reason",
      header: "Reason",
      render: (r) => (
        <span className="text-sm text-muted-foreground">{r.reason}</span>
      ),
    },
    {
      key: "within_refund_window",
      header: "Window",
      render: (r) =>
        r.within_refund_window ? (
          <span className="text-xs font-medium text-success">Within window</span>
        ) : (
          <span className="text-xs font-medium text-destructive">
            Outside {r.refund_window_days ?? ""}d window
          </span>
        ),
    },
    {
      key: "requested_at",
      header: "Requested",
      render: (r) => (
        <span className="text-sm text-muted-foreground">
          {new Date(r.requested_at).toLocaleDateString()}
        </span>
      ),
    },
    {
      key: "status",
      header: "Status",
      render: (r) => <StatusBadge status={r.status} />,
    },
    {
      key: "actions",
      header: "Actions",
      render: (r) => (
        <Button
          variant="ghost"
          size="sm"
          className="gap-1"
          disabled={r.status !== "PENDING"}
          onClick={(e) => {
            e.stopPropagation();
            onReview(r);
          }}
        >
          <ClipboardCheck className="h-4 w-4" /> Review
        </Button>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap gap-3">
        <Input
          placeholder="Search user or email"
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
            <SelectItem value="APPROVED">Approved</SelectItem>
            <SelectItem value="REJECTED">Rejected</SelectItem>
            <SelectItem value="CANCELLED">Cancelled</SelectItem>
          </SelectContent>
        </Select>
      </div>
      <DataTable columns={columns} data={requests} />
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
