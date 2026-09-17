import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import couponRepository from "./coupon.repository.js";

const INVALID_COUPON_MESSAGE = "Coupon code is invalid or expired.";

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
}

export { CouponService };
export default new CouponService({ couponRepository });
