/**
 * Query spec for the course reviews list (`GET /courses/:courseId/reviews`).
 */
export const reviewListQuerySpec = {
  baseAlias: "cr",
  filters: {
    rating: {
      column: "cr.rating",
      type: "int",
      min: 1,
      max: 5,
      description: "Exact star rating",
    },
    courseId: {
      column: "cr.course_id",
      type: "uuid",
      hidden: true,
      description: "Injected from the path; not client-settable",
    },
  },
  sortable: {
    createdAt: "cr.created_at",
    rating: "cr.rating",
  },
  search: {
    columns: ["cr.review"],
    mode: "trigram",
    minLength: 2,
  },
  defaultSort: "createdAt",
};
