function Avatar({ src, name, size = 96 }) {
  const initials = name
    .split(" ")
    .map((n) => n[0])
    .join("")
    .toUpperCase()
    .slice(0, 2);
  return (
    <div
      style={{ width: size, height: size }}
      className="rounded-full bg-surface-muted flex items-center justify-center overflow-hidden border-4 border-surface shadow-md flex-shrink-0"
    >
      {src ? (
        <img src={src} alt={name} className="w-full h-full object-cover" />
      ) : (
        <span
          style={{ fontSize: size * 0.28 }}
          className="font-semibold text-foreground-muted"
        >
          {initials}
        </span>
      )}
    </div>
  );
}
export default Avatar;
