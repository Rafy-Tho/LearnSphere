import { Link } from "react-router-dom";
import { ChevronLeft, ChevronRight, Code } from "lucide-react";

function Logo() {
  return (
    <Link
      to="/"
      onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
      className="flex items-center gap-1 shrink-0 group"
    >
      <ChevronLeft className="text-primary text-xl transition-transform group-hover:-translate-x-0.5 hidden sm:block" />
      <div className="flex items-center gap-1.5 bg-primary px-2 sm:px-3 py-1.5 rounded-lg shadow-sm hover:shadow-md transition-shadow">
        <Code className="text-white text-lg" />
        <span className="font-bold text-white tracking-tight text-sm sm:text-base lg:text-lg">
          E-Learning
        </span>
      </div>
      <ChevronRight className="text-primary text-xl transition-transform group-hover:translate-x-0.5 hidden sm:block" />
    </Link>
  );
}

export default Logo;
