function SectionCard({ title, icon, children }) {
  return (
    <div className="bg-surface border border-border rounded-2xl shadow-sm overflow-hidden">
      <div className="px-6 py-4 border-b border-border flex items-center gap-3">
        <div className="w-8 h-8 rounded-lg bg-surface-muted flex items-center justify-center text-foreground-muted">
          {icon}
        </div>
        <h2 className="text-sm font-semibold text-foreground">
          {title}
        </h2>
      </div>
      <div className="p-6">{children}</div>
    </div>
  );
}
export default SectionCard;
