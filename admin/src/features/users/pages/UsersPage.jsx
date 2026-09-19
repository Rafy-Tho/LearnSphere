import { useCallback, useMemo, useState } from "react";
import { Plus, Pencil, Trash2, KeyRound } from "lucide-react";
import { DataTable } from "@/components/common/DataTable";
import { FormModal } from "@/components/common/FormModal";
import PaginatedTable from "@/components/common/PaginationTable";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  useGetUsers,
  useCreateUser,
  useUpdateUser,
  useDeleteUser,
  useSetUserPassword,
} from "@/features/users/hooks";
import { useToast } from "@/hooks/use-toast";

const PAGE_SIZE = 10;

const PASSWORD_PATTERN =
  /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,100}$/;

export default function UsersPage({ filterRole, title, subtitle }) {
  const { toast } = useToast();
  const [page, setPage] = useState(1);
  const { data, isPending } = useGetUsers({ role: filterRole, page, limit: PAGE_SIZE });
  const { createUser, isPending: isCreating } = useCreateUser();
  const { updateUser, isPending: isUpdating } = useUpdateUser();
  const { deleteUser, isPending: isDeleting } = useDeleteUser();
  const { setPassword, isPending: isSettingPassword } = useSetUserPassword();
  const users = data?.data || [];
  const totalPages = data?.pagination?.totalPages || 1;
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState(null);
  const [pendingDelete, setPendingDelete] = useState(null);
  const [passwordUser, setPasswordUser] = useState(null);
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [form, setForm] = useState({
    name: "",
    email: "",
    role: filterRole || "LEARNER",
    status: "ACTIVE",
    password: "",
  });

  const openCreate = useCallback(() => {
    setEditing(null);
    setForm({
      name: "",
      email: "",
      role: filterRole || "LEARNER",
      status: "ACTIVE",
      password: "",
    });
    setModalOpen(true);
  }, [filterRole]);

  const openEdit = useCallback((user) => {
    setEditing(user);
    setForm({
      name: user.name,
      email: user.email,
      role: user.role,
      status: user.status,
      password: "",
    });
    setModalOpen(true);
  }, []);

  const handleSave = async () => {
    if (!form.name || !form.email) return;
    if (!editing && form.password && !PASSWORD_PATTERN.test(form.password)) {
      toast({
        title: "Error!",
        description:
          "Password must be 8-100 characters with uppercase, lowercase, number and symbol.",
        variant: "destructive",
      });
      return;
    }
    try {
      if (editing) {
        await updateUser({ id: editing.id, data: form });
        toast({ title: "Success!", description: "User updated successfully." });
      } else {
        const payload = { ...form };
        if (!payload.password) delete payload.password;
        await createUser(payload);
        toast({ title: "Success!", description: "User created successfully." });
      }
      setModalOpen(false);
      setPage(1);
    } catch (error) {
      toast({
        title: "Error!",
        description: error.message || "Something went wrong.",
        variant: "destructive",
      });
    }
  };

  const openPasswordDialog = useCallback((user) => {
    setPasswordUser(user);
    setNewPassword("");
    setConfirmPassword("");
  }, []);

  const cancelPasswordDialog = useCallback(() => {
    setPasswordUser(null);
    setNewPassword("");
    setConfirmPassword("");
  }, []);

  const handleSetPassword = async () => {
    if (!PASSWORD_PATTERN.test(newPassword)) {
      toast({
        title: "Error!",
        description:
          "Password must be 8-100 characters with uppercase, lowercase, number and symbol.",
        variant: "destructive",
      });
      return;
    }
    if (newPassword !== confirmPassword) {
      toast({
        title: "Error!",
        description: "Passwords do not match.",
        variant: "destructive",
      });
      return;
    }
    try {
      await setPassword({
        id: passwordUser.id,
        data: { newPassword },
      });
      toast({
        title: "Success!",
        description: `Password updated for ${passwordUser.name}.`,
      });
      cancelPasswordDialog();
    } catch (error) {
      toast({
        title: "Error!",
        description: error.message || "Failed to update password.",
        variant: "destructive",
      });
    }
  };

  const handleDelete = useCallback(
    async (id) => {
      try {
        await deleteUser(id);
        toast({ title: "Success!", description: "User deleted successfully." });
        if (users.length === 1 && page > 1) setPage((p) => p - 1);
        setPendingDelete(null);
      } catch (error) {
        toast({
          title: "Error!",
          description: error.message || "Failed to delete user.",
          variant: "destructive",
        });
      }
    },
    [deleteUser, toast, users.length, page],
  );

  const openDeleteDialog = useCallback((user) => {
    setPendingDelete(user);
  }, []);

  const cancelDelete = useCallback(() => {
    setPendingDelete(null);
  }, []);

  const columns = useMemo(
    () => [
    {
      key: "name",
      header: "User",
      render: (u) => (
        <div className="flex items-center gap-3">
          <div className="flex h-9 w-9 items-center justify-center rounded-full bg-primary/10 text-primary font-semibold text-sm">
            {u.name.charAt(0)}
          </div>
          <div>
            <p className="font-medium text-foreground">{u.name}</p>
            <p className="text-xs text-muted-foreground">{u.email}</p>
          </div>
        </div>
      ),
    },
    ...(!filterRole
      ? [
          {
            key: "role",
            header: "Role",
            render: (u) => <StatusBadge status={u.role} />,
          },
        ]
      : []),
    {
      key: "status",
      header: "Status",
      render: (u) => <StatusBadge status={u.status} />,
    },
    {
      key: "created_at",
      header: "Joined",
      render: (u) => (
        <span className="text-sm text-muted-foreground">
          {new Date(u.created_at).toLocaleDateString()}
        </span>
      ),
    },
    {
      key: "actions",
      header: "Actions",
      render: (u) => (
        <div className="flex gap-1">
          <Button
            variant="ghost"
            size="icon"
            onClick={(e) => {
              e.stopPropagation();
              openEdit(u);
            }}
          >
            <Pencil className="h-4 w-4" />
          </Button>
          <Button
            variant="ghost"
            size="icon"
            title="Set password"
            onClick={(e) => {
              e.stopPropagation();
              openPasswordDialog(u);
            }}
          >
            <KeyRound className="h-4 w-4" />
          </Button>
           <Button
            variant="ghost"
            size="icon"
            onClick={(e) => {
              e.stopPropagation();
              openDeleteDialog(u);
            }}
            className="text-destructive hover:text-destructive"
            disabled={isDeleting}
          >
            <Trash2 className="h-4 w-4" />
          </Button>
        </div>
      ),
    },
    ],
    [filterRole, openEdit, openPasswordDialog, openDeleteDialog, isDeleting],
  );

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-foreground">{title}</h1>
          <p className="text-muted-foreground mt-1">{subtitle}</p>
        </div>
        <Button onClick={openCreate} className="gap-2">
          <Plus className="h-4 w-4" /> Add{" "}
          {filterRole
            ? filterRole.charAt(0) + filterRole.slice(1).toLowerCase()
            : "User"}
        </Button>
      </div>

      <DataTable columns={columns} data={users} isLoading={isPending} />

      {totalPages > 1 && (
        <PaginatedTable totalPage={totalPages} onPageChange={setPage} currentPage={page} />
      )}

      <FormModal
        open={modalOpen}
        onOpenChange={setModalOpen}
        title={editing ? "Edit User" : "Add User"}
      >
        <div className="space-y-4">
          <div>
            <label className="text-sm font-medium text-foreground">Name</label>
            <Input
              value={form.name}
              onChange={(e) => setForm((f) => ({ ...f, name: e.target.value }))}
              className="mt-1"
            />
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">Email</label>
            <Input
              value={form.email}
              onChange={(e) =>
                setForm((f) => ({ ...f, email: e.target.value }))
              }
              type="email"
              className="mt-1"
            />
          </div>
          {!filterRole && (
            <div>
              <label className="text-sm font-medium text-foreground">
                Role
              </label>
              <Select
                value={form.role}
                onValueChange={(v) => setForm((f) => ({ ...f, role: v }))}
              >
                <SelectTrigger className="mt-1">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="LEARNER">Learner</SelectItem>
                  <SelectItem value="INSTRUCTOR">Instructor</SelectItem>
                  <SelectItem value="ADMIN">Admin</SelectItem>
                </SelectContent>
              </Select>
            </div>
          )}
          <div>
            <label className="text-sm font-medium text-foreground">
              Status
            </label>
            <Select
              value={form.status}
              onValueChange={(v) => setForm((f) => ({ ...f, status: v }))}
            >
              <SelectTrigger className="mt-1">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="ACTIVE">Active</SelectItem>
                <SelectItem value="INACTIVE">Inactive</SelectItem>
                <SelectItem value="SUSPENDED">Suspended</SelectItem>
              </SelectContent>
            </Select>
          </div>
          {!editing && (
            <div>
              <label className="text-sm font-medium text-foreground">
                Password (optional)
              </label>
              <Input
                type="password"
                value={form.password}
                onChange={(e) =>
                  setForm((f) => ({ ...f, password: e.target.value }))
                }
                placeholder="Leave blank to email an invite"
                className="mt-1"
              />
              <p className="text-xs text-muted-foreground mt-1">
                8-100 characters with uppercase, lowercase, number and symbol.
              </p>
            </div>
          )}
          <div className="flex justify-end gap-3">
            <Button variant="outline" onClick={() => setModalOpen(false)}>
              Cancel
            </Button>
            <Button onClick={handleSave} disabled={isCreating || isUpdating}>
              {editing ? "Update" : "Create"}
            </Button>
          </div>
        </div>
      </FormModal>

      <FormModal
        open={!!passwordUser}
        onOpenChange={(open) => {
          if (!open) cancelPasswordDialog();
        }}
        title="Set Password"
      >
        <div className="space-y-4">
          <div>
            <label className="text-sm font-medium text-foreground">
              New password for {passwordUser?.name}
            </label>
            <Input
              type="password"
              value={newPassword}
              onChange={(e) => setNewPassword(e.target.value)}
              placeholder="Enter new password"
              className="mt-1"
            />
            <p className="text-xs text-muted-foreground mt-1">
              8-100 characters with uppercase, lowercase, number and symbol.
              Existing sessions will be signed out.
            </p>
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">
              Confirm password
            </label>
            <Input
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              placeholder="Re-enter password"
              className="mt-1"
            />
          </div>
          <div className="flex justify-end gap-3">
            <Button variant="outline" onClick={cancelPasswordDialog}>
              Cancel
            </Button>
            <Button
              onClick={handleSetPassword}
              disabled={isSettingPassword}
            >
              {isSettingPassword ? "Saving..." : "Save Password"}
            </Button>
          </div>
        </div>
      </FormModal>

      <AlertDialog open={!!pendingDelete} onOpenChange={cancelDelete}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Delete {pendingDelete?.name}?</AlertDialogTitle>
            <AlertDialogDescription>
              Are you sure you want to delete this user? This action cannot be undone.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancel</AlertDialogCancel>
            <AlertDialogAction
              onClick={() => handleDelete(pendingDelete?.id)}
              className="bg-destructive text-destructive-foreground hover:bg-destructive/90"
            >
              Delete
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}