function getInitials(name) {
  return (name || "").trim().slice(0, 2).toUpperCase();
}

function UserAvatar({ src, name, alt, size, className = "" }) {
  const style = size
    ? { width: size, height: size, fontSize: size * 0.4 }
    : undefined;
  const label = alt ?? name ?? "User avatar";

  if (src) {
    return (
      <img
        src={src}
        alt={label}
        style={style}
        className={`object-cover ${className}`}
      />
    );
  }

  return (
    <span
      style={style}
      role="img"
      aria-label={label}
      className={`flex items-center justify-center bg-surface-muted font-semibold text-foreground-muted ${className}`}
    >
      {getInitials(name)}
    </span>
  );
}

export default UserAvatar;
