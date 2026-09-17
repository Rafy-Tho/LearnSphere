import { JSDOM } from "jsdom";
import DOMPurify from "isomorphic-dompurify";

const CSS_STRIP = /url\(\s*(['"]?)[^)'"]*\1\s*\)|@import\s[^;]*;?|expression\s*\(/gi;

function sanitizeCSS(raw) {
  return raw.replace(CSS_STRIP, "");
}
export const emailValidator = (field, optional = false) => ({
  in: ["body"],
  trim: true,
  escape: true,
  toLowerCase: true,
  normalizeEmail: true,
  ...(optional && {
    optional: {
      options: { nullable: true, checkFalsy: true },
    },
  }),
  ...(!optional && {
    notEmpty: {
      errorMessage: `${field} is required`,
      bail: true,
    },
  }),
  isEmail: {
    errorMessage: `${field} must be a valid email`,
  },
  isLength: {
    options: { max: 100 },
    errorMessage: `${field} must be at most 100 characters`,
  },
});

export const passwordValidator = (field) => ({
  in: ["body"],
  notEmpty: {
    errorMessage: `${field} is required`,
    bail: true,
  },
  isLength: {
    options: { min: 8, max: 100 },
    errorMessage: `${field} must be between 8 and 100 characters`,
    bail: true,
  },
  isStrongPassword: {
    options: {
      minLowercase: 1,
      minUppercase: 1,
      minNumbers: 1,
      minSymbols: 1,
    },
    errorMessage: `${field} must contain uppercase, lowercase, number and symbol`,
  },
});

export const textValidator = (field, optional = false, maxLength = 50) => ({
  in: ["body"],
  trim: true,
  ...(optional && {
    optional: {
      options: { nullable: true, checkFalsy: true },
    },
  }),
  ...(!optional && {
    notEmpty: {
      errorMessage: `${field} is required`,
      bail: true,
    },
  }),
  isLength: {
    options: { min: 3, max: maxLength },
    errorMessage: `${field} must be between 3 and ${maxLength} characters`,
  },
});

export const codeValidator = (field) => ({
  in: ["body"],
  trim: true,
  escape: true,
  notEmpty: {
    errorMessage: `${field} is required`,
    bail: true,
  },
  isNumeric: {
    errorMessage: `${field} must be a number`,
    bail: true,
  },
  isLength: {
    options: { min: 6, max: 6 },
    errorMessage: `${field} must be 6 characters long`,
  },
});

export const uuidValidator = (field, optional = false) => ({
  in: ["body"],
  trim: true,
  escape: true,
  ...(optional && {
    optional: {
      options: { nullable: true, checkFalsy: true },
    },
  }),
  ...(!optional && {
    notEmpty: {
      errorMessage: `${field} is required`,
      bail: true,
    },
  }),
  isUUID: {
    errorMessage: `${field} must be a valid UUID`,
  },
});

export const uuidParamValidator = (field) => ({
  in: ["params"],
  trim: true,
  notEmpty: {
    errorMessage: `${field} is required`,
    bail: true,
  },
  isUUID: {
    errorMessage: `${field} must be a valid UUID`,
  },
});

export const numberValidator = (field, optional = false) => ({
  in: ["body"],
  trim: true,
  escape: true,
  toInt: true,
  ...(optional && {
    optional: {
      options: { nullable: true, checkFalsy: true },
    },
  }),
  ...(!optional && {
    notEmpty: {
      errorMessage: `${field} is required`,
      bail: true,
    },
  }),
  isInt: {
    options: { min: 0, max: 1_000_000_000 },
    errorMessage: `${field} must be between 0 and 1000,000,000`,
  },
});

export const floatValidator = (field, optional = false) => ({
  in: ["body"],
  trim: true,
  escape: true,
  toFloat: true,
  ...(optional && {
    optional: {
      options: { nullable: true, checkFalsy: true },
    },
  }),
  ...(!optional && {
    notEmpty: {
      errorMessage: `${field} is required`,
      bail: true,
    },
  }),
  isFloat: {
    options: { min: 0, max: 1_000_000_000 },
    errorMessage: `${field} must be between 0 and 1000,000,000`,
  },
});

export const enumValidator = (field, values, optional = false) => ({
  in: ["body"],
  trim: true,
  escape: true,
  ...(optional && {
    optional: {
      options: { nullable: true, checkFalsy: true },
    },
  }),
  ...(!optional && {
    notEmpty: {
      errorMessage: `${field} is required`,
      bail: true,
    },
  }),
  isIn: {
    options: [values],
    errorMessage: `${field} must be either ${values.join(" or ")}`,
  },
  isLength: {
    options: { min: 1, max: 100 },
    errorMessage: `${field} must be between 1 and 100 characters`,
  },
});

export const htmlValidator = (field) => ({
  in: ["body"],
  trim: true,
  notEmpty: {
    errorMessage: `${field} is required`,
    bail: true,
  },
  custom: {
    options: (value, { req }) => {
      const hasTag = /<\/?[a-z][\s\S]*>/i.test(value);

      if (!hasTag) {
        throw new Error(`${field} must contain valid HTML`);
      }

      // Extract <style> blocks before DOMPurify strips them
      const doc = new JSDOM(value).window.document;
      const styles = doc.querySelectorAll("style");
      const cssParts = [];
      for (const el of styles) {
        cssParts.push(el.textContent);
        el.remove();
      }

      const cleanHTML = DOMPurify.sanitize(doc.body.innerHTML);

      // Re-inject sanitized CSS into the HTML
      const safeCSS = sanitizeCSS(cssParts.join("\n"));
      const sanitizedValue = safeCSS
        ? `<style>${safeCSS}</style>${cleanHTML}`
        : cleanHTML;

      req.body[field] = sanitizedValue;

      return true;
    },
  },
  isLength: {
    options: { max: 1_000_000 },
    errorMessage: `${field} must be at most 1,000,000 characters`,
  },
});

export const booleanValidator = (field) => ({
  in: ["body"],
  notEmpty: {
    errorMessage: `${field} is required`,
    bail: true,
  },
  // Normalize only recognized boolean representations; leave anything else
  // untouched so the strict validator below rejects it (no string coercion).
  customSanitizer: {
    options: (value) => {
      if (value === true || value === "true" || value === "1" || value === 1) {
        return true;
      }
      if (value === false || value === "false" || value === "0" || value === 0) {
        return false;
      }
      return value;
    },
  },
  isBoolean: {
    errorMessage: `${field} must be a boolean`,
  },
});

export const dateValidator = (field, optional = false) => ({
  in: ["body"],
  trim: true,

  ...(optional && {
    optional: {
      options: { nullable: true, checkFalsy: true },
    },
  }),

  ...(!optional && {
    notEmpty: {
      errorMessage: `${field} is required`,
      bail: true,
    },
  }),

  toDate: true,
});
