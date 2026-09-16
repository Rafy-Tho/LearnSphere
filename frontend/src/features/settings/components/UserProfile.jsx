import { useCallback, useMemo, useState } from "react";
import PersonalInfoSection from "@/features/settings/components/PersonalInfoSection";
import ProfileHeader from "@/features/settings/components/ProfileHeader";
import { useUserProfile as useGetUserProfile } from "@/features/settings/hooks/useUsers";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import { useUpdateUserProfile } from "@/features/settings/hooks/useUserMutations";
import { toast } from "react-toastify";

const defaultUser = {
  name: "",
  email: "",
  phone: "",
  location: "",
  bio: "",
  joinDate: "",
  image: "",
  dateBirth: "",
  gender: "",
};
const mapUser = (u) => ({
  name: u?.name ?? "",
  email: u?.email ?? "",
  phone: u?.phone ?? "",
  location: u?.location ?? "",
  bio: u?.bio ?? "",
  joinDate: u?.created_at ?? "",
  image: u?.image_url ?? "",
  dateBirth: u?.date_birth ?? "",
  gender: u?.gender ?? "",
});
function UserProfile() {
  const [editMode, setEditMode] = useState(false);
  const [draft, setDraft] = useState(null);
  const { data, isPending, error } = useGetUserProfile();
  const { mutateAsync: updateProfile, isPending: isUpdatePending } =
    useUpdateUserProfile();
  const [errors, setErrors] = useState({});

  const serverUser = useMemo(() => mapUser(data), [data]);

  const field = useCallback(
    (key) => (editMode && draft ? draft[key] : serverUser[key]),
    [editMode, draft, serverUser],
  );
  const update = useCallback(
    (key) => (v) =>
      setDraft((prev) => ({ ...(prev ?? defaultUser), [key]: v })),
    [],
  );

  const handleSaveProfile = async () => {
    if (!draft) return;
    setErrors({});
    const errors = {};
    const required = ["name", "email"];
    for (const key of required) {
      if (!draft[key] || draft[key] === "") {
        errors[key] = "This field is required";
      }
    }
    if (Object.keys(errors).length > 0) {
      setErrors(errors);
      return;
    }
    const formData = new FormData();
    Object.entries(draft).forEach(([key, value]) => {
      formData.append(key, value ?? "");
    });

    try {
      await updateProfile(formData);
      toast.success("Profile updated successfully");
      setDraft(null);
      setEditMode(false);
    } catch (error) {
      toast.error(error.message || "Failed to update profile");
    }
  };

  const handleCancelEdit = () => {
    setDraft(null);
    setEditMode(false);
  };
  const handleOpenEdit = () => {
    setDraft(serverUser);
    setEditMode(true);
  };
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  return (
    <>
      <ProfileHeader
        editMode={editMode}
        field={field}
        update={update}
        handleSaveProfile={handleSaveProfile}
        handleCancelEdit={handleCancelEdit}
        handleOpenEdit={handleOpenEdit}
        isUpdatePending={isUpdatePending}
        errors={errors}
      />
      <PersonalInfoSection
        field={field}
        update={update}
        editMode={editMode}
        errors={errors}
      />
    </>
  );
}

export default UserProfile;
