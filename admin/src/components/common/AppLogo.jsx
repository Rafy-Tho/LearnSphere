export function AppLogo({ className }) {
  return (
    <svg
      viewBox="0 0 24 24"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      aria-hidden="true"
      focusable="false"
    >
      <path d="M12 3.25 21.5 8 12 12.75 2.5 8 12 3.25Z" fill="currentColor" />
      <path
        d="M6.25 10.6v3.9c0 1.66 2.57 3 5.75 3s5.75-1.34 5.75-3v-3.9"
        stroke="currentColor"
        strokeWidth="1.8"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <path
        d="M21.5 8v4.2"
        stroke="currentColor"
        strokeWidth="1.8"
        strokeLinecap="round"
      />
      <circle cx="21.5" cy="13.6" r="1.4" fill="currentColor" />
    </svg>
  );
}
