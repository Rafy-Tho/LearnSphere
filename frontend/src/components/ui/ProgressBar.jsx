import cn from "@/utils/cn";

const colorClasses = {
  blue: "bg-blue-600",
  green: "bg-green-600",
  violet: "bg-violet-600",
  indigo: "bg-indigo-600",
  red: "bg-red-600",
  amber: "bg-amber-500",
  slate: "bg-slate-400 dark:bg-slate-500",
};

const trackSizes = {
  sm: "h-1.5",
  md: "h-2",
  lg: "h-3",
};

function ProgressBar({
  value = 0,
  max = 100,
  color = "blue",
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
        <div className="flex justify-between text-sm text-slate-600 dark:text-slate-400 mb-2">
          <span>{leftLabel}</span>
          <span>{rightLabel ?? (showValue ? `${Math.round(percent)}%` : null)}</span>
        </div>
      )}
      <div
        className={cn(
          "w-full bg-slate-200 dark:bg-slate-700 rounded-full overflow-hidden",
          trackSizes[size],
        )}
      >
        <div
          className={cn(
            "h-full rounded-full transition-all duration-300",
            colorClasses[color],
            barClassName,
          )}
          style={{ width: `${percent}%` }}
        />
      </div>
    </div>
  );
}

export default ProgressBar;
