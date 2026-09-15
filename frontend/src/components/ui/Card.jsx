import cn from "@/utils/cn";

function Card({
  title,
  icon,
  action,
  children,
  className = "",
  bodyClassName = "",
}) {
  return (
    <div
      className={cn(
        "bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm overflow-hidden",
        className,
      )}
    >
      {(title || action) && (
        <div className="px-6 py-4 border-b border-slate-100 dark:border-slate-800 flex items-center justify-between gap-3">
          <div className="flex items-center gap-3">
            {icon && (
              <div className="w-8 h-8 rounded-lg bg-slate-100 dark:bg-slate-800 flex items-center justify-center text-slate-600 dark:text-slate-400">
                {icon}
              </div>
            )}
            {title && (
              <h2 className="text-sm font-semibold text-slate-800 dark:text-slate-100">
                {title}
              </h2>
            )}
          </div>
          {action}
        </div>
      )}
      <div className={cn("p-6", bodyClassName)}>{children}</div>
    </div>
  );
}

export default Card;
