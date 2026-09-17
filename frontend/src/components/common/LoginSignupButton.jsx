import { Link, useLocation } from "react-router-dom";
import Button from "@/components/ui/Button";

function LoginSignupButton() {
  const location = useLocation();

  const isLoginActive = location.pathname === "/login";

  const scrollTop = () => window.scrollTo({ top: 0, behavior: "smooth" });

  return (
    <div className="flex items-center gap-3">
      <Button
        as={Link}
        to="/login"
        variant={isLoginActive ? "primary" : "outline"}
        size="md"
        onClick={scrollTop}
      >
        Login
      </Button>

      <Button
        as={Link}
        to="/signup"
        variant={isLoginActive ? "outline" : "primary"}
        size="md"
        className="hidden sm:inline-flex"
        onClick={scrollTop}
      >
        Sign up
      </Button>
    </div>
  );
}

export default LoginSignupButton;
