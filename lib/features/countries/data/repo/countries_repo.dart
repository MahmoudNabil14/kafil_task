import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/core/networking/api_result.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/features/countries/data/models/countries_response_model.dart';

class CountriesRepo {
  final ApiService _apiService;

  CountriesRepo(this._apiService);

  Future<ApiResult<CountriesResponseModel>> getCountries({required int pageNumber}) async {
    try {
      final response = await _apiService.getCountries(pageNumber);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
