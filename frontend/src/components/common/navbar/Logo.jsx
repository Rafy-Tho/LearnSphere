import { Link } from "react-router-dom";
import BrandMark from "@/components/common/BrandMark";

function Logo() {
  return (
    <Link
      to="/"
      onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
      className="flex items-center gap-2 shrink-0 group"
      aria-label="LearnSphere home"
    >
      <BrandMark className="h-8 w-8 sm:h-9 sm:w-9 transition-transform duration-200 group-hover:scale-105" />
      <span className="text-base sm:text-lg font-bold tracking-tight text-foreground">
        Learn<span className="text-primary">Sphere</span>
      </span>
    </Link>
  );
}

export default Logo;
