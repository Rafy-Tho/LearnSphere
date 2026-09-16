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
        <div className="px-6 py-4 border-b border-border flex items-center justify-between gap-3">
          <div className="flex items-center gap-3">
            {icon && (
              <div className="w-8 h-8 rounded-lg bg-surface-muted flex items-center justify-center text-foreground-muted">
                {icon}
              </div>
            )}
            {title && (
              <h2 className="text-sm font-semibold text-foreground">{title}</h2>
            )}
          </div>
          {action}
        </div>
      )}
      <div className={cn("p-6", bodyClassName)}>{children}</div>
      {footer && <div className="px-6 py-4 border-t border-border">{footer}</div>}
    </div>
  );
}

export default Card;
