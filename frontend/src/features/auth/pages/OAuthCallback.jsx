import { useEffect } from "react";
import { Link, useNavigate, useSearchParams } from "react-router-dom";
import { toast } from "react-toastify";
import useAuth from "@/features/auth/hooks/useAuth";
import { getOAuthErrorMessage } from "@/features/auth/utils/googleOAuth";
import Button from "@/components/ui/Button";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

function OAuthCallback() {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const { user, isLoading } = useAuth();

  const status = searchParams.get("status");
  const code = searchParams.get("code");
  const isSuccess = status === "success";

  useEffect(() => {
    if (!isSuccess) {
      toast.error(getOAuthErrorMessage(code));
      return;
    }

    if (!isLoading && user) {
      toast.success("Login successful");
      navigate("/learning-dashboard", { replace: true });
    }
  }, [isSuccess, code, isLoading, user, navigate]);

  if (!isSuccess || (!isLoading && !user)) {
    const message = isSuccess
      ? "We couldn't complete sign-in. Please try again."
      : getOAuthErrorMessage(code);

    return (
      <div className="min-h-[70vh] flex items-center justify-center p-4">
        <div className="w-full max-w-md space-y-6 text-center">
          <ErrorMessage title="Sign-in failed" message={message} />
          <Button as={Link} to="/login" fullWidth>
            Back to login
          </Button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-[70vh] flex flex-col items-center justify-center gap-4 p-4">
      <SpinnerLoader size="lg" />
      <p className="text-foreground-muted text-sm">Signing you in…</p>
    </div>
  );
}

export default OAuthCallback;
