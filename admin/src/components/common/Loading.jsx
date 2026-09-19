import { Loader2 } from "lucide-react";

import { cn } from "@/lib/utils";

export function Loading({ className }) {
  return (
    <div
      className={cn("flex h-screen items-center justify-center", className)}
    >
      <Loader2 className="h-8 w-8 animate-spin text-primary" />
    </div>
  );
}
