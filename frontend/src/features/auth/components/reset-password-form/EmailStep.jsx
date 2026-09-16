import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { toast } from "react-toastify";
import { z } from "zod";
import { Mail } from "lucide-react";
import { resetResendTimer } from "@/features/auth/utils/resendTimer";
import { useSendResetPasswordCode } from "@/features/auth/hooks/useAuthMutations";
import Input from "@/components/ui/Input";
import Button from "@/components/ui/Button";

const emailSchema = z.object({
  email: z
    .string()
    .min(1, "Email is required")
    .email("Please enter a valid email address"),
});

const EmailStep = ({ onSuccess }) => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: zodResolver(emailSchema),
  });
  const { sendResetPasswordCode, isPending } = useSendResetPasswordCode();
  const onSubmit = async (data) => {
    sendResetPasswordCode(data, {
      onSuccess: () => {
        toast.success("OTP sent successfully");
        resetResendTimer();
        onSuccess(data.email);
      },
      onError: (error) => {
        toast.error(error.message || "Failed to send OTP");
      },
    });
  };

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
              d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
            />
          </svg>
        </div>
        <h1 className="text-2xl font-bold text-foreground mb-2">
          Forgot Password?
        </h1>
        <p className="text-sm text-foreground-muted">
          Enter your email to receive OTP verification
        </p>
      </div>

      <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
        <Input
          label="Email Address"
          type="email"
          placeholder="you@example.com"
          autoComplete="email"
          icon={<Mail size={18} />}
          error={errors.email?.message}
          {...register("email")}
        />

        <Button type="submit" size="lg" fullWidth isLoading={isPending}>
          {isPending ? "Sending OTP..." : "Send OTP"}
        </Button>
      </form>
    </>
  );
};

export default EmailStep;
