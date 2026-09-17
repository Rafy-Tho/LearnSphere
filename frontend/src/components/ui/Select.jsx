import { forwardRef, useId } from "react";
import { ChevronDown } from "lucide-react";
import cn from "@/utils/cn";

const Select = forwardRef(function Select(
  {
    label,
    error,
    helperText,
    id,
    children,
    className = "",
    containerClassName = "",
    ...props
  },
  ref,
) {
  const autoId = useId();
  const selectId = id || autoId;
  const messageId = `${selectId}-message`;

  return (
    <div className={cn("flex flex-col gap-1.5", containerClassName)}>
      {label && (
        <label htmlFor={selectId} className="text-sm font-medium text-foreground">
          {label}
        </label>
      )}
      <div className="relative">
        <select
          ref={ref}
          id={selectId}
          aria-invalid={error ? true : undefined}
          aria-describedby={error || helperText ? messageId : undefined}
          className={cn(
            "w-full min-w-0 appearance-none rounded-lg border bg-surface text-foreground text-base py-2.5 pl-4 pr-10 focus:outline-none focus:ring-2 focus:border-transparent transition-colors disabled:opacity-50 disabled:cursor-not-allowed cursor-pointer sm:text-sm",
            error
              ? "border-destructive focus:ring-destructive/50"
              : "border-border focus:ring-ring/50",
            className,
          )}
          {...props}
        >
          {children}
        </select>
        <ChevronDown
          size={18}
          aria-hidden="true"
          className="pointer-events-none absolute right-3 top-1/2 -translate-y-1/2 text-foreground-muted"
        />
      </div>
      {error ? (
        <p id={messageId} className="text-sm text-destructive">
          {error}
        </p>
      ) : (
        helperText && (
          <p id={messageId} className="text-xs text-foreground-muted">
            {helperText}
          </p>
        )
      )}
    </div>
  );
});

export default Select;
