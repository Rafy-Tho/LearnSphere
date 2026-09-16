import { useState } from "react";
import { Award, ExternalLink } from "lucide-react";
import { Link } from "react-router-dom";
import { useMyCertificates } from "@/features/learning/hooks/useLearning";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Button from "@/components/ui/Button";

export default function CertificationSection() {
  const { data: certificates, isPending, error } = useMyCertificates();
  const [showAll, setShowAll] = useState(false);

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  if (certificates && certificates.length > 0) {
    const visible = showAll ? certificates : certificates.slice(0, 6);
    return (
      <div className="my-8 md:my-16">
        <h2 className="mb-4 flex items-center gap-2 text-lg font-bold">
          <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
            <Award className="size-4 text-primary" />
          </span>
          My Certificates
        </h2>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {visible.map((cert) => (
            <Link
              key={cert.id}
              to={`/certificates/${cert.id}`}
              className="flex flex-col gap-3 rounded-xl border border-border bg-surface p-5 hover:shadow-md transition-shadow"
            >
              <div className="flex items-center gap-3">
                <div className="flex size-10 items-center justify-center rounded-full bg-primary/10">
                  <Award className="size-5 text-primary" />
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-foreground truncate">
                    {cert.course_name}
                  </p>
                  <p className="text-xs text-foreground-muted">
                    {new Date(cert.issued_at).toLocaleDateString()}
                  </p>
                </div>
                <ExternalLink className="size-4 text-foreground-muted shrink-0" />
              </div>
              <p className="text-xs text-foreground-muted font-mono truncate">
                {cert.certificate_number}
              </p>
              </Link>
            ))}
        </div>
        {!showAll && certificates.length > 6 && (
          <Button
            type="button"
            variant="outline"
            onClick={() => setShowAll(true)}
            className="mt-4"
          >
            Show all {certificates.length} certificates
          </Button>
        )}
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
