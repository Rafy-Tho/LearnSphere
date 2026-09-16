import cn from "@/utils/cn";

function EmptyState({ icon, title, description, action, className = "" }) {
  return (
    <div
      className={cn(
        "flex flex-col items-center justify-center text-center py-12 px-6",
        className,
      )}
    >
      {icon && (
        <div className="w-14 h-14 rounded-full bg-surface-muted flex items-center justify-center text-foreground-muted mb-4">
          {icon}
        </div>
      )}
      {title && (
        <h3 className="text-base font-semibold text-foreground">{title}</h3>
      )}
      {description && (
        <p className="mt-1 text-sm text-foreground-muted max-w-sm">
          {description}
        </p>
      )}
      {action && <div className="mt-5">{action}</div>}
    </div>
  );
}

export default EmptyState;
