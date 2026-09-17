import ApiError from "../errors/api-error.js";
import StatusCode from "../constants/status-code.js";

const RESERVED_PARAMS = ["page", "limit", "sort", "search"];
const UUID_PATTERN =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

/**
 * Validate a single (possibly repeated) query value against a filter
 * definition. Throws a plain Error whose message becomes the 422 response.
 */
function assertValidValue(name, value, def) {
  const values = Array.isArray(value) ? value : [value];

  if (Array.isArray(value) && def.array !== true) {
    throw new Error(`${name} accepts a single value`);
  }

  for (const item of values) {
    const raw = String(item);

    if (raw === "") throw new Error(`${name} must not be empty`);

    switch (def.type) {
      case "int": {
        if (!/^-?\d+$/.test(raw)) {
          throw new Error(`${name} must be an integer`);
        }
        const parsed = Number(raw);
        if (def.min !== undefined && parsed < def.min) {
          throw new Error(`${name} must be at least ${def.min}`);
        }
        if (def.max !== undefined && parsed > def.max) {
          throw new Error(`${name} must be at most ${def.max}`);
        }
        break;
      }
      case "number": {
        const parsed = Number(raw);
        if (!Number.isFinite(parsed)) {
          throw new Error(`${name} must be a number`);
        }
        if (def.min !== undefined && parsed < def.min) {
          throw new Error(`${name} must be at least ${def.min}`);
        }
        if (def.max !== undefined && parsed > def.max) {
          throw new Error(`${name} must be at most ${def.max}`);
        }
        break;
      }
      case "enum": {
        if (!def.values?.includes(raw)) {
          throw new Error(
            `${name} must be one of ${(def.values || []).join(", ")}`,
          );
        }
        break;
      }
      case "uuid": {
        if (!UUID_PATTERN.test(raw)) {
          throw new Error(`${name} must be a valid UUID`);
        }
        break;
      }
      default: {
        if (def.maxLength && raw.length > def.maxLength) {
          throw new Error(
            `${name} must be at most ${def.maxLength} characters`,
          );
        }
      }
    }
  }
}

/**
 * Build an Express middleware that validates `req.query` against a query spec.
 *
 * Validation is read-only: Express 5 exposes `req.query` as a getter that
 * re-parses on every access, so sanitizers cannot persist. Coercion is handled
 * downstream by `parsePagination`/`AdvancedQuery`.
 *
 * Unknown parameters are rejected so typos surface immediately.
 */
export function validateListQuery(spec = {}) {
  const filters = Object.entries(spec.filters || {}).filter(
    ([, def]) => !def.hidden,
  );
  const allowedParams = new Set([
    ...RESERVED_PARAMS,
    ...filters.map(([name]) => name),
  ]);
  const sortableKeys = Object.keys(spec.sortable || {});
  const searchMinLength = spec.search?.minLength ?? 1;

  return (req, res, next) => {
    try {
      const query = req.query || {};

      for (const key of Object.keys(query)) {
        if (!allowedParams.has(key)) {
          throw new Error(`Unknown query parameter: ${key}`);
        }
      }

      if (query.page !== undefined) {
        assertValidValue("page", query.page, { type: "int", min: 1 });
      }

      if (query.limit !== undefined) {
        assertValidValue("limit", query.limit, {
          type: "int",
          min: 1,
          max: 100,
        });
      }

      if (query.search !== undefined) {
        assertValidValue("search", query.search, { type: "string" });

        if (String(query.search).trim().length < searchMinLength) {
          throw new Error(
            `search must be at least ${searchMinLength} characters`,
          );
        }
      }

      if (query.sort !== undefined) {
        for (const field of String(query.sort).split(",")) {
          const key = field.trim().replace(/^-/, "");

          if (!key || !sortableKeys.includes(key)) {
            throw new Error(
              `sort must be one of ${sortableKeys.join(", ") || "none"}`,
            );
          }
        }
      }

      for (const [name, def] of filters) {
        if (query[name] !== undefined) {
          assertValidValue(name, query[name], def);
        }
      }

      next();
    } catch (error) {
      next(new ApiError(StatusCode.VALIDATION_ERROR, error.message));
    }
  };
}
