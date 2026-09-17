import { useEffect, useRef, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import OtpInput from "@/features/auth/components/verify-email/OtpInput";
import {
  useResendVerificationCode,
  useVerifyEmail,
} from "@/features/auth/hooks/useAuthMutations";
import useAuthActions from "@/features/auth/hooks/useAuthActions";
import {
  getEmailVerificationFlow,
  getResendRemaining,
  removeEmailVerificationFlow,
  startResendCooldown,
} from "@/features/auth/utils/emailVerificationFlow";
import Button from "@/components/ui/Button";

const VerifyEmail = () => {
  const navigate = useNavigate();
  const { saveAuth } = useAuthActions();
  const { verifyEmail, isPending: isVerifying } = useVerifyEmail();
  const { resendVerificationCode, isPending: isResending } =
    useResendVerificationCode();

  const [email] = useState(() => getEmailVerificationFlow()?.email ?? "");
  const [code, setCode] = useState("");
  const [error, setError] = useState("");
  const [timer, setTimer] = useState(() => getResendRemaining());

  const intervalRef = useRef(null);

  useEffect(() => {
    if (!email) {
      navigate("/login", { replace: true });
    }
  }, [email, navigate]);

  useEffect(() => {
    if (timer <= 0) return undefined;

    intervalRef.current = setInterval(() => {
      setTimer((prev) => Math.max(0, prev - 1));
    }, 1000);

    return () => clearInterval(intervalRef.current);
  }, [timer]);

  const onSubmit = async (event) => {
    event.preventDefault();
    setError("");

    if (code.length !== 6) {
      setError("Please enter the 6-digit code");
      return;
    }

    try {
      const user = await verifyEmail({ code });

      removeEmailVerificationFlow();
      saveAuth(user);
      toast.success("Email verified successfully");
      navigate("/learning-dashboard", { replace: true });
    } catch (err) {
      const message = err.message || "Failed to verify email";
      setError(message);
      toast.error(message);
    }
  };

  const handleResend = async () => {
    if (timer > 0 || isResending) return;

    try {
      await resendVerificationCode();
      startResendCooldown();
      setTimer(60);
      setCode("");
      setError("");
      toast.success("A new verification code has been sent");
    } catch (err) {
      toast.error(err.message || "Failed to resend code");
    }
  };

  return (
    <div className="flex min-h-[calc(100dvh-64px)] items-center justify-center bg-background p-4">
      <div className="max-w-md w-full bg-surface rounded-2xl shadow-xl border border-border overflow-hidden">
        <div className="h-1 bg-primary"></div>
        <div className="p-5 sm:p-8">
          <div className="text-center mb-6">
            <div className="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-4">
              <svg
                className="w-8 h-8 text-primary"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                />
              </svg>
            </div>
            <h1 className="text-2xl font-bold text-foreground mb-2">
              Verify your email
            </h1>
            <p className="text-sm text-foreground-muted">
              We've sent a 6-digit code to{" "}
              <span className="font-medium text-primary">{email}</span>
            </p>
          </div>

          <form onSubmit={onSubmit} className="space-y-6">
            <OtpInput
              value={code}
              onChange={setCode}
              disabled={isVerifying}
              hasError={Boolean(error)}
            />

            {error && (
              <p className="text-center text-sm text-destructive">{error}</p>
            )}

            <Button
              type="submit"
              size="lg"
              fullWidth
              isLoading={isVerifying}
              disabled={code.length !== 6}
            >
              {isVerifying ? "Verifying..." : "Verify email"}
            </Button>
          </form>

          <div className="mt-6 text-center">
            <p className="text-sm text-foreground-muted">
              Didn't receive the code?{" "}
              {timer > 0 ? (
                <span>Resend in {timer}s</span>
              ) : (
                <button
                  type="button"
                  onClick={handleResend}
                  disabled={isResending}
                  className="text-primary hover:underline font-medium cursor-pointer"
                >
                  {isResending ? "Sending..." : "Resend code"}
                </button>
              )}
            </p>
          </div>

          <div className="mt-6 text-center">
            <Link
              to="/login"
              className="text-sm text-foreground-muted hover:text-primary transition-colors"
            >
              Back to Login
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
};

export default VerifyEmail;
