import { useCallback, useMemo, useState } from 'react';
import { Check, Eye, X } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import { DataTable } from '@/components/common/DataTable';
import { FormModal } from '@/components/common/FormModal';
import { StatusBadge } from '@/components/common/StatusBadge';
import { Button } from '@/components/ui/button';
import { Textarea } from '@/components/ui/textarea';
import {
  useCourseReviewActions,
  useGetCourses,
} from '@/features/courses/hooks';
import { toast } from '@/hooks/use-toast';

export default function CourseReviewsPage() {
  const navigate = useNavigate();
  const searchParams = useMemo(
    () => new URLSearchParams({ status: 'PENDING' }),
    [],
  );
  const { data, isLoading } = useGetCourses(searchParams);
  const { approveCourse, rejectCourse, isApproving, isRejecting } =
    useCourseReviewActions();
  const [rejectTarget, setRejectTarget] = useState(null);
  const [reason, setReason] = useState('');

  const courses = data?.data || [];

  const handleApprove = useCallback(
    async (course) => {
      try {
        await approveCourse(course.id);
        toast({ title: 'Approved', description: `${course.name} is now published.` });
      } catch (error) {
        toast({
          title: 'Error',
          description: error.message || 'Failed to approve course',
          variant: 'destructive',
        });
      }
    },
    [approveCourse],
  );

  const handleReject = async () => {
    if (!reason.trim()) return;
    try {
      await rejectCourse({ id: rejectTarget.id, reason: reason.trim() });
      toast({
        title: 'Rejected',
        description: `${rejectTarget.name} was sent back with feedback.`,
      });
      setRejectTarget(null);
      setReason('');
    } catch (error) {
      toast({
        title: 'Error',
        description: error.message || 'Failed to reject course',
        variant: 'destructive',
      });
    }
  };

  const columns = useMemo(
    () => [
      {
        key: 'name',
        header: 'Course',
        render: (c) => (
          <div>
            <p className="font-medium text-foreground">{c.name}</p>
            <p className="text-xs text-muted-foreground">
              by {c.instructor_name || 'Instructor'}
            </p>
          </div>
        ),
      },
      {
        key: 'level',
        header: 'Level',
        render: (c) => (
          <span className="text-sm text-muted-foreground">{c.level}</span>
        ),
      },
      {
        key: 'access_type',
        header: 'Access',
        render: (c) => <StatusBadge status={c.access_type} />,
      },
      {
        key: 'submitted_at',
        header: 'Submitted',
        render: (c) => (
          <span className="text-sm text-muted-foreground">
            {c.submitted_at
              ? new Date(c.submitted_at).toLocaleDateString()
              : '—'}
          </span>
        ),
      },
      {
        key: 'actions',
        header: 'Actions',
        render: (c) => (
          <div className="flex gap-1">
            <Button
              variant="ghost"
              size="icon"
              onClick={(e) => {
                e.stopPropagation();
                navigate(`/courses/${c.id}`);
              }}
            >
              <Eye className="h-4 w-4" />
            </Button>
            <Button
              variant="ghost"
              size="icon"
              className="text-success hover:text-success"
              disabled={isApproving}
              onClick={(e) => {
                e.stopPropagation();
                handleApprove(c);
              }}
            >
              <Check className="h-4 w-4" />
            </Button>
            <Button
              variant="ghost"
              size="icon"
              className="text-destructive hover:text-destructive"
              disabled={isRejecting}
              onClick={(e) => {
                e.stopPropagation();
                setReason('');
                setRejectTarget(c);
              }}
            >
              <X className="h-4 w-4" />
            </Button>
          </div>
        ),
      },
    ],
    [navigate, handleApprove, isApproving, isRejecting],
  );

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-foreground">Course Reviews</h1>
        <p className="text-muted-foreground mt-1">
          Approve or reject courses submitted by instructors
        </p>
      </div>

      <DataTable columns={columns} data={courses} isLoading={isLoading} />

      <FormModal
        open={!!rejectTarget}
        onOpenChange={(open) => {
          if (!open) setRejectTarget(null);
        }}
        title={`Reject "${rejectTarget?.name || ''}"`}
      >
        <div className="space-y-4">
          <div>
            <label className="text-sm font-medium text-foreground">
              Reason for rejection
            </label>
            <Textarea
              value={reason}
              onChange={(e) => setReason(e.target.value)}
              placeholder="Tell the instructor what needs to change"
              className="mt-1"
            />
          </div>
          <div className="flex justify-end gap-3">
            <Button variant="outline" onClick={() => setRejectTarget(null)}>
              Cancel
            </Button>
            <Button
              onClick={handleReject}
              disabled={!reason.trim() || isRejecting}
              className="bg-destructive text-destructive-foreground hover:bg-destructive/90"
            >
              Reject
            </Button>
          </div>
        </div>
      </FormModal>
    </div>
  );
}
