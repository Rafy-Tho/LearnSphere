const sizeClasses = {
  sm: "w-4 h-4",
  md: "w-8 h-8",
  lg: "w-12 h-12",
  xl: "w-16 h-16",
};

const colorClasses = {
  primary: "border-primary",
  muted: "border-foreground-muted",
  white: "border-white",
};

const borderClasses = {
  sm: "border-2",
  md: "border-4",
  lg: "border-4",
  xl: "border-4",
};

const SpinnerLoader = ({ size = "md", color = "primary" }) => {
  return (
    <div className="flex items-center justify-center">
      <div
        className={`${sizeClasses[size]} ${colorClasses[color] || colorClasses.primary} ${borderClasses[size]} border-t-transparent rounded-full animate-spin`}
        role="status"
        aria-label="Loading"
      ></div>
    </div>
  );
};

export default SpinnerLoader;
