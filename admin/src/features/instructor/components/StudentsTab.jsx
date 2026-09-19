import { useMemo, useState } from "react";
import { DataTable } from "@/components/common/DataTable";
import PaginatedTable from "@/components/common/PaginationTable";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { useInstructorStudents } from "@/features/instructor/hooks";
import { useDebouncedValue } from "@/hooks/use-debounced-value";

const PAGE_SIZE = 10;

export function StudentsTab({ courseId }) {
  const [page, setPage] = useState(1);
  const [search, setSearch] = useState("");
  const [completion, setCompletion] = useState("ALL");
  const debouncedSearch = useDebouncedValue(search, 350);

  const params = useMemo(
    () => ({
      page,
      limit: PAGE_SIZE,
      ...(debouncedSearch ? { search: debouncedSearch } : {}),
      ...(completion !== "ALL" ? { completion } : {}),
    }),
    [page, debouncedSearch, completion],
  );

  const { data, isPending } = useInstructorStudents(courseId, params);
  const students = data?.data || [];
  const totalPages = data?.pagination?.totalPages || 1;

  const columns = useMemo(
    () => [
      {
        key: "name",
        header: "Student",
        render: (row) => (
          <div className="flex items-center gap-3">
            <div className="flex h-9 w-9 items-center justify-center rounded-full bg-primary/10 text-primary font-semibold text-sm">
              {(row.name || "?").charAt(0)}
            </div>
            <div>
              <p className="font-medium text-foreground">{row.name}</p>
              <p className="text-xs text-muted-foreground">{row.email}</p>
            </div>
          </div>
        ),
      },
      {
        key: "enrolled_at",
        header: "Enrolled",
        render: (row) => (
          <span className="text-sm text-muted-foreground">
            {new Date(row.enrolled_at).toLocaleDateString()}
          </span>
        ),
      },
      {
        key: "progress",
        header: "Progress",
        render: (row) => (
          <div className="min-w-[120px]">
            <div className="flex items-center justify-between text-xs text-muted-foreground">
              <span>
                {row.completed_lessons}/{row.total_lessons} lessons
              </span>
              <span>{row.progress_percentage}%</span>
            </div>
            <div className="mt-1 h-1.5 w-full rounded-full bg-muted">
              <div
                className="h-1.5 rounded-full bg-primary"
                style={{ width: `${row.progress_percentage}%` }}
              />
            </div>
          </div>
        ),
      },
      {
        key: "last_activity",
        header: "Last activity",
        render: (row) => (
          <span className="text-sm text-muted-foreground">
            {row.last_activity
              ? new Date(row.last_activity).toLocaleDateString()
              : "—"}
          </span>
        ),
      },
    ],
    [],
  );

  return (
    <div className="space-y-4">
      <div className="flex flex-col gap-3 sm:flex-row">
        <Input
          placeholder="Search by name or email"
          value={search}
          onChange={(e) => {
            setSearch(e.target.value);
            setPage(1);
          }}
          className="sm:max-w-xs"
        />
        <Select
          value={completion}
          onValueChange={(value) => {
            setCompletion(value);
            setPage(1);
          }}
        >
          <SelectTrigger className="sm:w-48">
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="ALL">All students</SelectItem>
            <SelectItem value="IN_PROGRESS">In progress</SelectItem>
            <SelectItem value="COMPLETED">Completed</SelectItem>
          </SelectContent>
        </Select>
      </div>

      <DataTable columns={columns} data={students} isLoading={isPending} />

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
