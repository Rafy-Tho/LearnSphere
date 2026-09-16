import {
  AlertTriangle,
  CheckCircle2,
  Info,
  X,
  XCircle,
} from "lucide-react";
import cn from "@/utils/cn";

const variantConfig = {
  info: {
    icon: Info,
    wrapper: "border-primary/30 bg-primary/5",
    iconClass: "text-primary",
  },
  success: {
    icon: CheckCircle2,
    wrapper: "border-success/30 bg-success/5",
    iconClass: "text-success",
  },
  warning: {
    icon: AlertTriangle,
    wrapper: "border-warning/30 bg-warning/5",
    iconClass: "text-warning",
  },
  error: {
    icon: XCircle,
    wrapper: "border-destructive/30 bg-destructive/5",
    iconClass: "text-destructive",
  },
};

function Alert({
  variant = "info",
  title,
  children,
  onClose,
  className = "",
}) {
  const config = variantConfig[variant] || variantConfig.info;
  const Icon = config.icon;

  return (
    <div
      role={variant === "error" ? "alert" : "status"}
      className={cn(
        "flex items-start gap-3 rounded-lg border p-4",
        config.wrapper,
        className,
      )}
    >
      <Icon
        size={20}
        aria-hidden="true"
        className={cn("mt-0.5 shrink-0", config.iconClass)}
      />
      <div className="flex-1">
        {title && (
          <h3 className="text-sm font-semibold text-foreground">{title}</h3>
        )}
        {children && (
          <div className={cn("text-sm text-foreground-muted", title && "mt-1")}>
            {children}
          </div>
        )}
      </div>
      {onClose && (
        <button
          type="button"
          onClick={onClose}
          aria-label="Dismiss"
          className="shrink-0 text-foreground-muted hover:text-foreground transition-colors cursor-pointer"
        >
          <X size={18} />
        </button>
      )}
    </div>
  );
}

export default Alert;
