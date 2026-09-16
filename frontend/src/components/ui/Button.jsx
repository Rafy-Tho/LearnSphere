import cn from "@/utils/cn";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const variantClasses = {
  primary:
    "bg-primary text-white hover:bg-primary-hover focus-visible:ring-primary/50",
  secondary:
    "bg-surface-muted text-foreground hover:bg-border focus-visible:ring-ring/50",
  outline:
    "border border-border bg-surface text-foreground hover:bg-surface-muted focus-visible:ring-ring/50",
  ghost:
    "text-foreground hover:bg-surface-muted focus-visible:ring-ring/50",
  destructive:
    "bg-destructive text-white hover:opacity-90 focus-visible:ring-destructive/50",
  link: "text-primary underline-offset-4 hover:underline focus-visible:ring-ring/50",
};

const sizeClasses = {
  sm: "h-8 px-3 text-xs",
  md: "h-10 px-4 text-sm",
  lg: "h-12 px-6 text-base",
  icon: "h-10 w-10 p-0",
};

const solidVariants = ["primary", "destructive"];

function Button({
  children,
  variant = "primary",
  size = "md",
  type = "button",
  as,
  isLoading = false,
  disabled = false,
  fullWidth = false,
  leftIcon,
  rightIcon,
  className = "",
  ...props
}) {
  const Component = as || "button";
  const isNativeButton = Component === "button";
  const isDisabled = disabled || isLoading;
  const isLink = variant === "link";

  return (
    <Component
      {...(isNativeButton ? { type, disabled: isDisabled } : {})}
      {...(isDisabled && !isNativeButton ? { "aria-disabled": true } : {})}
      className={cn(
        "inline-flex items-center justify-center gap-2 rounded-lg font-medium whitespace-nowrap transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:pointer-events-none disabled:opacity-50 cursor-pointer",
        variantClasses[variant],
        isLink ? "p-0" : sizeClasses[size],
        fullWidth && "w-full",
        className,
      )}
      {...props}
    >
      {isLoading ? (
        <SpinnerLoader
          size="sm"
          color={solidVariants.includes(variant) ? "white" : "muted"}
        />
      ) : (
        leftIcon
      )}
      {children}
      {!isLoading && rightIcon}
    </Component>
  );
}

export default Button;
