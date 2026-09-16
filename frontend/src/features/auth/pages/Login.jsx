import { Link, useNavigate } from "react-router-dom";
import SocialButtons from "@/features/auth/components/SocialButtons";
import { zodResolver } from "@hookform/resolvers/zod";
import z from "zod";
import { useForm } from "react-hook-form";
import EmailInput from "@/features/auth/components/form/EmailInput";
import PasswordInput from "@/features/auth/components/form/PasswordInput";
import TermCheck from "@/features/auth/components/form/TermCheck";
import { useLogin } from "@/features/auth/hooks/useAuthMutations";
import useAuthActions from "@/features/auth/hooks/useAuthActions";
import { saveEmailVerificationFlow } from "@/features/auth/utils/emailVerificationFlow";
import { toast } from "react-toastify";
import Button from "@/components/ui/Button";
const LoginSchema = z.object({
  email: z.string().email({ message: "Invalid email address" }),
  password: z
    .string()
    .min(6, { message: "Password must be at least 6 characters long" }),
  term: z.boolean().refine((value) => value === true, {
    message: "You must accept the terms and conditions",
  }),
});
const defaultValues = {
  email: "",
  password: "",
  term: false,
};
const Login = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
  } = useForm({
    resolver: zodResolver(LoginSchema),
    defaultValues,
  });
  const navigate = useNavigate();
  const { login, isPending } = useLogin();
  const { saveAuth } = useAuthActions();
  const onSubmit = async (formData) => {
    try {
      const res = await login(formData);

      if (res?.requiresEmailVerification) {
        saveEmailVerificationFlow(res.email || formData.email);
        toast.info("Please verify your email to continue");
        navigate("/verify-email");
        return;
      }

      toast.success("Login successful");

      saveAuth(res);
      reset();

      navigate("/");
    } catch (err) {
      toast.error(err.message || "Login failed");
    }
  };
  return (
    <div className="min-h-screen bg-background flex items-center justify-center p-4">
      <div className="bg-surface max-w-5xl w-full grid md:grid-cols-2 rounded-2xl shadow-xl border border-border overflow-hidden">
        {/* Left Side - Social Login Options */}
        <div className="p-8 md:p-12 flex flex-col justify-between">
          <div>
            <h2 className="text-foreground text-3xl font-bold mb-4">
              Instantly Login
            </h2>
            <p className="text-foreground-muted text-sm leading-relaxed mb-8">
              Choose your preferred method to login in seconds.
            </p>
          </div>

          {/* Social Login Buttons */}
          <SocialButtons />
          <div className="mt-8">
            <p className="text-foreground-muted text-xs leading-relaxed">
              By continuing, you agree to our{" "}
              <a
                href="#"
                className="text-foreground font-medium underline hover:text-primary"
              >
                Terms of Service
              </a>{" "}
              and{" "}
              <a
                href="#"
                className="text-foreground font-medium underline hover:text-primary"
              >
                Privacy Policy
              </a>
            </p>
          </div>
        </div>

        {/* Right Side - Registration Form */}
        <div className="p-8 md:p-12 border-t md:border-t-0 md:border-l border-border">
          <div className="mb-8">
            <h1 className="text-3xl font-bold text-foreground">Login</h1>
            <p className="text-foreground-muted text-sm mt-2">
              Fill in your details to get started
            </p>
          </div>

          <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
            {/* Email Input */}
            <EmailInput register={register} errors={errors} />
            {/* Password Input */}
            <PasswordInput register={register} errors={errors} />
            {/* Reset Password Link */}
            <Link
              to="/reset-password"
              className="text-right block text-sm text-primary hover:underline font-medium cursor-pointer"
            >
              Forgot password?
            </Link>
            {/* Terms Checkbox */}
            <TermCheck register={register} errors={errors} />
            {/* Submit Button */}
            <Button type="submit" size="lg" fullWidth isLoading={isPending}>
              {isPending ? "Logging in..." : "Login"}
            </Button>
            {/* Login Link */}
            <p className="text-center text-sm text-foreground-muted">
              Don't have an account?{" "}
              <Link
                to="/signup"
                className="text-primary hover:underline font-medium cursor-pointer"
              >
                Sign up
              </Link>
            </p>
          </form>
        </div>
      </div>
    </div>
  );
};

export default Login;
