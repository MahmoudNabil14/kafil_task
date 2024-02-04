import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/core/networking/api_result.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/features/services/data/models/service_response_model.dart';

class ServicesRepo {
  final ApiService _apiService;

  ServicesRepo(this._apiService);

  Future<ApiResult<ServiceResponseModel>> getServices() async {
    try {
      final response = await _apiService.getServices();
      return ApiResult.success(response);

    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ServiceResponseModel>> getPopularServices() async {
    try {
      final response = await _apiService.getPopularServices();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}