import { FormModal } from "@/components/common/FormModal";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

export function CouponModal({
  open,
  onOpenChange,
  editing,
  form,
  setForm,
  onSave,
}) {
  return (
    <FormModal
      open={open}
      onOpenChange={onOpenChange}
      title={editing ? "Edit Coupon" : "Add Coupon"}
    >
      <div className="space-y-4">
        <div>
          <label className="text-sm font-medium text-foreground">Code</label>
          <Input
            value={form.code}
            onChange={(e) =>
              setForm((f) => ({ ...f, code: e.target.value.toUpperCase() }))
            }
            placeholder="e.g. SAVE20"
            className="mt-1"
          />
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="text-sm font-medium text-foreground">
              Discount Type
            </label>
            <Select
              value={form.discount_type}
              onValueChange={(v) =>
                setForm((f) => ({ ...f, discount_type: v }))
              }
            >
              <SelectTrigger className="mt-1">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="PERCENTAGE">Percentage</SelectItem>
                <SelectItem value="FIXED_AMOUNT">Fixed Amount</SelectItem>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">
              Discount Value
            </label>
            <Input
              type="number"
              step="0.01"
              value={form.discount_value}
              onChange={(e) =>
                setForm((f) => ({
                  ...f,
                  discount_value: parseFloat(e.target.value) || 0,
                }))
              }
              className="mt-1"
            />
          </div>
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="text-sm font-medium text-foreground">
              Max Redemptions
            </label>
            <Input
              type="number"
              value={form.max_redemptions}
              onChange={(e) =>
                setForm((f) => ({ ...f, max_redemptions: e.target.value }))
              }
              placeholder="Unlimited"
              className="mt-1"
            />
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">
              Active
            </label>
            <Select
              value={form.is_active ? "true" : "false"}
              onValueChange={(v) =>
                setForm((f) => ({ ...f, is_active: v === "true" }))
              }
            >
              <SelectTrigger className="mt-1">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="true">Yes</SelectItem>
                <SelectItem value="false">No</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="text-sm font-medium text-foreground">
              Start Date
            </label>
            <Input
              type="date"
              value={form.starts_at}
              onChange={(e) =>
                setForm((f) => ({ ...f, starts_at: e.target.value }))
              }
              className="mt-1"
            />
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">
              Expires
            </label>
            <Input
              type="date"
              value={form.expires_at}
              onChange={(e) =>
                setForm((f) => ({ ...f, expires_at: e.target.value }))
              }
              className="mt-1"
            />
          </div>
        </div>
        <div className="flex justify-end gap-3 pt-2">
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          <Button onClick={onSave}>{editing ? "Update" : "Create"}</Button>
        </div>
      </div>
    </FormModal>
  );
}