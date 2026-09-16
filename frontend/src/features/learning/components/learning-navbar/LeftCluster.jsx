import { ChevronLeft, PanelLeft, PanelLeftClose } from "lucide-react";
import { Link } from "react-router-dom";

/**
 * Left side navigation cluster (shared across devices)
 */
function LeftCluster({ courseId, isSidebarOpen, setIsSidebarOpen }) {
  return (
    <div className="flex min-w-0 flex-1 flex-wrap items-center gap-1.5 sm:gap-2 md:gap-3">
      <Link
        to={`/courses/${courseId}`}
        type="button"
        className="group flex h-9 w-9 shrink-0 items-center justify-center rounded-lg text-foreground-muted transition-colors hover:bg-surface-muted hover:text-foreground active:scale-95"
        aria-label="Go back"
      >
        <ChevronLeft className="h-5 w-5 transition-transform duration-200 group-hover:-translate-x-0.5" />
      </Link>

      <Link
        to={`/`}
        className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary font-mono text-[10px] font-semibold leading-none text-white shadow-sm transition-transform duration-200 hover:scale-105"
        aria-hidden
      >
        <span className="select-none">&gt;_</span>
      </Link>

      <div
        className="hidden h-6 w-px shrink-0 bg-border sm:block"
        aria-hidden
      />

      <button
        onClick={() => setIsSidebarOpen(!isSidebarOpen)}
        type="button"
        className="group flex min-w-0 items-center gap-1.5 rounded-lg px-2 py-1.5 text-left text-sm font-medium text-foreground transition-colors hover:bg-surface-muted cursor-pointer"
      >
        {isSidebarOpen ? (
          <PanelLeftClose className="h-4 w-4 shrink-0 text-foreground-muted transition-transform duration-200 group-hover:-translate-x-0.5 group-hover:text-primary" />
        ) : (
          <PanelLeft className="h-4 w-4 shrink-0 text-foreground-muted transition-transform duration-200 group-hover:-translate-x-0.5 group-hover:text-primary" />
        )}
        <span className="truncate">Mini Map</span>
      </button>
    </div>
  );
}
export default LeftCluster;
