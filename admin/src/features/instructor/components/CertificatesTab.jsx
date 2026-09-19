import { useMemo, useState } from "react";
import { DataTable } from "@/components/common/DataTable";
import PaginatedTable from "@/components/common/PaginationTable";
import { StatusBadge } from "@/components/common/StatusBadge";
import { useInstructorCertificates } from "@/features/instructor/hooks";

const PAGE_SIZE = 10;

export function CertificatesTab({ courseId }) {
  const [page, setPage] = useState(1);
  const params = useMemo(() => ({ page, limit: PAGE_SIZE }), [page]);
  const { data, isPending } = useInstructorCertificates(courseId, params);

  const certificates = data?.data || [];
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
        key: "certificate_number",
        header: "Certificate",
        render: (row) => (
          <span className="text-sm text-muted-foreground">
            {row.certificate_number}
          </span>
        ),
      },
      {
        key: "confirm",
        header: "Confirmed",
        render: (row) => (
          <StatusBadge status={row.confirm ? "CONFIRMED" : "PENDING"} />
        ),
      },
      {
        key: "issued_at",
        header: "Issued",
        render: (row) => (
          <span className="text-sm text-muted-foreground">
            {new Date(row.issued_at).toLocaleDateString()}
          </span>
        ),
      },
    ],
    [],
  );

  return (
    <div className="space-y-4">
      <DataTable columns={columns} data={certificates} isLoading={isPending} />

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
