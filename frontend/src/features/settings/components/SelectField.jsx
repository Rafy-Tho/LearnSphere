function SelectField({
  label,
  icon,
  value,
  onChange,
  options,
  disabled = false,
}) {
  return (
    <div className="flex flex-col gap-1.5">
      <label className="text-[10px] font-semibold text-foreground-muted uppercase tracking-widest">
        {label}
      </label>
      <div className="relative">
        <div className="absolute left-3 top-1/2 -translate-y-1/2 text-foreground-muted pointer-events-none">
          {icon}
        </div>
        <select
          value={value ?? ""}
          onChange={onChange ? (e) => onChange(e.target.value) : undefined}
          disabled={disabled}
          className="w-full pl-10 pr-4 py-2.5 rounded-xl border border-border bg-surface text-foreground text-sm focus:outline-none focus:ring-2 focus:ring-ring/50 focus:border-transparent transition-colors cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed disabled:bg-surface-muted appearance-none"
        >
          <option value="">Select…</option>
          {options.map((o) => (
            <option key={o.value} value={o.value}>
              {o.label}
            </option>
          ))}
        </select>
      </div>
    </div>
  );
}

export default SelectField;
