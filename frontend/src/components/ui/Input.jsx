import { forwardRef, useId, useState } from "react";
import { Eye, EyeOff } from "lucide-react";
import cn from "@/utils/cn";

const Input = forwardRef(function Input(
  {
    label,
    icon,
    error,
    helperText,
    rightElement,
    type = "text",
    id,
    className = "",
    containerClassName = "",
    ...props
  },
  ref,
) {
  const autoId = useId();
  const inputId = id || autoId;
  const messageId = `${inputId}-message`;
  const [showPassword, setShowPassword] = useState(false);
  const isPassword = type === "password";
  const resolvedType = isPassword && showPassword ? "text" : type;

  const toggle = isPassword ? (
    <button
      type="button"
      onClick={() => setShowPassword((value) => !value)}
      aria-label={showPassword ? "Hide password" : "Show password"}
      className="text-foreground-muted hover:text-foreground transition-colors cursor-pointer"
    >
      {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
    </button>
  ) : (
    rightElement
  );

  return (
    <div className={cn("flex flex-col gap-1.5", containerClassName)}>
      {label && (
        <label
          htmlFor={inputId}
          className="text-sm font-medium text-foreground"
        >
          {label}
        </label>
      )}
      <div className="relative">
        {icon && (
          <div className="absolute left-3 top-1/2 -translate-y-1/2 text-foreground-muted pointer-events-none">
            {icon}
          </div>
        )}
        <input
          ref={ref}
          id={inputId}
          type={resolvedType}
          aria-invalid={error ? true : undefined}
          aria-describedby={error || helperText ? messageId : undefined}
          className={cn(
            "w-full min-w-0 rounded-lg border bg-surface text-foreground placeholder:text-foreground-muted text-base py-2.5 focus:outline-none focus:ring-2 focus:border-transparent transition-colors disabled:opacity-50 disabled:cursor-not-allowed sm:text-sm",
            icon ? "pl-10" : "pl-4",
            toggle ? "pr-10" : "pr-4",
            error
              ? "border-destructive focus:ring-destructive/50"
              : "border-border focus:ring-ring/50",
            className,
          )}
          {...props}
        />
        {toggle && (
          <div className="absolute right-3 top-1/2 -translate-y-1/2">
            {toggle}
          </div>
        )}
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

export default Input;
