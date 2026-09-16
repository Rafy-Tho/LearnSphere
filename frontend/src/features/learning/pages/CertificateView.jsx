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
          <div className="bg-primary p-8 text-center">
            <Award className="w-16 h-16 text-warning mx-auto mb-4" />
            <h1 className="text-3xl font-bold text-white">Certificate of Completion</h1>
          </div>

          <div className="p-8 sm:p-12">
            <div className="border-2 border-primary/30 rounded-xl p-8 sm:p-12">
              <div className="text-center space-y-6">
                <p className="text-sm uppercase tracking-widest text-foreground-muted">
                  This certifies that
                </p>
                <h2 className="text-3xl sm:text-4xl font-bold text-foreground">
                  {certificate.user_name}
                </h2>
                <p className="text-sm uppercase tracking-widest text-foreground-muted">
                  has successfully completed the course
                </p>
                <h3 className="text-2xl sm:text-3xl font-semibold text-primary">
                  {certificate.course_name}
                </h3>
                <div className="w-24 h-0.5 bg-primary/30 mx-auto" />
                <p className="text-sm text-foreground-muted">
                  Issued on {issuedDate}
                </p>
                <div className="pt-4">
                  <p className="text-xs text-foreground-muted font-mono">
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
