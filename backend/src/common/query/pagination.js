export const DEFAULT_LIMIT = 10;
export const MAX_LIMIT = 100;

/**
 * Parse and clamp `page`/`limit` query params.
 * Non-finite or out-of-range values fall back to safe defaults; `limit` is capped.
 * @param {{ page?: unknown, limit?: unknown }} query
 * @param {{ defaultLimit?: number, maxLimit?: number }} [options]
 * @returns {{ page: number, limit: number, offset: number }}
 */
export function parsePagination(
  query = {},
  { defaultLimit = DEFAULT_LIMIT, maxLimit = MAX_LIMIT } = {},
) {
  const rawPage = Number(query.page);
  const rawLimit = Number(query.limit);

  const page =
    Number.isFinite(rawPage) && rawPage >= 1 ? Math.floor(rawPage) : 1;
  const requested =
    Number.isFinite(rawLimit) && rawLimit >= 1
      ? Math.floor(rawLimit)
      : defaultLimit;
  const limit = Math.min(requested, maxLimit);

  return { page, limit, offset: (page - 1) * limit };
}

/**
 * Build the standard pagination envelope.
 * @param {{ total: number, page: number, limit: number }} params
 */
export function buildPagination({ total, page, limit }) {
  const totalItems = Number(total) || 0;
  const totalPages = Math.ceil(totalItems / limit) || 0;

  return {
    totalItems,
    currentPage: page,
    totalPages,
    limit,
    next: page * limit < totalItems ? page + 1 : null,
    prev: page > 1 ? page - 1 : null,
  };
}
