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

export function SubscriptionOverrideModal({
  open,
  onOpenChange,
  form,
  setForm,
  onSave,
  learners,
  plans,
  isSaving,
}) {
  return (
    <FormModal
      open={open}
      onOpenChange={onOpenChange}
      title="Override Subscription"
    >
      <div className="space-y-4">
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="text-sm font-medium text-foreground">User</label>
            <Select
              value={form.user_id}
              onValueChange={(v) => setForm((f) => ({ ...f, user_id: v }))}
            >
              <SelectTrigger className="mt-1">
                <SelectValue placeholder="Select user" />
              </SelectTrigger>
              <SelectContent>
                {learners.map((u) => (
                  <SelectItem key={u.id} value={u.id}>
                    {u.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">Plan</label>
            <Select
              value={form.plan_id}
              onValueChange={(v) => setForm((f) => ({ ...f, plan_id: v }))}
            >
              <SelectTrigger className="mt-1">
                <SelectValue placeholder="Select plan" />
              </SelectTrigger>
              <SelectContent>
                {plans.map((p) => (
                  <SelectItem key={p.id} value={p.id}>
                    {p.name} - ${p.price}
                  </SelectItem>
                ))}
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
              value={form.start_date}
              onChange={(e) =>
                setForm((f) => ({ ...f, start_date: e.target.value }))
              }
              className="mt-1"
            />
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">
              End Date
            </label>
            <Input
              type="date"
              value={form.end_date}
              onChange={(e) =>
                setForm((f) => ({ ...f, end_date: e.target.value }))
              }
              className="mt-1"
            />
          </div>
        </div>
        <div>
          <label className="text-sm font-medium text-foreground">
            Reason (required)
          </label>
          <Input
            value={form.reason}
            onChange={(e) =>
              setForm((f) => ({ ...f, reason: e.target.value }))
            }
            placeholder="e.g. Manual grant for support ticket"
            className="mt-1"
          />
        </div>
        <div className="flex justify-end gap-3 pt-2">
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          <Button onClick={onSave} disabled={isSaving}>
            Override
          </Button>
        </div>
      </div>
    </FormModal>
  );
}