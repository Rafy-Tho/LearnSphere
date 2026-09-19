import { useMemo } from "react";
import { Eye, Repeat } from "lucide-react";
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

export function SubscriptionsTab({
  subscriptions,
  isLoading,
  filters,
  onFilterChange,
  plans,
  page,
  totalPages,
  onPageChange,
  onOverride,
  onView,
}) {
  const columns = useMemo(
    () => [
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
      key: "source",
      header: "Source",
      render: (s) => <StatusBadge status={s.source || "PAID"} />,
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
    {
      key: "actions",
      header: "Actions",
      render: (s) => (
        <Button
          variant="ghost"
          size="sm"
          className="gap-1"
          onClick={(e) => {
            e.stopPropagation();
            onView(s.id);
          }}
        >
          <Eye className="h-4 w-4" /> View
        </Button>
      ),
    },
    ],
    [onView],
  );

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
          <SelectTrigger className="w-40">
            <SelectValue placeholder="Status" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="ALL">All statuses</SelectItem>
            <SelectItem value="ACTIVE">Active</SelectItem>
            <SelectItem value="EXPIRED">Expired</SelectItem>
            <SelectItem value="CANCELLED">Cancelled</SelectItem>
            <SelectItem value="PENDING">Pending</SelectItem>
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
        <div className="ml-auto">
          <Button onClick={onOverride} className="gap-2">
            <Repeat className="h-4 w-4" /> Override Subscription
          </Button>
        </div>
      </div>
      <DataTable columns={columns} data={subscriptions} isLoading={isLoading} />
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
