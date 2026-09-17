function BrandMark({ className = "", title, ...props }) {
  const a11y = title
    ? { role: "img", "aria-label": title }
    : { "aria-hidden": true };

  return (
    <svg
      viewBox="0 0 40 40"
      className={`text-primary ${className}`}
      {...a11y}
      {...props}
    >
      <rect width="40" height="40" rx="11" fill="currentColor" />
      {/* Graduation cap */}
      <path d="M20 5 31 11 20 17 9 11Z" fill="#fff" />
      <path
        d="M31 11v4.4"
        stroke="#fff"
        strokeWidth="1.6"
        strokeLinecap="round"
      />
      <circle cx="31" cy="16.7" r="1.4" fill="#fff" />
      {/* Play button */}
      <circle cx="20" cy="26" r="7.5" fill="#fff" />
      <path d="M17.6 22.2 17.6 29.8 24.4 26Z" fill="currentColor" />
    </svg>
  );
}

export default BrandMark;
