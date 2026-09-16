import { Calendar, Camera, Check, Edit3, MapPin, User, X } from "lucide-react";
import { useEffect, useState } from "react";
import Avatar from "@/features/settings/components/Avatar";
import InputField from "@/features/settings/components/InputField";
import Textarea from "@/components/ui/Textarea";
function ProfileHeader({
  editMode,
  handleSaveProfile,
  handleCancelEdit,
  update,
  field,
  handleOpenEdit,
  isUpdatePending,
  errors,
}) {
  const [preview, setPreview] = useState(null);
  useEffect(() => {
    return () => {
      if (preview) URL.revokeObjectURL(preview);
    };
  }, [preview]);
  const handleFileChange = (e) => {
    const file = e.target.files[0];
    if (!file) return;
    update("image")(file);
    // preview
    setPreview(URL.createObjectURL(file));
  };
  return (
    <div className="bg-surface border border-border rounded-2xl shadow-sm overflow-hidden">
      <div className="h-24 relative bg-primary">
        <div
          className="absolute inset-0 opacity-20"
          style={{
            backgroundImage:
              "radial-gradient(circle, white 1px, transparent 1px)",
            backgroundSize: "24px 24px",
          }}
        />
      </div>

      <div className="px-6 pb-6">
        <div className="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4 -mt-10 mb-4">
          <div className="relative w-fit">
            <Avatar src={preview || field("image")} name={field("name")} />
            {editMode && (
              <label
                htmlFor="avatar"
                type="button"
                className="absolute bottom-0 right-0 w-7 h-7 rounded-full bg-primary text-white flex items-center justify-center shadow-md hover:scale-105 transition-transform cursor-pointer"
              >
                <Camera size={13} />
              </label>
            )}
            <input
              type="file"
              className="hidden"
              id="avatar"
              accept="image/*"
              onChange={handleFileChange}
            />
          </div>

          <div className="flex items-center gap-3 mt-2 sm:mt-0">
            {!editMode ? (
              <button
                onClick={handleOpenEdit}
                className="inline-flex items-center gap-2 text-xs font-medium px-4 py-2 rounded-lg bg-surface-muted text-foreground hover:bg-border border border-border transition-colors cursor-pointer"
              >
                <Edit3 size={13} /> Edit Profile
              </button>
            ) : (
              <div className="flex items-center gap-2">
                <button
                  onClick={handleCancelEdit}
                  className="inline-flex items-center gap-1.5 text-xs font-medium px-3 py-2 rounded-lg border border-border text-foreground-muted hover:bg-surface-muted transition-colors cursor-pointer"
                >
                  <X size={13} /> Cancel
                </button>
                {!isUpdatePending && (
                  <button
                    onClick={handleSaveProfile}
                    className="inline-flex items-center gap-1.5 text-xs font-medium px-3 py-2 rounded-lg bg-primary text-white hover:bg-primary-hover transition-colors shadow-sm cursor-pointer"
                  >
                    <Check size={13} /> Save Changes
                  </button>
                )}
                {isUpdatePending && (
                  <button
                    disabled={isUpdatePending}
                    className="inline-flex items-center gap-1.5 text-xs font-medium px-3 py-2 rounded-lg bg-primary text-white hover:bg-primary-hover transition-colors shadow-sm cursor-pointer"
                  >
                    saving...
                  </button>
                )}
              </div>
            )}
          </div>
        </div>

        {!editMode ? (
          <div>
            <h2 className="text-lg font-semibold text-foreground">
              {field("name")}
            </h2>
            <p className="text-sm text-foreground-muted mt-1">
              {field("bio")}
            </p>
            <div className="flex flex-wrap items-center gap-4 mt-3 text-xs text-foreground-muted">
              <span className="flex items-center gap-1.5">
                <MapPin size={12} />
                {field("location")}
              </span>
              <span className="flex items-center gap-1.5">
                <Calendar size={12} />
                Joined {new Date(field("joinDate")).toDateString()}
              </span>
            </div>
          </div>
        ) : (
          <div className="flex flex-col gap-3">
            <div>
              <InputField
                label="Display Name"
                icon={<User size={15} />}
                value={field("name")}
                onChange={update("name")}
                error={errors?.name}
              />
            </div>

            <div className="flex flex-col gap-1.5">
              <label className="text-xs font-medium text-foreground-muted uppercase tracking-wider">
                Bio
              </label>
              <Textarea
                value={field("bio")}
                onChange={(e) => update("bio")(e.target.value)}
                rows={2}
                className="resize-none"
              />
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

export default ProfileHeader;
