import { useSearchParams } from "react-router-dom";
import { Award } from "lucide-react";
import { useMyCertificatesPage } from "@/features/learning/hooks/useLearning";
import CertificateCard from "@/features/learning/components/CertificateCard";
import Pagination from "@/components/common/Pagination";
import EmptyState from "@/components/ui/EmptyState";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const PAGE_SIZE = 9;

export default function CertificatesDashboard() {
  const [searchParams] = useSearchParams();
  const page = Math.max(1, Number(searchParams.get("page")) || 1);

  const { data, isPending, error } = useMyCertificatesPage({
    page,
    limit: PAGE_SIZE,
  });

  const certificates = data?.data ?? [];
  const pagination = data?.pagination ?? {};

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  return (
    <section>
      <h2 className="mb-6 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
          <Award className="size-4 text-primary" />
        </span>
        My Certificates
      </h2>

      {certificates.length === 0 ? (
        <EmptyState
          icon={<Award className="size-6" />}
          title="No certificates yet"
          description="Complete a course to earn your first certificate."
        />
      ) : (
        <>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {certificates.map((certificate) => (
              <CertificateCard
                key={certificate.id}
                certificate={certificate}
              />
            ))}
          </div>
          <Pagination
            totalItems={Number(pagination.totalItems) || 0}
            itemsPerPage={Number(pagination.limit) || PAGE_SIZE}
            siblingCount={1}
            showFirstLast={true}
            showPrevNext={true}
          />
        </>
      )}
    </section>
  );
}
