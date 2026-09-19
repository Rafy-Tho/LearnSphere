import { useMemo } from "react";
import { Info } from "lucide-react";
import { DataTable } from "@/components/common/DataTable";
import { ErrorState } from "@/components/common/ErrorState";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Alert, AlertDescription } from "@/components/ui/alert";
import { DashboardPageSkeleton } from "@/components/ui/skeleton";
import {
  useInstructorEarnings,
  useInstructorPayouts,
} from "@/features/instructor/hooks";

const currency = (value) =>
  new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  }).format(Number(value) || 0);

export default function InstructorEarningsPage() {
  const { data, isPending, error } = useInstructorEarnings();
  const { data: payoutsData, isPending: payoutsPending } =
    useInstructorPayouts();

  const courseColumns = useMemo(
    () => [
      {
        key: "name",
        header: "Course",
        render: (row) => (
          <span className="font-medium text-foreground">{row.name}</span>
        ),
      },
      {
        key: "status",
        header: "Status",
        render: (row) => <StatusBadge status={row.status} />,
      },
      {
        key: "attributedRevenue",
        header: "Attributed revenue",
        render: (row) => <span>{currency(row.attributedRevenue)}</span>,
      },
      {
        key: "estimatedEarnings",
        header: "Your share",
        render: (row) => (
          <span className="font-medium text-foreground">
            {currency(row.estimatedEarnings)}
          </span>
        ),
      },
    ],
    [],
  );

  const payoutColumns = useMemo(
    () => [
      {
        key: "created_at",
        header: "Recorded",
        render: (row) => (
          <span className="text-sm text-muted-foreground">
            {new Date(row.created_at).toLocaleDateString()}
          </span>
        ),
      },
      {
        key: "amount",
        header: "Amount",
        render: (row) => (
          <span className="font-medium text-foreground">
            {currency(row.amount)}
          </span>
        ),
      },
      {
        key: "period",
        header: "Period",
        render: (row) =>
          row.period_start || row.period_end
            ? `${row.period_start || "—"} → ${row.period_end || "—"}`
            : "—",
      },
      {
        key: "status",
        header: "Status",
        render: (row) => <StatusBadge status={row.status} />,
      },
      {
        key: "note",
        header: "Note",
        render: (row) => (
          <span className="text-sm text-muted-foreground">{row.note || "—"}</span>
        ),
      },
    ],
    [],
  );

  if (isPending) return <DashboardPageSkeleton />;
  if (error) return <ErrorState message={error.message} />;

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-bold text-foreground">Earnings</h1>
        <p className="text-muted-foreground mt-1">
          Estimated revenue share and payout history
        </p>
      </div>

      <Alert>
        <Info className="h-4 w-4" />
        <AlertDescription>
          Earnings are estimates based on platform subscription revenue
          attributed across enrolled courses, at a{" "}
          {data?.revenueSharePercent ?? 0}% revenue share. Actual payouts are
          recorded by the platform.
        </AlertDescription>
      </Alert>

      <div className="grid gap-4 md:grid-cols-3">
        <div className="glass-card rounded-xl p-6">
          <p className="text-sm font-medium text-muted-foreground">
            Attributed revenue
          </p>
          <p className="mt-2 text-3xl font-bold text-foreground">
            {currency(data?.attributedRevenue)}
          </p>
        </div>
        <div className="glass-card rounded-xl p-6">
          <p className="text-sm font-medium text-muted-foreground">
            Your estimated share
          </p>
          <p className="mt-2 text-3xl font-bold text-foreground">
            {currency(data?.estimatedEarnings)}
          </p>
        </div>
        <div className="glass-card rounded-xl p-6">
          <p className="text-sm font-medium text-muted-foreground">
            Revenue share
          </p>
          <p className="mt-2 text-3xl font-bold text-foreground">
            {data?.revenueSharePercent ?? 0}%
          </p>
        </div>
      </div>

      <div className="space-y-3">
        <h2 className="text-lg font-semibold text-foreground">By course</h2>
        <DataTable columns={courseColumns} data={data?.courses || []} />
      </div>

      <div className="space-y-3">
        <h2 className="text-lg font-semibold text-foreground">
          Payout history
        </h2>
        <DataTable
          columns={payoutColumns}
          data={payoutsData?.data || []}
          isLoading={payoutsPending}
        />
      </div>
    </div>
  );
}
