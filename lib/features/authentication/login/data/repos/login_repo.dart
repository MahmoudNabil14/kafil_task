import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/core/networking/api_result.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/features/authentication/login/data/models/login_request_body.dart';
import 'package:kafil_task/features/authentication/login/data/models/login_response.dart';

class LoginRepo{
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login({required LoginRequestBody loginRequestBody})async {
    final response =await _apiService.login(loginRequestBody);
    try{
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}