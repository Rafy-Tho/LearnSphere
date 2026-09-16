import { AlertTriangle } from "lucide-react";
import Modal from "@/components/ui/Modal";
import Button from "@/components/ui/Button";

export default function ConfirmDialog({
  open,
  onCancel,
  onConfirm,
  title = "Are you sure?",
  message = "This action cannot be undone.",
  confirmText = "OK",
  cancelText = "Cancel",
  confirmVariant = "destructive",
}) {
  return (
    <Modal
      open={open}
      onClose={onCancel}
      size="sm"
      showClose={false}
      footer={
        <div className="flex justify-end gap-3">
          <Button variant="secondary" onClick={onCancel}>
            {cancelText}
          </Button>
          <Button variant={confirmVariant} onClick={onConfirm}>
            {confirmText}
          </Button>
        </div>
      }
    >
      <div className="flex items-start gap-3">
        <div className="flex-shrink-0 w-10 h-10 rounded-full bg-destructive/10 flex items-center justify-center">
          <AlertTriangle className="w-5 h-5 text-destructive" />
        </div>
        <div>
          <h3 className="text-lg font-semibold text-foreground">{title}</h3>
          <p className="mt-1 text-sm text-foreground-muted">{message}</p>
        </div>
      </div>
    </Modal>
  );
}
