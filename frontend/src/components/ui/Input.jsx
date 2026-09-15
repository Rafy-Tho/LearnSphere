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
  const [showPassword, setShowPassword] = useState(false);
  const isPassword = type === "password";
  const resolvedType = isPassword && showPassword ? "text" : type;

  const toggle = isPassword ? (
    <button
      type="button"
      onClick={() => setShowPassword((value) => !value)}
      aria-label={showPassword ? "Hide password" : "Show password"}
      className="text-slate-400 dark:text-slate-500 hover:text-slate-600 dark:hover:text-slate-300 transition-colors cursor-pointer"
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
          className="text-xs font-medium text-slate-500 dark:text-slate-400 uppercase tracking-wider"
        >
          {label}
        </label>
      )}
      <div className="relative">
        {icon && (
          <div className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 dark:text-slate-500 pointer-events-none">
            {icon}
          </div>
        )}
        <input
          ref={ref}
          id={inputId}
          type={resolvedType}
          className={cn(
            "w-full rounded-lg border bg-white dark:bg-slate-800/60 text-slate-800 dark:text-slate-100 placeholder-slate-400 dark:placeholder-slate-600 text-sm py-2.5 focus:outline-none focus:ring-2 focus:border-transparent transition-all disabled:opacity-50 disabled:cursor-not-allowed",
            icon ? "pl-10" : "pl-4",
            toggle ? "pr-10" : "pr-4",
            error
              ? "border-red-400 dark:border-red-500 focus:ring-red-400"
              : "border-slate-200 dark:border-slate-700 focus:ring-slate-400 dark:focus:ring-slate-500",
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
        <p className="text-sm text-red-500 dark:text-red-400">{error}</p>
      ) : (
        helperText && (
          <p className="text-xs text-slate-400 dark:text-slate-500">
            {helperText}
          </p>
        )
      )}
    </div>
  );
});

export default Input;
