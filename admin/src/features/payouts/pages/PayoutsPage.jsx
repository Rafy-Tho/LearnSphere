import { useCallback, useMemo, useState } from "react";
import { CheckCircle2, Plus } from "lucide-react";
import { DataTable } from "@/components/common/DataTable";
import { FormModal } from "@/components/common/FormModal";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Textarea } from "@/components/ui/textarea";
import {
  useAdminPayouts,
  useCreatePayout,
  usePayoutSettings,
  useUpdatePayout,
  useUpdateSettings,
} from "@/features/payouts/hooks";
import { useGetUsers } from "@/features/users/hooks";
import { toast } from "@/hooks/use-toast";

const emptyForm = {
  instructorId: "",
  amount: "",
  periodStart: "",
  periodEnd: "",
  note: "",
};

export default function PayoutsPage() {
  const { data: settings } = usePayoutSettings();
  const { updateSettings, isUpdating: isSavingSettings } = useUpdateSettings();
  const { data: payoutsData, isPending } = useAdminPayouts({ limit: 100 });
  const { createPayout, isCreating } = useCreatePayout();
  const { updatePayout, isUpdating } = useUpdatePayout();
  const { data: instructorsData } = useGetUsers({
    role: "INSTRUCTOR",
    limit: 100,
  });

  const [sharePercent, setSharePercent] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  const [form, setForm] = useState(emptyForm);

  const payouts = payoutsData?.data || [];
  const instructors = instructorsData?.data || [];
  const currentShare = settings?.revenueSharePercent;

  const handleSaveSettings = async () => {
    const value = Number(sharePercent);
    if (!Number.isFinite(value) || value < 0 || value > 100) {
      toast({
        title: "Invalid value",
        description: "Revenue share must be between 0 and 100.",
        variant: "destructive",
      });
      return;
    }
    try {
      await updateSettings({ revenueSharePercent: value });
      toast({ title: "Saved", description: "Revenue share updated." });
      setSharePercent("");
    } catch (error) {
      toast({
        title: "Error",
        description: error.message || "Failed to update settings",
        variant: "destructive",
      });
    }
  };

  const handleCreate = async () => {
    if (!form.instructorId || !form.amount) return;
    try {
      await createPayout({
        instructorId: form.instructorId,
        amount: Number(form.amount),
        periodStart: form.periodStart || undefined,
        periodEnd: form.periodEnd || undefined,
        note: form.note || undefined,
      });
      toast({ title: "Recorded", description: "Payout recorded." });
      setModalOpen(false);
      setForm(emptyForm);
    } catch (error) {
      toast({
        title: "Error",
        description: error.message || "Failed to record payout",
        variant: "destructive",
      });
    }
  };

  const handleMarkPaid = useCallback(
    async (payout) => {
      try {
        await updatePayout({ id: payout.id, data: { status: "PAID" } });
        toast({ title: "Updated", description: "Payout marked as paid." });
      } catch (error) {
        toast({
          title: "Error",
          description: error.message || "Failed to update payout",
          variant: "destructive",
        });
      }
    },
    [updatePayout],
  );

  const columns = useMemo(
    () => [
      {
        key: "instructor_name",
        header: "Instructor",
        render: (row) => (
          <div>
            <p className="font-medium text-foreground">
              {row.instructor_name}
            </p>
            <p className="text-xs text-muted-foreground">
              {row.instructor_email}
            </p>
          </div>
        ),
      },
      {
        key: "amount",
        header: "Amount",
        render: (row) => (
          <span className="font-medium text-foreground">
            {new Intl.NumberFormat("en-US", {
              style: "currency",
              currency: "USD",
            }).format(row.amount)}
          </span>
        ),
      },
      {
        key: "period",
        header: "Period",
        render: (row) =>
          row.period_start || row.period_end
            ? `${row.period_start || "—"} → ${row.period_end || "—"}`
            : "—",
      },
      {
        key: "status",
        header: "Status",
        render: (row) => <StatusBadge status={row.status} />,
      },
      {
        key: "actions",
        header: "Actions",
        render: (row) =>
          row.status === "PENDING" ? (
            <Button
              variant="ghost"
              size="sm"
              className="gap-1 text-success hover:text-success"
              disabled={isUpdating}
              onClick={(e) => {
                e.stopPropagation();
                handleMarkPaid(row);
              }}
            >
              <CheckCircle2 className="h-4 w-4" /> Mark paid
            </Button>
          ) : null,
      },
    ],
    [handleMarkPaid, isUpdating],
  );

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-foreground">Payouts</h1>
          <p className="text-muted-foreground mt-1">
            Instructor revenue share and payout records
          </p>
        </div>
        <Button
          className="gap-2"
          onClick={() => {
            setForm(emptyForm);
            setModalOpen(true);
          }}
        >
          <Plus className="h-4 w-4" /> Record Payout
        </Button>
      </div>

      <div className="glass-card rounded-xl p-6">
        <h2 className="font-semibold text-foreground">Revenue share</h2>
        <p className="text-sm text-muted-foreground mt-1">
          Current: {currentShare ?? "—"}%
        </p>
        <div className="mt-4 flex items-end gap-3">
          <div className="w-40">
            <label className="text-sm font-medium text-foreground">
              New percent
            </label>
            <Input
              type="number"
              min="0"
              max="100"
              value={sharePercent}
              onChange={(e) => setSharePercent(e.target.value)}
              placeholder={String(currentShare ?? "")}
              className="mt-1"
            />
          </div>
          <Button
            onClick={handleSaveSettings}
            disabled={sharePercent === "" || isSavingSettings}
          >
            Save
          </Button>
        </div>
      </div>

      <DataTable columns={columns} data={payouts} isLoading={isPending} />

      <FormModal
        open={modalOpen}
        onOpenChange={setModalOpen}
        title="Record Payout"
      >
        <div className="space-y-4">
          <div>
            <label className="text-sm font-medium text-foreground">
              Instructor
            </label>
            <Select
              value={form.instructorId}
              onValueChange={(v) => setForm((f) => ({ ...f, instructorId: v }))}
            >
              <SelectTrigger className="mt-1">
                <SelectValue placeholder="Select instructor" />
              </SelectTrigger>
              <SelectContent>
                {instructors.map((instructor) => (
                  <SelectItem key={instructor.id} value={instructor.id}>
                    {instructor.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">
              Amount (USD)
            </label>
            <Input
              type="number"
              min="0"
              value={form.amount}
              onChange={(e) => setForm((f) => ({ ...f, amount: e.target.value }))}
              className="mt-1"
            />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="text-sm font-medium text-foreground">
                Period start
              </label>
              <Input
                type="date"
                value={form.periodStart}
                onChange={(e) =>
                  setForm((f) => ({ ...f, periodStart: e.target.value }))
                }
                className="mt-1"
              />
            </div>
            <div>
              <label className="text-sm font-medium text-foreground">
                Period end
              </label>
              <Input
                type="date"
                value={form.periodEnd}
                onChange={(e) =>
                  setForm((f) => ({ ...f, periodEnd: e.target.value }))
                }
                className="mt-1"
              />
            </div>
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">Note</label>
            <Textarea
              value={form.note}
              onChange={(e) => setForm((f) => ({ ...f, note: e.target.value }))}
              className="mt-1"
            />
          </div>
          <div className="flex justify-end gap-3">
            <Button variant="outline" onClick={() => setModalOpen(false)}>
              Cancel
            </Button>
            <Button
              onClick={handleCreate}
              disabled={!form.instructorId || !form.amount || isCreating}
            >
              Record
            </Button>
          </div>
        </div>
      </FormModal>
    </div>
  );
}
