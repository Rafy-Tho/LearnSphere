import { useMemo, useState } from "react";
import { Star } from "lucide-react";
import { DataTable } from "@/components/common/DataTable";
import PaginatedTable from "@/components/common/PaginationTable";
import { useInstructorReviews } from "@/features/instructor/hooks";

const PAGE_SIZE = 10;

export function ReviewsTab({ courseId }) {
  const [page, setPage] = useState(1);
  const params = useMemo(() => ({ page, limit: PAGE_SIZE }), [page]);
  const { data, isPending } = useInstructorReviews(courseId, params);

  const reviews = data?.data?.reviews || [];
  const summary = data?.data?.summary;
  const totalPages = data?.pagination?.totalPages || 1;

  const columns = useMemo(
    () => [
      {
        key: "user_name",
        header: "Student",
        render: (row) => (
          <div>
            <p className="font-medium text-foreground">{row.user_name}</p>
            <p className="text-xs text-muted-foreground">{row.user_email}</p>
          </div>
        ),
      },
      {
        key: "rating",
        header: "Rating",
        render: (row) => (
          <span className="inline-flex items-center gap-1 text-warning font-medium">
            <Star className="h-3.5 w-3.5 fill-current" /> {row.rating}
          </span>
        ),
      },
      {
        key: "review",
        header: "Review",
        render: (row) => (
          <p className="text-sm text-muted-foreground line-clamp-2 max-w-md">
            {row.review || "—"}
          </p>
        ),
      },
      {
        key: "created_at",
        header: "Date",
        render: (row) => (
          <span className="text-sm text-muted-foreground">
            {new Date(row.created_at).toLocaleDateString()}
          </span>
        ),
      },
    ],
    [],
  );

  return (
    <div className="space-y-4">
      {summary && (
        <div className="glass-card rounded-xl p-6 flex flex-col gap-6 sm:flex-row sm:items-center">
          <div className="text-center sm:text-left">
            <p className="text-4xl font-bold text-foreground">
              {summary.average || 0}
            </p>
            <p className="text-sm text-muted-foreground">
              {summary.total} review{summary.total === 1 ? "" : "s"}
            </p>
          </div>
          <div className="flex-1 space-y-1.5">
            {[5, 4, 3, 2, 1].map((star) => {
              const count = summary.ratings?.[star] || 0;
              const percent =
                summary.total > 0 ? (count * 100) / summary.total : 0;
              return (
                <div key={star} className="flex items-center gap-2 text-xs">
                  <span className="w-8 text-muted-foreground">{star}★</span>
                  <div className="h-1.5 flex-1 rounded-full bg-muted">
                    <div
                      className="h-1.5 rounded-full bg-warning"
                      style={{ width: `${percent}%` }}
                    />
                  </div>
                  <span className="w-8 text-right text-muted-foreground">
                    {count}
                  </span>
                </div>
              );
            })}
          </div>
        </div>
      )}

      <DataTable columns={columns} data={reviews} isLoading={isPending} />

      {totalPages > 1 && (
        <PaginatedTable
          totalPage={totalPages}
          currentPage={page}
          onPageChange={setPage}
        />
      )}
    </div>
  );
}
