import { ArrowLeft, Award, Download } from "lucide-react";
import { useParams, Link } from "react-router-dom";
import { useCertificateById } from "@/features/learning/hooks/useLearning";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Button from "@/components/ui/Button";

export default function CertificateView() {
  const { id } = useParams();
  const { data: certificate, isPending, error } = useCertificateById(id);

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  if (!certificate) return <ErrorMessage message="Certificate not found" />;

  const issuedDate = new Date(certificate.issued_at).toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });

  return (
    <div className="min-h-screen bg-background py-8 px-4">
      <div className="max-w-4xl mx-auto">
        <Link
          to="/learning-dashboard"
          className="inline-flex items-center gap-2 text-sm text-foreground-muted hover:text-foreground mb-6 transition-colors"
        >
          <ArrowLeft className="w-4 h-4" />
          Back to Dashboard
        </Link>

        <div className="bg-surface rounded-2xl shadow-lg overflow-hidden">
          <div className="bg-primary p-6 text-center sm:p-8">
            <Award className="mx-auto mb-4 h-14 w-14 text-warning sm:h-16 sm:w-16" />
            <h1 className="text-2xl font-bold text-white sm:text-3xl">
              Certificate of Completion
            </h1>
          </div>

          <div className="p-5 sm:p-12">
            <div className="rounded-xl border-2 border-primary/30 p-5 sm:p-12">
              <div className="text-center space-y-6">
                <p className="text-sm uppercase tracking-widest text-foreground-muted">
                  This certifies that
                </p>
                <h2 className="break-words text-3xl font-bold text-foreground sm:text-4xl">
                  {certificate.user_name}
                </h2>
                <p className="text-sm uppercase tracking-widest text-foreground-muted">
                  has successfully completed the course
                </p>
                <h3 className="break-words text-2xl font-semibold text-primary sm:text-3xl">
                  {certificate.course_name}
                </h3>
                <div className="w-24 h-0.5 bg-primary/30 mx-auto" />
                <p className="text-sm text-foreground-muted">
                  Issued on {issuedDate}
                </p>
                <div className="pt-4">
                  <p className="break-all font-mono text-xs text-foreground-muted">
                    Certificate ID: {certificate.certificate_number}
                  </p>
                </div>
              </div>
            </div>

            <div className="flex justify-center mt-8">
              <Button
                onClick={() => window.print()}
                variant="primary"
                leftIcon={<Download className="w-4 h-4" />}
                className="px-6"
              >
                Download Certificate
              </Button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
