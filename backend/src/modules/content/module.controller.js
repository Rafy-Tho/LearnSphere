import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import moduleService from "./module.service.js";

class ModuleController {
  constructor({ moduleService }) {
    this.moduleService = moduleService;
  }

  createModule = asyncHandler(async (req, res) => {
    const courseModule = await this.moduleService.createModule({
      courseId: req.params.courseId,
      moduleData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, courseModule, {
      statusCode: StatusCode.CREATED,
      message: "Module created successfully",
    });
  });

  getModule = asyncHandler(async (req, res) => {
    const courseModule = await this.moduleService.getModule(req.params.moduleId);

    return sendSuccess(res, courseModule, {
      message: "Module retrieved successfully",
    });
  });

  updateModule = asyncHandler(async (req, res) => {
    const courseModule = await this.moduleService.updateModule(
      req.params.moduleId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, courseModule, {
      message: "Module updated successfully",
    });
  });

  deleteModule = asyncHandler(async (req, res) => {
    await this.moduleService.deleteModule(
      req.params.moduleId,
      req.session.user,
    );

    return sendSuccess(res, null, { message: "Module deleted successfully" });
  });
}

export { ModuleController };
export default new ModuleController({ moduleService });
