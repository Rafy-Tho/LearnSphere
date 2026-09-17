import {
  Ban,
  CheckCircle2,
  Clock,
  RotateCcw,
  XCircle,
} from "lucide-react";
import Badge from "@/components/ui/Badge";

const STATUS_CONFIG = {
  ACTIVE: { label: "Active", variant: "success", Icon: CheckCircle2 },
  PENDING: { label: "Pending", variant: "warning", Icon: Clock },
  COMPLETED: { label: "Paid", variant: "success", Icon: CheckCircle2 },
  PAID: { label: "Paid", variant: "success", Icon: CheckCircle2 },
  FAILED: { label: "Failed", variant: "destructive", Icon: XCircle },
  EXPIRED: { label: "Expired", variant: "neutral", Icon: Clock },
  CANCELLED: { label: "Cancelled", variant: "neutral", Icon: Ban },
  CANCELED: { label: "Cancelled", variant: "neutral", Icon: Ban },
  REFUNDED: { label: "Refunded", variant: "warning", Icon: RotateCcw },
  PARTIALLY_REFUNDED: {
    label: "Partially refunded",
    variant: "warning",
    Icon: RotateCcw,
  },
  SUCCEEDED: { label: "Succeeded", variant: "success", Icon: CheckCircle2 },
};

function BillingStatusBadge({ status, className = "" }) {
  const config = STATUS_CONFIG[status] || {
    label: status || "Unknown",
    variant: "neutral",
    Icon: Clock,
  };
  const { Icon } = config;

  return (
    <Badge variant={config.variant} className={className}>
      <Icon size={12} aria-hidden="true" />
      {config.label}
    </Badge>
  );
}

export default BillingStatusBadge;
