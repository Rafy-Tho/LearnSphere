import pgPool from "../../config/database.js";
import { buildPagination, parsePagination } from "./pagination.js";

class AdvancedQuery {
  constructor({
    baseQuery,
    queryString,
    filterMap = {},
    sortMap = {},
    startIndex = 1,
  }) {
    this.baseQuery = baseQuery;
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
    const excluded = ["page", "sort", "limit", "fields", "search"];
    const queryObj = { ...this.queryString };

    excluded.forEach((el) => delete queryObj[el]);

    Object.keys(queryObj).forEach((key) => {
      const baseField = key.split("[")[0];
      const column = this.filterMap[baseField];

      if (!column) return;

      const value = queryObj[key];

      // Ignore nested object values (e.g. from an extended query parser)
      // instead of passing them to Postgres as a parameter.
      if (value !== null && typeof value === "object" && !Array.isArray(value)) {
        return;
      }

      // =========================
      // ✅ HANDLE ARRAY (IN QUERY)
      // =========================
      if (Array.isArray(value)) {
        const placeholders = value.map((v) => {
          this.values.push(v);
          return `$${this.paramIndex++}`;
        });

        this.where.push(`${column} IN (${placeholders.join(", ")})`);
        return;
      }

      // =========================
      // 🔥 OPERATORS (gte, lte)
      // =========================
      if (key.includes("[")) {
        const operator = key.match(/\[(.*)\]/)[1];

        const sqlOp = {
          gte: ">=",
          gt: ">",
          lte: "<=",
          lt: "<",
        }[operator];

        if (!sqlOp) return;

        this.values.push(value);
        this.where.push(`${column} ${sqlOp} $${this.paramIndex++}`);
      } else {
        this.values.push(value);
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
      const value = `%${this.queryString.search}%`;

      const conditions = fields.map((field) => {
        this.values.push(value);
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
        .map((f) => {
          const direction = f.startsWith("-") ? "DESC" : "ASC";
          const key = f.replace("-", "");

          const column = this.sortMap[key];
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

    // ✅ include extraValues (like userId)
    const countQuery = `SELECT COUNT(*) ${this.baseQuery} ${whereClause}`;
    const countResult = await pgPool.query(countQuery, [
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
