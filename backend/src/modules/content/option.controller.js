import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import optionService from "./option.service.js";

class OptionController {
  constructor({ optionService }) {
    this.optionService = optionService;
  }

  createOption = asyncHandler(async (req, res) => {
    const option = await this.optionService.createOption({
      questionId: req.params.questionId,
      optionData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, option, {
      statusCode: StatusCode.CREATED,
      message: "Answer created successfully",
    });
  });

  updateOption = asyncHandler(async (req, res) => {
    const option = await this.optionService.updateOption(
      req.params.optionId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, option, { message: "Answer updated successfully" });
  });

  deleteOption = asyncHandler(async (req, res) => {
    await this.optionService.deleteOption(
      req.params.optionId,
      req.session.user,
    );

    return sendSuccess(res, null, { message: "Answer deleted successfully" });
  });
}

export { OptionController };
export default new OptionController({ optionService });
