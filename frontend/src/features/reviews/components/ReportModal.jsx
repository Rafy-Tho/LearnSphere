import { useForm } from "react-hook-form";
import { useCreateReviewReport } from "@/features/reviews/hooks/useReviewMutations";
import z from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import { toast } from "react-toastify";
import useAuth from "@/features/auth/hooks/useAuth";
import { useNavigate } from "react-router-dom";
import Modal from "@/components/ui/Modal";
import Select from "@/components/ui/Select";
import Textarea from "@/components/ui/Textarea";
import Button from "@/components/ui/Button";

const ISSUE_TYPES = [
  "Inappropriate content",
  "Spam or promotional",
  "Offensive language",
  "False information",
  "Other",
];
const ReportSchema = z.object({
  reason: z.string().nonempty("Please select an issue type"),
  description: z.string().nonempty("Please enter details"),
});
const defaultValues = {
  reason: "",
  description: "",
};
export function ReportModal({ isOpen, onClose, reviewId }) {
  const { user } = useAuth();
  const navigate = useNavigate();
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
  } = useForm({
    resolver: zodResolver(ReportSchema),
    defaultValues,
  });
  const { mutate, isPending } = useCreateReviewReport();

  const onSubmit = (data) => {
    if (!user) {
      navigate("/login");
      window.scrollTo({ top: 0, behavior: "smooth" });
      return;
    }
    mutate(
      { reviewId, ...data },
      {
        onSuccess: () => {
          onClose();
          reset();
        },
        onError: (error) => {
          toast.error(error.message || "Failed to report abuse");
        },
      },
    );
  };
  if (!isOpen) return null;

  return (
    <Modal open={isOpen} onClose={onClose} title="Report abuse" size="lg">
      <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
        <div className="bg-primary/10 border border-primary/30 rounded-lg p-4">
          <p className="text-foreground text-sm leading-relaxed">
            Flagged content is reviewed by staff to determine whether it
            violates Terms of Service or Community Guidelines. If you have a
            question or technical issue, please contact our{" "}
            <a href="#" className="font-semibold hover:underline">
              Support team here
            </a>
            .
          </p>
        </div>

        <Select
          label="Issue type"
          name="reason"
          {...register("reason")}
          error={errors.reason?.message}
        >
          <option value="">Select an issue</option>
          {ISSUE_TYPES.map((type) => (
            <option key={type} value={type}>
              {type}
            </option>
          ))}
        </Select>

        <Textarea
          label="Issue details"
          name="description"
          {...register("description")}
          placeholder="Please provide specific details about why you're reporting this review..."
          className="resize-none min-h-[120px]"
          error={errors.description?.message}
        />

        <div className="flex gap-3 justify-end">
          <Button variant="ghost" onClick={onClose} disabled={isPending}>
            Cancel
          </Button>
          <Button type="submit" disabled={isPending}>
            {isPending ? "Submitting..." : "Submit"}
          </Button>
        </div>
      </form>
    </Modal>
  );
}
