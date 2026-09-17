import { Award, ExternalLink } from "lucide-react";
import { Link } from "react-router-dom";

function CertificateCard({ certificate }) {
  return (
    <Link
      to={`/certificates/${certificate.id}`}
      className="group flex flex-col gap-4 rounded-xl border border-border bg-surface p-5 transition-shadow hover:shadow-md"
    >
      <div className="flex items-center gap-3">
        <span className="flex size-11 shrink-0 items-center justify-center rounded-full bg-primary/10">
          <Award className="size-5 text-primary" />
        </span>
        <div className="min-w-0 flex-1">
          <p className="truncate text-sm font-semibold text-foreground">
            {certificate.course_name}
          </p>
          <p className="mt-0.5 text-xs text-foreground-muted">
            Issued {new Date(certificate.issued_at).toLocaleDateString()}
          </p>
        </div>
        <ExternalLink className="size-4 shrink-0 text-foreground-muted transition-colors group-hover:text-primary" />
      </div>
      <div className="rounded-lg border border-dashed border-border bg-surface-muted px-3 py-2">
        <p className="text-[11px] uppercase tracking-wide text-foreground-muted">
          Certificate ID
        </p>
        <p className="truncate font-mono text-xs text-foreground">
          {certificate.certificate_number}
        </p>
      </div>
    </Link>
  );
}

export default CertificateCard;
