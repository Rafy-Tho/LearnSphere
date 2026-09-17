import cn from "@/utils/cn";

function SectionHeading({
  eyebrow,
  title,
  subtitle,
  align = "center",
  className = "",
}) {
  const isCentered = align === "center";

  return (
    <div
      className={cn(
        "max-w-3xl",
        isCentered ? "mx-auto text-center" : "text-left",
        className,
      )}
    >
      {eyebrow && (
        <span className="inline-flex items-center rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold uppercase tracking-wider text-primary">
          {eyebrow}
        </span>
      )}
      {title && (
        <h2 className="mt-4 text-2xl sm:text-3xl md:text-4xl font-bold tracking-tight text-foreground">
          {title}
        </h2>
      )}
      {subtitle && (
        <p
          className={cn(
            "mt-4 text-base leading-relaxed text-foreground-muted",
            isCentered && "mx-auto",
          )}
        >
          {subtitle}
        </p>
      )}
    </div>
  );
}

export default SectionHeading;
