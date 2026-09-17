import cn from "@/utils/cn";

const sizeClasses = {
  sm: "w-4 h-4",
  md: "w-8 h-8",
  lg: "w-12 h-12",
  xl: "w-16 h-16",
};

const colorClasses = {
  primary: "text-primary",
  muted: "text-foreground-muted",
  white: "text-white",
  success: "text-success",
  destructive: "text-destructive",
};

const SpinnerLoader = ({
  size = "md",
  color = "primary",
  label,
  fullScreen = false,
  bare = false,
  className = "",
}) => {
  const spinner = (
    <svg
      className={cn(
        "animate-spin",
        sizeClasses[size] || sizeClasses.md,
        colorClasses[color] || colorClasses.primary,
      )}
      viewBox="0 0 24 24"
      fill="none"
      aria-hidden="true"
    >
      <circle
        cx="12"
        cy="12"
        r="10"
        stroke="currentColor"
        strokeWidth="3"
        className="opacity-20"
      />
      <circle
        cx="12"
        cy="12"
        r="10"
        stroke="currentColor"
        strokeWidth="3"
        strokeLinecap="round"
        strokeDasharray="62.832"
        strokeDashoffset="47.124"
      />
    </svg>
  );

  if (bare) return spinner;

  return (
    <span
      role="status"
      aria-live="polite"
      className={cn(
        "flex flex-col items-center justify-center gap-2 py-8",
        fullScreen && "min-h-screen w-full bg-background",
        className,
      )}
    >
      {spinner}
      {label ? (
        <span className="text-sm font-medium text-foreground-muted">
          {label}
        </span>
      ) : (
        <span className="sr-only">Loading…</span>
      )}
    </span>
  );
};

export default SpinnerLoader;
