import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { Link, useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import z from "zod";
import EmailInput from "@/features/auth/components/form/EmailInput";
import NameInput from "@/features/auth/components/form/NameInput";
import PasswordInput from "@/features/auth/components/form/PasswordInput";
import TermCheck from "@/features/auth/components/form/TermCheck";
import SocialButtons from "@/features/auth/components/SocialButtons";
import { useRegister } from "@/features/auth/hooks/useAuthMutations";
import { saveEmailVerificationFlow } from "@/features/auth/utils/emailVerificationFlow";
import Button from "@/components/ui/Button";

const SignupSchema = z.object({
  name: z.string().min(1, "Name is required"),
  email: z.string().email("Invalid email address"),
  password: z.string().min(8, "Password must be at least 8 characters long"),
  term: z.boolean().refine((value) => value === true, {
    message: "You must accept the terms and conditions",
  }),
});
const defaultValues = {
  name: "",
  email: "",
  password: "",
  term: false,
};
const Signup = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
  } = useForm({
    resolver: zodResolver(SignupSchema),
    defaultValues,
  });
  const navigate = useNavigate();
  const { registerUser, isPending } = useRegister();
  const onSubmit = async (formData) => {
    try {
      await registerUser(formData);

      saveEmailVerificationFlow(formData.email);
      toast.success("Check your email for the verification code");

      reset();

      navigate("/verify-email");
    } catch (err) {
      toast.error(err.message || "Register failed");
    }
  };
  return (
    <div className="flex min-h-[calc(100dvh-64px)] items-center justify-center bg-background p-4">
      <div className="bg-surface max-w-5xl w-full grid md:grid-cols-2 rounded-2xl shadow-xl border border-border overflow-hidden">
        {/* Left Side - Social Login Options */}
        <div className="flex flex-col justify-between p-6 sm:p-8 md:p-12">
          <div className="hidden md:block">
            <h2 className="text-foreground text-3xl font-bold mb-4">
              Instantly Register
            </h2>
            <p className="text-foreground-muted text-sm leading-relaxed mb-8">
              Choose your preferred method to login or create a new account in
              seconds.
            </p>
          </div>
          {/* Social Login Buttons */}
          <SocialButtons />
          <div className="hidden md:block mt-8">
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
        <div className="border-t border-border p-6 sm:p-8 md:border-l md:border-t-0 md:p-12">
          <div className="mb-8">
            <h1 className="text-3xl font-bold text-foreground">
              Create Account
            </h1>
            <p className="text-foreground-muted text-sm mt-2">
              Fill in your details to get started
            </p>
          </div>

          <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
            {/* Name Input */}
            <NameInput register={register} errors={errors} />
            {/* Email Input */}
            <EmailInput register={register} errors={errors} />
            {/* password Input */}
            <PasswordInput register={register} errors={errors} />
            {/* Terms Checkbox */}
            <TermCheck register={register} errors={errors} />
            {/* Submit Button */}
            <Button type="submit" size="lg" fullWidth isLoading={isPending}>
              {isPending ? "Registering..." : "Create Account"}
            </Button>

            {/* Login Link */}
            <p className="text-center text-sm text-foreground-muted">
              Already have an account?{" "}
              <Link
                to="/login"
                className="text-primary hover:underline font-medium cursor-pointer"
              >
                Sign in
              </Link>
            </p>
          </form>
        </div>
      </div>
    </div>
  );
};

export default Signup;
