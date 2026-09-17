import cn from "@/utils/cn";

const backgroundClasses = {
  background: "bg-background",
  muted: "bg-surface-muted",
  surface: "bg-surface",
};

function Section({
  id,
  background = "background",
  className = "",
  innerClassName = "",
  children,
}) {
  return (
    <section
      id={id}
      className={cn(
        "px-4 sm:px-6 lg:px-8 py-16 md:py-24",
        backgroundClasses[background] || backgroundClasses.background,
        className,
      )}
    >
      <div className={cn("max-w-7xl mx-auto", innerClassName)}>{children}</div>
    </section>
  );
}

export default Section;
