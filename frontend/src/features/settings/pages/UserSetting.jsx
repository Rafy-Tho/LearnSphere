import PasswordContainer from "@/features/settings/components/PasswordContainer";
import SubscriptionContainer from "@/features/settings/components/SubscriptionContainer";
import UserProfile from "@/features/settings/components/UserProfile";

export default function UserSetting() {
  return (
    <div>
      <div className="min-h-screen bg-background transition-colors duration-300">
        <div className="max-w-3xl mx-auto px-4 py-8 sm:py-12">
          {/* Page header */}
          <div className="flex items-center justify-between mb-8">
            <div>
              <h1 className="text-2xl font-bold text-foreground">
                Account Settings
              </h1>
              <p className="text-sm text-foreground-muted mt-0.5">
                Manage your profile and preferences
              </p>
            </div>
          </div>

          <div className="flex flex-col gap-5">
            {/* Profile */}

            <UserProfile />

            {/* Subscription */}
            <SubscriptionContainer />
            {/* Change Password */}
            <PasswordContainer />
          </div>
        </div>
      </div>
    </div>
  );
}
