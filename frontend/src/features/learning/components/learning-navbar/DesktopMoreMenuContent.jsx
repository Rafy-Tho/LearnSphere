import { Award, Shield, TrendingUp } from "lucide-react";
import ThemeSelector from "@/components/common/ThemeSelector";

/**
 * Desktop more menu content
 */
function DesktopMoreMenuContent({ moreMenuId }) {
  return (
    <div
      id={moreMenuId}
      role="menu"
      aria-labelledby={`${moreMenuId}-trigger`}
      className="animate-dialog-in absolute right-0 top-full z-50 mt-2 min-w-[20rem] origin-top-right rounded-xl border border-border bg-surface p-1 shadow-xl"
    >
      <div className="border-b border-border px-2 pb-2 pt-1">
        <p className="text-[11px] font-semibold uppercase tracking-wide text-foreground-muted">
          Quick Actions
        </p>
      </div>

      <div className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted">
        <ThemeSelector />
      </div>

      <button className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted cursor-pointer">
        <TrendingUp className="h-4 w-4 text-success" />
        View Analytics
      </button>

      <button className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted cursor-pointer">
        <Shield className="h-4 w-4 text-primary" />
        Privacy Settings
      </button>

      <div className="border-t border-border px-2 pb-1 pt-2">
        <p className="text-[11px] font-semibold uppercase tracking-wide text-foreground-muted">
          Support
        </p>
      </div>

      <button className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted cursor-pointer">
        <Award className="h-4 w-4 text-warning" />
        Help &amp; Tutorials
      </button>
    </div>
  );
}

export default DesktopMoreMenuContent;
