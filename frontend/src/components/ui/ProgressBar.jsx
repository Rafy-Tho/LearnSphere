import cn from "@/utils/cn";

const colorClasses = {
  primary: "bg-primary",
  success: "bg-success",
  warning: "bg-warning",
  destructive: "bg-destructive",
  muted: "bg-foreground-muted",
};

const trackSizes = {
  sm: "h-1.5",
  md: "h-2",
  lg: "h-3",
};

function ProgressBar({
  value = 0,
  max = 100,
  color = "primary",
  size = "md",
  leftLabel,
  rightLabel,
  showValue = false,
  className = "",
  barClassName = "",
}) {
  const percent = max > 0 ? Math.min(100, Math.max(0, (value / max) * 100)) : 0;
  const hasLabels = leftLabel != null || rightLabel != null || showValue;

  return (
    <div className={className}>
      {hasLabels && (
        <div className="flex justify-between text-sm text-foreground-muted mb-2">
          <span>{leftLabel}</span>
          <span>{rightLabel ?? (showValue ? `${Math.round(percent)}%` : null)}</span>
        </div>
      )}
      <div
        className={cn(
          "w-full bg-surface-muted rounded-full overflow-hidden",
          trackSizes[size],
        )}
      >
        <div
          className={cn(
            "h-full rounded-full transition-[width] duration-300",
            colorClasses[color] || colorClasses.primary,
            barClassName,
          )}
          style={{ width: `${percent}%` }}
        />
      </div>
    </div>
  );
}

export default ProgressBar;
