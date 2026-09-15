import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { useResetPassword } from "@/features/auth/hooks/useAuthMutations";
import { toast } from "react-toastify";
import { useNavigate } from "react-router-dom";
import { removeResetPasswordFlow } from "@/features/auth/ResetFlow";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Input from "@/components/ui/Input";

const passwordSchema = z
  .object({
    password: z
      .string()
      .min(8, "Password must be at least 8 characters")
      .regex(/[A-Z]/, "Password must contain at least one uppercase letter")
      .regex(/[a-z]/, "Password must contain at least one lowercase letter")
      .regex(/[0-9]/, "Password must contain at least one number")
      .regex(
        /[^A-Za-z0-9]/,
        "Password must contain at least one special character",
      ),
    confirmPassword: z.string().min(1, "Please confirm your password"),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "Passwords don't match",
    path: ["confirmPassword"],
  });

const PasswordStep = ({ email, otp }) => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: zodResolver(passwordSchema),
  });

  const { resetPassword, isPending } = useResetPassword();
  const navigate = useNavigate();

  const onSubmit = async (data) => {
    if (!email || !otp) {
      toast.error("Invalid request. Please try again.");
      return;
    }
    resetPassword(
      { email, code: otp, password: data.password },
      {
        onSuccess: () => {
          toast.success("Password reset successfully");
          removeResetPasswordFlow();
          navigate("/login");
        },
        onError: (error) => {
          toast.error(error.message || "Password reset failed");
        },
      },
    );
  };

  return (
    <>
      <div className="text-center mb-6">
        <div className="w-16 h-16 bg-blue-100 dark:bg-blue-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
          <svg
            className="w-8 h-8 text-blue-600 dark:text-blue-400"
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
        <h1 className="text-2xl font-bold text-slate-900 dark:text-white mb-2">
          Reset Password
        </h1>
        <p className="text-sm text-slate-600 dark:text-slate-400">
          Enter your new password
        </p>
      </div>

      <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
        <Input
          label="New Password"
          type="password"
          placeholder="••••••••"
          autoComplete="new-password"
          disabled={isPending}
          error={errors.password?.message}
          {...register("password")}
        />

        <Input
          label="Confirm Password"
          type="password"
          placeholder="••••••••"
          autoComplete="new-password"
          disabled={isPending}
          error={errors.confirmPassword?.message}
          {...register("confirmPassword")}
        />

        {/* Password Requirements Hint */}
        <div className="bg-blue-50 dark:bg-blue-900/20 rounded-lg p-3">
          <p className="text-xs text-slate-600 dark:text-slate-400 mb-1 font-medium">
            Password must contain:
          </p>
          <ul className="text-xs text-slate-500 dark:text-slate-500 space-y-1">
            <li className="flex items-center gap-2">
              <span className="w-1 h-1 bg-blue-500 rounded-full"></span>
              At least 8 characters
            </li>
            <li className="flex items-center gap-2">
              <span className="w-1 h-1 bg-blue-500 rounded-full"></span>
              One uppercase letter
            </li>
            <li className="flex items-center gap-2">
              <span className="w-1 h-1 bg-blue-500 rounded-full"></span>
              One lowercase letter
            </li>
            <li className="flex items-center gap-2">
              <span className="w-1 h-1 bg-blue-500 rounded-full"></span>
              One number
            </li>
            <li className="flex items-center gap-2">
              <span className="w-1 h-1 bg-blue-500 rounded-full"></span>
              One special character
            </li>
          </ul>
        </div>

        <button
          type="submit"
          disabled={isPending}
          className="w-full px-6 py-3 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-semibold rounded-lg transition-colors flex items-center justify-center gap-2 cursor-pointer"
        >
          {isPending ? (
            <>
              <SpinnerLoader size="sm" color="white" />
              <span>Resetting...</span>
            </>
          ) : (
            "Reset Password"
          )}
        </button>
      </form>
    </>
  );
};

export default PasswordStep;
