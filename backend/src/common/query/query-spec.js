/**
 * Helpers that turn a declarative query spec into the maps consumed by
 * `AdvancedQuery` and the list-query validator. Keeping the spec as the single
 * source of truth means adding a filter/sort/search column only requires
 * editing one place.
 *
 * Spec shape:
 * {
 *   baseAlias: "c",
 *   filters: {
 *     level: { column: "c.level", type: "enum", values: [...] },
 *     minRating: { column: "rv.avg_rating", operator: ">=", type: "number", min: 0, max: 5 },
 *   },
 *   sortable: { createdAt: "c.created_at" },
 *   search: { columns: ["c.name", "c.description"], mode: "trigram", minLength: 2 },
 *   defaultSort: "createdAt",
 * }
 */

export function deriveFilterMap(spec = {}) {
  const map = {};

  for (const [name, def] of Object.entries(spec.filters || {})) {
    map[name] = def.operator
      ? { column: def.column, operator: def.operator }
      : def.column;
  }

  return map;
}

export function deriveSortMap(spec = {}) {
  return { ...(spec.sortable || {}) };
}

export function deriveSearchFields(spec = {}) {
  return spec.search?.columns || [];
}

/**
 * Aliases referenced by filters/search that are not the base alias. Used by
 * `AdvancedQuery` to decide whether the count query needs the joined base.
 */
export function deriveCountJoinAliases(spec = {}) {
  const aliases = new Set();
  const baseAlias = spec.baseAlias;

  const collect = (columns = []) => {
    for (const column of columns) {
      const [alias, field] = String(column).split(".");
      if (alias && field && alias !== baseAlias) aliases.add(alias);
    }
  };

  collect(Object.values(spec.filters || {}).map((filter) => filter.column));
  collect(spec.search?.columns);

  return [...aliases];
}
