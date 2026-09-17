import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import couponRepository from "./coupon.repository.js";

const INVALID_COUPON_MESSAGE = "Coupon code is invalid or expired.";
const DISCOUNT_TYPES = ["PERCENTAGE", "FIXED_AMOUNT"];

function roundMoney(value) {
  return Math.round(Number(value) * 100) / 100;
}

class CouponService {
  constructor({ couponRepository }) {
    this.couponRepository = couponRepository;
  }

  normalizeCode(code) {
    return String(code ?? "").trim().toUpperCase();
  }

  async validate({ code, plan, userId }) {
    const coupon = await this.couponRepository.findByCode(
      this.normalizeCode(code),
    );

    if (!coupon || !coupon.is_active) {
      throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
    }

    const now = new Date();
    if (coupon.starts_at && now < new Date(coupon.starts_at)) {
      throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
    }
    if (coupon.expires_at && now > new Date(coupon.expires_at)) {
      throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
    }
    if (
      coupon.max_redemptions != null &&
      coupon.redemption_count >= coupon.max_redemptions
    ) {
      throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
    }

    const value = Number(coupon.discount_value);
    if (coupon.discount_type === "PERCENTAGE" && (value <= 0 || value > 100)) {
      throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
    }
    if (coupon.discount_type === "FIXED_AMOUNT" && value <= 0) {
      throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
    }

    if (userId) {
      const existing = await this.couponRepository.findRedemption({
        couponId: coupon.id,
        userId,
      });
      if (existing) {
        throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
      }
    }

    const subtotal = roundMoney(plan.price);
    const discount = this.calculateDiscount(coupon, subtotal);

    return {
      coupon,
      subtotal,
      discount,
      total: roundMoney(subtotal - discount),
      currency: plan.currency || "usd",
    };
  }

  calculateDiscount(coupon, subtotal) {
    const value = Number(coupon.discount_value);
    let discount =
      coupon.discount_type === "PERCENTAGE"
        ? subtotal * (value / 100)
        : value;
    if (discount > subtotal) discount = subtotal;
    if (discount < 0) discount = 0;
    return roundMoney(discount);
  }

  async getCoupons(query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });
    const filters = {
      search: query.search,
      isActive:
        query.is_active !== undefined ? query.is_active === "true" : undefined,
    };

    const [coupons, total] = await Promise.all([
      this.couponRepository.findAll({ limit, offset, ...filters }),
      this.couponRepository.count(filters),
    ]);

    return { coupons, pagination: buildPagination({ total, page, limit }) };
  }

  async createCoupon(payload) {
    const data = this.#normalizePayload(payload);

    const existing = await this.couponRepository.findByCode(data.code);
    if (existing) {
      throw new ApiError(StatusCode.CONFLICT, "Coupon code already exists");
    }

    return this.couponRepository.create(data);
  }

  async updateCoupon(couponId, payload) {
    const existing = await this.couponRepository.findById(couponId);
    if (!existing) {
      throw new ApiError(StatusCode.NOT_FOUND, "Coupon not found");
    }

    const data = this.#normalizePayload(payload, existing);

    if (data.code !== existing.code) {
      const duplicate = await this.couponRepository.findByCode(data.code);
      if (duplicate) {
        throw new ApiError(StatusCode.CONFLICT, "Coupon code already exists");
      }
    }

    return this.couponRepository.update(couponId, data);
  }

  async setCouponActive(couponId, isActive) {
    const existing = await this.couponRepository.findById(couponId);
    if (!existing) {
      throw new ApiError(StatusCode.NOT_FOUND, "Coupon not found");
    }
    return this.couponRepository.setActive(couponId, Boolean(isActive));
  }

  async getRedemptions(couponId, query = {}) {
    const existing = await this.couponRepository.findById(couponId);
    if (!existing) {
      throw new ApiError(StatusCode.NOT_FOUND, "Coupon not found");
    }

    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [redemptions, total] = await Promise.all([
      this.couponRepository.listRedemptions({ couponId, limit, offset }),
      this.couponRepository.countRedemptions(couponId),
    ]);

    return {
      redemptions,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  #normalizePayload(payload, existing = {}) {
    const code = this.normalizeCode(
      payload.code !== undefined ? payload.code : existing.code,
    );
    const discountType =
      payload.discount_type !== undefined
        ? payload.discount_type
        : existing.discount_type;
    const discountValue = Number(
      payload.discount_value !== undefined
        ? payload.discount_value
        : existing.discount_value,
    );
    const maxRedemptions =
      payload.max_redemptions !== undefined
        ? payload.max_redemptions
        : (existing.max_redemptions ?? null);
    const startsAt =
      payload.starts_at !== undefined ? payload.starts_at : existing.starts_at;
    const expiresAt =
      payload.expires_at !== undefined
        ? payload.expires_at
        : existing.expires_at;
    const isActive =
      payload.is_active !== undefined
        ? payload.is_active
        : (existing.is_active ?? true);

    if (!code) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Coupon code is required");
    }
    if (!DISCOUNT_TYPES.includes(discountType)) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid discount type");
    }
    if (!Number.isFinite(discountValue) || discountValue <= 0) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Discount value must be greater than 0",
      );
    }
    if (discountType === "PERCENTAGE" && discountValue > 100) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Percentage discount cannot exceed 100",
      );
    }
    if (maxRedemptions !== null && maxRedemptions !== undefined) {
      const max = Number(maxRedemptions);
      if (!Number.isInteger(max) || max <= 0) {
        throw new ApiError(
          StatusCode.BAD_REQUEST,
          "Maximum redemptions must be a positive integer",
        );
      }
      if (max < Number(existing.redemption_count || 0)) {
        throw new ApiError(
          StatusCode.BAD_REQUEST,
          "Maximum redemptions cannot be lower than current redemptions",
        );
      }
    }
    if (startsAt && expiresAt && new Date(startsAt) >= new Date(expiresAt)) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Expiration must be after the start date",
      );
    }

    return {
      code,
      discountType,
      discountValue: roundMoney(discountValue),
      maxRedemptions:
        maxRedemptions === undefined || maxRedemptions === ""
          ? null
          : maxRedemptions === null
            ? null
            : Number(maxRedemptions),
      startsAt: startsAt || null,
      expiresAt: expiresAt || null,
      isActive: Boolean(isActive),
    };
  }
}

export { CouponService };
export default new CouponService({ couponRepository });
