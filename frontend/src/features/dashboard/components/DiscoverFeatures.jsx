// src/components/DiscoverFeatures.tsx
import { Search, UserCheck, FlaskConical, Code2 } from "lucide-react";

const features = [
  {
    tag: "Mock Interview",
    icon: UserCheck,
    cls: "bg-warning/10 text-warning",
    text: "Practice technical interviews with guided scenarios and feedback.",
  },
  {
    tag: "Cloud Labs",
    icon: FlaskConical,
    cls: "bg-primary/10 text-primary",
    text: "Hands-on cloud environments to experiment safely at scale.",
  },
  {
    tag: "Projects",
    icon: Code2,
    cls: "bg-primary/10 text-primary",
    text: "Ship portfolio-ready projects with structured milestones.",
  },
];

export default function DiscoverFeatures() {
  return (
    <section>
      <h2 className="mb-6 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
          <Search className="size-4 text-primary" />
        </span>
        Discover More Features
      </h2>
      <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
        {features.map((f) => (
          <div
            key={f.tag}
            className="rounded-xl border border-border bg-surface p-6"
          >
            <span
              className={`inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-semibold ${f.cls}`}
            >
              <f.icon className="size-3.5" />
              {f.tag}
            </span>
            <p className="mt-4 text-sm text-foreground-muted">
              {f.text}
            </p>
          </div>
        ))}
      </div>
    </section>
  );
}
