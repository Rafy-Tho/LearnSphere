import { Award } from "lucide-react";
import { Link } from "react-router-dom";
import { useMyCertificates } from "@/features/learning/hooks/useLearning";
import CertificateCard from "@/features/learning/components/CertificateCard";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const PREVIEW_COUNT = 6;

export default function CertificationSection() {
  const { data: certificates, isPending, error } = useMyCertificates();

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  if (certificates && certificates.length > 0) {
    const visible = certificates.slice(0, PREVIEW_COUNT);
    return (
      <div className="my-8 md:my-16">
        <div className="mb-4 flex items-center justify-between gap-4">
          <h2 className="flex items-center gap-2 text-lg font-bold">
            <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
              <Award className="size-4 text-primary" />
            </span>
            My Certificates
          </h2>
          <Link
            to="/learning-dashboard/certificates"
            className="text-sm font-medium text-primary hover:text-primary-hover"
          >
            View All
          </Link>
        </div>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {visible.map((certificate) => (
            <CertificateCard key={certificate.id} certificate={certificate} />
          ))}
        </div>
      </div>
    );
  }

  return (
    <div className="my-8 md:my-16">
      <h2 className="mb-4 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
          <Award className="size-4 text-primary" />
        </span>
        Certification
      </h2>
      <div className="flex flex-col gap-6 rounded-xl border border-border bg-surface p-6 md:flex-row md:items-center">
        <div className="flex h-32 w-full shrink-0 items-center justify-center rounded-lg border-2 border-dashed border-primary/30 bg-surface-muted md:w-40">
          <Award className="size-10 text-primary" />
        </div>
        <div className="flex-1">
          <h3 className="text-lg font-bold">
            Your certificate is waiting. Don&apos;t delay!
          </h3>
          <p className="mt-1 text-sm text-foreground-muted">
            Complete a course to earn your first certificate.
          </p>
        </div>
        <Link
          to="/learning-dashboard/in-progress"
          className="shrink-0 rounded-lg border-2 border-primary px-4 py-2 font-medium text-primary text-center hover:bg-primary/10 transition-colors"
        >
          Explore
        </Link>
      </div>
    </div>
  );
}
