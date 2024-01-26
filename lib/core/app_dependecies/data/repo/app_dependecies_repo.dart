import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/core/networking/api_result.dart';
import 'package:kafil_task/core/networking/api_service.dart';

class AppDependenciesRepo{
  final ApiService _apiService;

  AppDependenciesRepo(this._apiService);

  Future<ApiResult<AppDependenciesResponse>> getAppDependencies()async{
    final response = await _apiService.getAppDependencies();
    try{
     return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));

    }

  }
}
