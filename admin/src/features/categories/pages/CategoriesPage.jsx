import { useCallback, useMemo, useState } from 'react';
import { Pencil, Plus } from 'lucide-react';
import { DataTable } from '@/components/common/DataTable';
import { FormModal } from '@/components/common/FormModal';
import { DeleteButton } from '@/components/ui/alert-dialog';
import { ErrorState } from '@/components/common/ErrorState';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { CategoriesPageSkeleton } from '@/components/ui/skeleton';
import { Textarea } from '@/components/ui/textarea';
import {
  useCreateCategory,
  useDeleteCategory,
  useGetCategories,
  useUpdateCategory,
} from '@/features/categories/hooks';
import { useToast } from '@/hooks/use-toast';

export default function CategoriesPage() {
  const { data, isLoading, error } = useGetCategories();
  const categories = data ?? [];
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState(null);
  const [form, setForm] = useState({ name: '', slug: '', description: '' });
  const { updateCategory, isPending: isUpdating } = useUpdateCategory();
  const { createCategory, isPending: isCreating } = useCreateCategory();
  const { deleteCategory, isPending: isDeleting } = useDeleteCategory();
  const { toast } = useToast();
  const openCreate = useCallback(() => {
    setEditing(null);
    setForm({ name: '', slug: '', description: '' });
    setModalOpen(true);
  }, []);

  const openEdit = useCallback((cat) => {
    setEditing(cat);
    setForm({
      name: cat.name,
      slug: cat.slug,
      description: cat.description || '',
    });
    setModalOpen(true);
  }, []);

  const handleSave = async () => {
    if (!form.name || !form.slug) return;
    if (editing) {
      try {
        await updateCategory({ id: editing.id, category: form });
        toast({
          title: 'Category updated',
          description: 'The category has been updated successfully.',
        });
        setModalOpen(false);
      } catch (error) {
        toast({
          title: 'Error',
          description: error.message || 'Failed to update category.',
          variant: 'destructive',
        });
      }
    } else {
      try {
        await createCategory(form);
        toast({
          title: 'Category created',
          description: 'The category has been created successfully.',
        });
        setModalOpen(false);
      } catch (error) {
        toast({
          title: 'Error',
          description: error.message || 'Failed to create category.',
          variant: 'destructive',
        });
      }
    }
  };

  const handleDelete = useCallback(async (id) => {
    try {
      await deleteCategory(id);
      toast({
        title: 'Category deleted',
        description: 'The category has been deleted successfully.',
      });
    } catch (error) {
      toast({
        title: 'Error',
        description: error.message || 'Failed to delete category.',
        variant: 'destructive',
      });
    }
  }, [deleteCategory, toast]);

  const columns = useMemo(
    () => [
      { key: 'name', header: 'Name' },
    {
      key: 'slug',
      header: 'Slug',
      render: (c) => (
        <span className="text-muted-foreground font-mono text-sm">
          {c.slug}
        </span>
      ),
    },
    {
      key: 'description',
      header: 'Description',
      render: (c) => (
        <span className="text-muted-foreground text-sm truncate max-w-[200px] block">
          {c.description || '—'}
        </span>
      ),
    },
    {
      key: 'actions',
      header: 'Actions',
      render: (c) => (
        <div className="flex gap-2">
          <Button
            variant="ghost"
            size="icon"
            onClick={(e) => {
              e.stopPropagation();
              openEdit(c);
            }}
          >
            <Pencil className="h-4 w-4" />
          </Button>
          <DeleteButton
            onDelete={() => handleDelete(c.id)}
            isDeleting={isDeleting}
          />
        </div>
      ),
    },
    ],
    [openEdit, handleDelete, isDeleting],
  );
  if (isLoading) return <CategoriesPageSkeleton />;
  if (error) return <ErrorState message={error.message} />;
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-foreground">Categories</h1>
          <p className="text-muted-foreground mt-1">Manage course categories</p>
        </div>
        <Button onClick={openCreate} className="gap-2">
          <Plus className="h-4 w-4" /> Add Category
        </Button>
      </div>

      <DataTable columns={columns} data={categories} />

      <FormModal
        open={modalOpen}
        onOpenChange={setModalOpen}
        title={editing ? 'Edit Category' : 'Add Category'}
      >
        <div className="space-y-4">
          <div>
            <label className="text-sm font-medium text-foreground">Name</label>
            <Input
              value={form.name}
              onChange={(e) =>
                setForm((f) => ({
                  ...f,
                  name: e.target.value,
                  slug: e.target.value.toLowerCase().replace(/\s+/g, '-'),
                }))
              }
              placeholder="Category name"
              className="mt-1"
            />
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">Slug</label>
            <Input
              value={form.slug}
              onChange={(e) => setForm((f) => ({ ...f, slug: e.target.value }))}
              placeholder="category-slug"
              className="mt-1"
            />
          </div>
          <div>
            <label className="text-sm font-medium text-foreground">
              Description
            </label>
            <Textarea
              value={form.description}
              onChange={(e) =>
                setForm((f) => ({ ...f, description: e.target.value }))
              }
              placeholder="Optional description"
              className="mt-1"
            />
          </div>
          <div className="flex justify-end gap-3">
            <Button variant="outline" onClick={() => setModalOpen(false)}>
              Cancel
            </Button>
            <Button onClick={handleSave} disabled={isUpdating}>
              {editing
                ? isUpdating
                  ? 'Updating...'
                  : 'Update'
                : isCreating
                  ? 'Creating...'
                  : 'Create'}
            </Button>
          </div>
        </div>
      </FormModal>
    </div>
  );
}