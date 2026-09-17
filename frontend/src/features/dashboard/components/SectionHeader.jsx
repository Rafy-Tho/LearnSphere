import cn from "@/utils/cn";

function SectionHeader({ icon, title, action, className = "" }) {
  return (
    <div
      className={cn(
        "mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between",
        className,
      )}
    >
      <h2 className="flex items-center gap-2 text-lg font-bold">
        {icon && (
          <span className="flex size-9 items-center justify-center rounded-full bg-primary/10 text-primary">
            {icon}
          </span>
        )}
        {title}
      </h2>
      {action}
    </div>
  );
}

export default SectionHeader;
