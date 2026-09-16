import cn from "@/utils/cn";

function Skeleton({ variant = "block", className = "", ...props }) {
  const base = "animate-pulse rounded-md bg-surface-muted";

  if (variant === "text") {
    return <div className={cn(base, "h-4 w-full", className)} {...props} />;
  }

  if (variant === "circle") {
    return <div className={cn(base, "rounded-full", className)} {...props} />;
  }

  if (variant === "card") {
    return (
      <div
        className={cn(
          "rounded-xl border border-border bg-surface p-6",
          className,
        )}
        {...props}
      >
        <div className={cn(base, "h-40 w-full rounded-lg")} />
        <div className={cn(base, "mt-4 h-4 w-3/4")} />
        <div className={cn(base, "mt-2 h-4 w-1/2")} />
      </div>
    );
  }

  return <div className={cn(base, "h-10 w-full", className)} {...props} />;
}

export default Skeleton;
