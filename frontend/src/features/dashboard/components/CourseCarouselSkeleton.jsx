import Skeleton from "@/components/ui/Skeleton";

function SkeletonCard() {
  return (
    <div className="flex h-full flex-col rounded-xl border border-border bg-surface p-6">
      <div className="mb-4 flex items-start justify-between">
        <Skeleton variant="block" className="h-6 w-20 rounded-full" />
        <Skeleton variant="block" className="size-5 rounded-md" />
      </div>
      <Skeleton variant="text" className="h-5 w-3/4" />
      <Skeleton variant="text" className="mt-3 h-4 w-full" />
      <Skeleton variant="text" className="mt-2 h-4 w-5/6" />
      <div className="mt-auto flex items-center justify-between pt-8">
        <Skeleton variant="block" className="h-4 w-16" />
        <Skeleton variant="block" className="h-4 w-16" />
      </div>
    </div>
  );
}

export default function CourseCarouselSkeleton({ count = 4 }) {
  return (
    <div
      className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4"
      aria-hidden="true"
    >
      {Array.from({ length: count }, (_, index) => (
        <SkeletonCard key={index} />
      ))}
    </div>
  );
}
