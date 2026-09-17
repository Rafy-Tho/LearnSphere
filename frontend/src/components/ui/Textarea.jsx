import { forwardRef, useId } from "react";
import cn from "@/utils/cn";

const Textarea = forwardRef(function Textarea(
  {
    label,
    error,
    helperText,
    id,
    rows = 4,
    className = "",
    containerClassName = "",
    ...props
  },
  ref,
) {
  const autoId = useId();
  const textareaId = id || autoId;
  const messageId = `${textareaId}-message`;

  return (
    <div className={cn("flex flex-col gap-1.5", containerClassName)}>
      {label && (
        <label
          htmlFor={textareaId}
          className="text-sm font-medium text-foreground"
        >
          {label}
        </label>
      )}
      <textarea
        ref={ref}
        id={textareaId}
        rows={rows}
        aria-invalid={error ? true : undefined}
        aria-describedby={error || helperText ? messageId : undefined}
        className={cn(
          "w-full min-w-0 rounded-lg border bg-surface text-foreground placeholder:text-foreground-muted text-base px-4 py-2.5 focus:outline-none focus:ring-2 focus:border-transparent transition-colors disabled:opacity-50 disabled:cursor-not-allowed resize-y sm:text-sm",
          error
            ? "border-destructive focus:ring-destructive/50"
            : "border-border focus:ring-ring/50",
          className,
        )}
        {...props}
      />
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

export default Textarea;
