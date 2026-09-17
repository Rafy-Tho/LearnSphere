import cn from "@/utils/cn";

const variantClasses = {
  default: "bg-surface border-border",
  interactive:
    "bg-surface border-border transition-shadow hover:shadow-md hover:border-primary/40",
  highlighted: "bg-surface border-primary/60 ring-1 ring-primary/20",
};

function Card({
  title,
  icon,
  action,
  footer,
  variant = "default",
  children,
  className = "",
  bodyClassName = "",
}) {
  return (
    <div
      className={cn(
        "rounded-xl border shadow-sm overflow-hidden",
        variantClasses[variant] || variantClasses.default,
        className,
      )}
    >
      {(title || action) && (
        <div className="flex items-center justify-between gap-3 border-b border-border px-4 py-3.5 sm:px-6 sm:py-4">
          <div className="flex min-w-0 items-center gap-3">
            {icon && (
              <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-surface-muted text-foreground-muted">
                {icon}
              </div>
            )}
            {title && (
              <h2 className="min-w-0 truncate text-sm font-semibold text-foreground">
                {title}
              </h2>
            )}
          </div>
          {action}
        </div>
      )}
      <div className={cn("p-4 sm:p-6", bodyClassName)}>{children}</div>
      {footer && (
        <div className="border-t border-border px-4 py-3.5 sm:px-6 sm:py-4">
          {footer}
        </div>
      )}
    </div>
  );
}

export default Card;
