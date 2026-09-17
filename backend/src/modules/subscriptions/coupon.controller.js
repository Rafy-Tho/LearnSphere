import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import couponService from "./coupon.service.js";
import planService from "./plan.service.js";

class CouponController {
  constructor({ couponService, planService }) {
    this.couponService = couponService;
    this.planService = planService;
  }

  validateCoupon = asyncHandler(async (req, res) => {
    const plan = await this.planService.getPlan(req.body.plan_id);

    const result = await this.couponService.validate({
      code: req.body.code,
      plan,
      userId: req.session.user.id,
    });

    return sendSuccess(
      res,
      {
        code: result.coupon.code,
        discount_type: result.coupon.discount_type,
        discount_value: Number(result.coupon.discount_value),
        subtotal: result.subtotal,
        discount: result.discount,
        total: result.total,
        currency: result.currency,
      },
      { message: "Coupon applied successfully" },
    );
  });

  getCoupons = asyncHandler(async (req, res) => {
    const { coupons, pagination } = await this.couponService.getCoupons(
      req.query,
    );

    return sendSuccess(res, coupons, {
      message: "Coupons retrieved successfully",
      pagination,
    });
  });

  createCoupon = asyncHandler(async (req, res) => {
    const coupon = await this.couponService.createCoupon(req.body);

    return sendSuccess(res, coupon, {
      statusCode: StatusCode.CREATED,
      message: "Coupon created successfully",
    });
  });

  updateCoupon = asyncHandler(async (req, res) => {
    const coupon = await this.couponService.updateCoupon(
      req.params.couponId,
      req.body,
    );

    return sendSuccess(res, coupon, { message: "Coupon updated successfully" });
  });

  setCouponActive = asyncHandler(async (req, res) => {
    const coupon = await this.couponService.setCouponActive(
      req.params.couponId,
      req.body.is_active,
    );

    return sendSuccess(res, coupon, { message: "Coupon updated successfully" });
  });

  getRedemptions = asyncHandler(async (req, res) => {
    const { redemptions, pagination } = await this.couponService.getRedemptions(
      req.params.couponId,
      req.query,
    );

    return sendSuccess(res, redemptions, {
      message: "Coupon redemptions retrieved successfully",
      pagination,
    });
  });
}

export { CouponController };
export default new CouponController({ couponService, planService });
