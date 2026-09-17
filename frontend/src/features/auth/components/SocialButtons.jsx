import { socialLogins } from "@/constants/socialLogins";
import Button from "@/components/ui/Button";
import { startGoogleLogin } from "@/features/auth/utils/googleOAuth";

function SocialButtons() {
  return (
    <div className="space-y-4">
      {socialLogins.map((social) => {
        const Icon = social.icon;
        return (
          <Button
            key={social.name}
            variant="outline"
            fullWidth
            leftIcon={<Icon />}
            onClick={
              social.provider === "google" ? startGoogleLogin : undefined
            }
          >
            Continue with {social.name}
          </Button>
        );
      })}

      <div className="relative my-2 md:my-8">
        <div className="absolute inset-0 flex items-center">
          <div className="w-full border-t border-border"></div>
        </div>
        <div className="relative flex justify-center text-sm">
          <span className="px-4 bg-surface text-foreground-muted">
            Or continue with email
          </span>
        </div>
      </div>
    </div>
  );
}

export default SocialButtons;
