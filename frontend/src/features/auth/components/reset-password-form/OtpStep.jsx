import { zodResolver } from "@hookform/resolvers/zod";
import { useEffect, useRef, useState } from "react";
import { useForm } from "react-hook-form";
import { toast } from "react-toastify";
import { z } from "zod";
import { getResendTimer, getResendTimerRemaining, saveResendTimer } from "@/features/auth/utils/resendTimer";
import {
  useSendResetPasswordCode,
  useVerifyResetPasswordCode,
} from "@/features/auth/hooks/useAuthMutations";
import Button from "@/components/ui/Button";

const otpSchema = z.object({
  otp: z
    .string()
    .min(6, "OTP must be 6 digits")
    .max(6, "OTP must be 6 digits")
    .regex(/^\d+$/, "OTP must contain only numbers"),
});

const OtpStep = ({ email, onSuccess }) => {
  const [timer, setTimer] = useState(() => {
    const savedExpire = getResendTimer();
    if (!savedExpire) return 60;
    return Math.max(0, getResendTimerRemaining());
  });
  const [canResend, setCanResend] = useState(() => {
    const savedExpire = getResendTimer();
    return Boolean(savedExpire) && getResendTimerRemaining() <= 0;
  });

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: zodResolver(otpSchema),
  });
  const { verifyResetPasswordCode, isPending: isVerifying } =
    useVerifyResetPasswordCode();
  const { sendResetPasswordCode, isPending: isSending } =
    useSendResetPasswordCode();

  const intervalRef = useRef(null);

  const startTimer = () => {
    if (intervalRef.current) {
      clearInterval(intervalRef.current); // ✅ prevent duplicate
    }

    intervalRef.current = setInterval(() => {
      const remaining = getResendTimerRemaining();

      setTimer((prev) => (prev !== remaining ? remaining : prev));

      if (remaining <= 0) {
        clearInterval(intervalRef.current);
        intervalRef.current = null;
        setCanResend(true);
      }
    }, 1000);
  };
  const onSubmit = async (data) => {
    if (!email) {
      toast.error("Invalid request. Please try again.");
      return;
    }
    verifyResetPasswordCode(
      { email, code: data.otp },
      {
        onSuccess: () => {
          toast.success("OTP verified successfully");
          onSuccess(data.otp);
        },
        onError: (error) => {
          toast.error(error.message || "Failed to verify OTP");
        },
      },
    );
  };

  const handleResendOtp = async () => {
    if (!canResend) return;
    if (!email) {
      toast.error("Invalid request. Please try again.");
      return;
    }
    sendResetPasswordCode(
      { email },
      {
        onSuccess: () => {
          toast.success("OTP resent successfully");
          saveResendTimer();
          setTimer(60);
          setCanResend(false);
          startTimer();
        },
        onError: (error) => {
          toast.error(error.message || "Failed to resent OTP");
        },
      },
    );
  };

  useEffect(() => {
    const savedExpire = getResendTimer();

    if (!savedExpire) {
      saveResendTimer();
    }

    if (!savedExpire || getResendTimerRemaining() > 0) {
      startTimer();
    }

    return () => {
      if (intervalRef.current) {
        clearInterval(intervalRef.current);
      }
    };
  }, []);
  return (
    <>
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
              d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
            />
          </svg>
        </div>
        <h1 className="text-2xl font-bold text-foreground mb-2">Verify OTP</h1>
        <p className="text-sm text-foreground-muted">
          We've sent a 6-digit code to{" "}
          <span className="font-medium text-primary">{email}</span>
        </p>
      </div>

      <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
        <div>
          <label
            htmlFor="otp"
            className="block text-sm font-medium text-foreground mb-2"
          >
            Enter OTP
          </label>
          <input
            id="otp"
            type="text"
            maxLength={6}
            {...register("otp")}
            className={`w-full px-4 py-3 text-center text-lg tracking-widest bg-surface-muted border ${
              errors.otp ? "border-destructive" : "border-border"
            } rounded-lg text-foreground placeholder:text-foreground-muted focus:outline-none focus:ring-2 focus:ring-ring/50 transition-colors`}
            placeholder="000000"
            disabled={isVerifying}
          />
          {errors.otp && (
            <p className="mt-2 text-sm text-destructive">{errors.otp.message}</p>
          )}
        </div>

        <div className="text-center">
          <p className="text-sm text-foreground-muted">
            Didn't receive code?{" "}
            {canResend ? (
              <button
                type="button"
                onClick={handleResendOtp}
                disabled={isSending || !canResend}
                className="text-primary hover:underline font-medium cursor-pointer"
              >
                {isSending ? "Resending..." : "Resend"}
              </button>
            ) : (
              <span className="text-foreground-muted">Resend in {timer}s</span>
            )}
          </p>
        </div>

        <Button type="submit" size="lg" fullWidth isLoading={isVerifying}>
          {isVerifying ? "Verifying..." : "Verify OTP"}
        </Button>
      </form>
    </>
  );
};

export default OtpStep;
