import { useEffect, useId, useRef } from "react";
import { createPortal } from "react-dom";
import { X } from "lucide-react";
import cn from "@/utils/cn";

const sizeClasses = {
  sm: "max-w-sm",
  md: "max-w-lg",
  lg: "max-w-2xl",
  xl: "max-w-4xl",
};

const FOCUSABLE =
  'a[href], button:not([disabled]), textarea:not([disabled]), input:not([disabled]), select:not([disabled]), [tabindex]:not([tabindex="-1"])';

function Modal({
  open,
  onClose,
  title,
  children,
  footer,
  size = "md",
  closeOnOverlay = true,
  showClose = true,
  className = "",
  bodyClassName = "",
}) {
  const dialogRef = useRef(null);
  const titleId = useId();

  useEffect(() => {
    if (!open) return;
    const node = dialogRef.current;
    const previouslyFocused = document.activeElement;

    const getFocusable = () =>
      node ? Array.from(node.querySelectorAll(FOCUSABLE)) : [];

    const firstFocusable = getFocusable()[0];
    (firstFocusable || node)?.focus();

    function handleKeyDown(event) {
      if (event.key === "Escape") {
        event.stopPropagation();
        onClose?.();
        return;
      }
      if (event.key !== "Tab") return;

      const items = getFocusable();
      if (items.length === 0) {
        event.preventDefault();
        return;
      }
      const first = items[0];
      const last = items[items.length - 1];

      if (event.shiftKey && document.activeElement === first) {
        event.preventDefault();
        last.focus();
      } else if (!event.shiftKey && document.activeElement === last) {
        event.preventDefault();
        first.focus();
      }
    }

    document.addEventListener("keydown", handleKeyDown);
    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";

    return () => {
      document.removeEventListener("keydown", handleKeyDown);
      document.body.style.overflow = previousOverflow;
      if (previouslyFocused instanceof HTMLElement) previouslyFocused.focus();
    };
  }, [open, onClose]);

  if (!open) return null;

  return createPortal(
    <div
      className="animate-overlay-in fixed inset-0 z-[100] flex items-center justify-center bg-black/50 dark:bg-black/70 p-4"
      onMouseDown={(event) => {
        if (closeOnOverlay && event.target === event.currentTarget) onClose?.();
      }}
    >
      <div
        ref={dialogRef}
        role="dialog"
        aria-modal="true"
        aria-labelledby={title ? titleId : undefined}
        tabIndex={-1}
        className={cn(
          "animate-dialog-in bg-surface rounded-xl shadow-xl w-full max-h-[90vh] flex flex-col focus:outline-none",
          sizeClasses[size],
          className,
        )}
      >
        {(title || showClose) && (
          <div className="flex items-center justify-between gap-3 px-6 py-4 border-b border-border">
            {title && (
              <h2
                id={titleId}
                className="text-lg font-semibold text-foreground"
              >
                {title}
              </h2>
            )}
            {showClose && (
              <button
                type="button"
                onClick={onClose}
                aria-label="Close"
                className="text-foreground-muted hover:text-foreground transition-colors cursor-pointer"
              >
                <X size={22} />
              </button>
            )}
          </div>
        )}
        <div className={cn("p-6 overflow-y-auto", bodyClassName)}>{children}</div>
        {footer && (
          <div className="px-6 py-4 border-t border-border">{footer}</div>
        )}
      </div>
    </div>,
    document.body,
  );
}

export default Modal;
