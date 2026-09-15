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
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-900 dark:to-slate-800 flex items-center justify-center p-4">
      <div className="max-w-md w-full">
        {/* Progress Steps */}
        <ProgressStep currentStep={step} totalSteps={3} />

        {/* Card */}
        <div className="bg-white dark:bg-slate-800 rounded-2xl shadow-xl border border-slate-200 dark:border-slate-700 overflow-hidden">
          <div className="h-2 bg-gradient-to-r from-blue-600 to-blue-400"></div>

          <div className="p-8">
            {step > 1 && (
              <button
                onClick={() => setFlow((prev) => ({ ...prev, step: prev.step - 1 }))}
                className="mt-4 text-sm text-blue-500 hover:underline"
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
                className="inline-flex items-center gap-2 text-sm text-slate-600 dark:text-slate-400 hover:text-blue-600 dark:hover:text-blue-400 transition-colors"
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
