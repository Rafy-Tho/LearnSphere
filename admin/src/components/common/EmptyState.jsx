import { Inbox } from "lucide-react";

import { cn } from "@/lib/utils";

export function EmptyState({
  icon: Icon = Inbox,
  title = "Nothing here yet",
  description,
  action,
  className,
}) {
  return (
    <div
      className={cn(
        "flex flex-col items-center justify-center gap-2 py-8 text-center",
        className,
      )}
    >
      {Icon ? <Icon className="h-8 w-8 text-muted-foreground" /> : null}
      {title ? (
        <p className="font-medium text-foreground">{title}</p>
      ) : null}
      {description ? (
        <p className="text-sm text-muted-foreground">{description}</p>
      ) : null}
      {action}
    </div>
  );
}
