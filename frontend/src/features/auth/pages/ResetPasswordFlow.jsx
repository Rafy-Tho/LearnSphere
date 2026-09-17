import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import EmailStep from "@/features/auth/components/reset-password-form/EmailStep";
import OtpStep from "@/features/auth/components/reset-password-form/OtpStep";
import ProgressStep from "@/features/auth/components/reset-password-form/ProgressStep";
import PasswordStep from "@/features/auth/components/reset-password-form/PasswordStep";
import {
  getResetPasswordFlow,
  saveResetPasswordFlow,
} from "@/features/auth/utils/resetPasswordFlow";

const ResetPasswordFlow = () => {
  const [flow, setFlow] = useState(() => {
    const saved = getResetPasswordFlow();
    return {
      step: saved?.step ?? 1,
      email: saved?.email ?? "",
      otp: saved?.otp ?? "",
    };
  });
  const { email, otp } = flow;
  const step =
    (flow.step === 2 && !email) || (flow.step === 3 && (!email || !otp))
      ? 1
      : flow.step;

  // ✅ Persist state
  useEffect(() => {
    saveResetPasswordFlow(step, email, otp);
  }, [step, email, otp]);

  const handleEmailSuccess = (value) => {
    setFlow({ step: 2, email: value.trim(), otp: "" });
  };

  const handleOtpSuccess = (value) => {
    setFlow((prev) => ({ ...prev, step: 3, otp: value }));
  };

  return (
    <div className="flex min-h-[calc(100dvh-64px)] items-center justify-center bg-background p-4">
      <div className="max-w-md w-full">
        {/* Progress Steps */}
        <ProgressStep currentStep={step} totalSteps={3} />

        {/* Card */}
        <div className="bg-surface rounded-2xl shadow-xl border border-border overflow-hidden">
          <div className="h-1 bg-primary"></div>

          <div className="p-5 sm:p-8">
            {step > 1 && (
              <button
                onClick={() => setFlow((prev) => ({ ...prev, step: prev.step - 1 }))}
                className="mt-4 text-sm text-primary hover:underline cursor-pointer"
              >
                ← Back
              </button>
            )}
            {/* Step 1: Email Form */}
            {step === 1 && <EmailStep onSuccess={handleEmailSuccess} />}

            {/* Step 2: OTP Form */}
            {step === 2 && email && (
              <OtpStep email={email} onSuccess={handleOtpSuccess} />
            )}

            {/* Step 3: Password Form */}
            {step === 3 && <PasswordStep email={email} otp={otp} />}
            {/* Back Button */}

            {/* Back to Login Link */}
            <div className="mt-6 text-center">
              <Link
                to="/login"
                className="inline-flex items-center gap-2 text-sm text-foreground-muted hover:text-primary transition-colors"
              >
                <svg
                  className="w-4 h-4"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M10 19l-7-7m0 0l7-7m-7 7h18"
                  />
                </svg>
                Back to Login
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ResetPasswordFlow;
