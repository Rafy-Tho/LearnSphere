import pgPool from "../../config/database.js";
import { buildPagination, parsePagination } from "./pagination.js";

class AdvancedQuery {
  constructor({
    db = pgPool,
    baseQuery,
    countBaseQuery = null,
    countJoinAliases = [],
    queryString,
    filterMap = {},
    sortMap = {},
    startIndex = 1,
  }) {
    this.db = db;
    this.baseQuery = baseQuery;
    this.countBaseQuery = countBaseQuery;
    this.countJoinAliases = countJoinAliases;
    this.queryString = queryString;
    this.filterMap = filterMap;
    this.sortMap = sortMap;
    this.where = [];
    this.values = [];
    this.order = "";
    this.limit = "";
    this.offset = "";
    this.select = "*";
    this.pagination = {};
    this.paramIndex = startIndex;
  }

  // =========================
  // 1️⃣ FILTER
  // =========================
  filter() {
    const excludedKeys = ["page", "sort", "limit", "fields", "search"];
    const filters = { ...this.queryString };

    excludedKeys.forEach((excludedKey) => delete filters[excludedKey]);

    Object.keys(filters).forEach((queryKey) => {
      const baseField = queryKey.split("[")[0];
      const column = this.filterMap[baseField];

      if (!column) return;

      const filterValue = filters[queryKey];

      // Ignore nested object values (e.g. from an extended query parser)
      // instead of passing them to Postgres as a parameter.
      if (
        filterValue !== null &&
        typeof filterValue === "object" &&
        !Array.isArray(filterValue)
      ) {
        return;
      }

      // =========================
      // ✅ HANDLE ARRAY (IN QUERY)
      // =========================
      if (Array.isArray(filterValue)) {
        const placeholders = filterValue.map((item) => {
          this.values.push(item);
          return `$${this.paramIndex++}`;
        });

        this.where.push(`${column} IN (${placeholders.join(", ")})`);
        return;
      }

      // =========================
      // 🔥 OPERATORS (gte, lte)
      // =========================
      if (queryKey.includes("[")) {
        const operator = queryKey.match(/\[(.*)\]/)[1];

        const sqlOperator = {
          gte: ">=",
          gt: ">",
          lte: "<=",
          lt: "<",
        }[operator];

        if (!sqlOperator) return;

        this.values.push(filterValue);
        this.where.push(`${column} ${sqlOperator} $${this.paramIndex++}`);
      } else {
        this.values.push(filterValue);
        this.where.push(`${column} = $${this.paramIndex++}`);
      }
    });

    return this;
  }
  // =========================
  // 2️⃣ SEARCH (MULTI FIELD)
  // =========================
  search(fields = []) {
    if (this.queryString.search && fields.length) {
      const searchValue = `%${this.queryString.search}%`;

      const conditions = fields.map((field) => {
        this.values.push(searchValue);
        return `${field} ILIKE $${this.paramIndex++}`;
      });

      this.where.push(`(${conditions.join(" OR ")})`);
    }

    return this;
  }

  // =========================
  // 3️⃣ SORT
  // =========================
  sort() {
    if (this.queryString.sort) {
      const fields = this.queryString.sort
        .split(",")
        .map((sortField) => {
          const direction = sortField.startsWith("-") ? "DESC" : "ASC";
          const sortKey = sortField.replace("-", "");

          const column = this.sortMap[sortKey];
          if (!column) return null;

          return `${column} ${direction}`;
        })
        .filter(Boolean)
        .join(", ");

      if (fields) this.order = `ORDER BY ${fields}`;
    } else {
      // default sort
      if (this.sortMap.created_at) {
        this.order = `ORDER BY ${this.sortMap.created_at} DESC`;
      }
    }

    return this;
  }

  // =========================
  // 4️⃣ PAGINATION
  // =========================
  async paginate(extraValues = []) {
    const { page, limit, offset } = parsePagination(this.queryString);

    const whereClause = this.where.length
      ? `WHERE ${this.where.join(" AND ")}`
      : "";

    // Use the lightweight count base unless an active filter references a
    // joined alias, in which case the joined base is required.
    const whereSql = this.where.join(" AND ");
    const needsJoinedBase = this.countJoinAliases.some((alias) =>
      whereSql.includes(`${alias}.`),
    );
    const countBase =
      this.countBaseQuery && !needsJoinedBase
        ? this.countBaseQuery
        : this.baseQuery;

    // ✅ include extraValues (like userId)
    const countQuery = `SELECT COUNT(*) ${countBase} ${whereClause}`;
    const countResult = await this.db.query(countQuery, [
      ...extraValues,
      ...this.values,
    ]);

    const total = Number(countResult.rows[0].count);

    this.pagination = buildPagination({ total, page, limit });

    this.limit = `LIMIT ${limit}`;
    this.offset = `OFFSET ${offset}`;

    return this;
  }
  // =========================
  // 🔥 BUILD FINAL QUERY
  // =========================
  build() {
    const whereClause = this.where.length
      ? `WHERE ${this.where.join(" AND ")}`
      : "";

    const sql = `
      SELECT ${this.select}
      ${this.baseQuery}
      ${whereClause}
      ${this.order}
      ${this.limit}
      ${this.offset}
    `;

    return {
      sql,
      values: this.values,
      pagination: this.pagination,
    };
  }

  addCondition(condition) {
    this.where.push(condition);
    return this;
  }
}

export default AdvancedQuery;
