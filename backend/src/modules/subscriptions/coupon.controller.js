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
}

export { CouponController };
export default new CouponController({ couponService, planService });
