import 'package:dio/dio.dart';
import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/core/networking/api_result.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_request_body.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_response.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponse>> register({required RegisterRequestBody registerRequestBody}) async {
    try {
      final response = await _apiService.register(
          firstName: registerRequestBody.firstName,
          lastName: registerRequestBody.lastName,
          email: registerRequestBody.email,
          password: registerRequestBody.password,
          passwordConfirmation: registerRequestBody.confirmPassword,
          userType: registerRequestBody.userType,
          files: [registerRequestBody.avatar!],
          about: registerRequestBody.about,
          salary: registerRequestBody.salary,
          birthDate: registerRequestBody.brithDate,
          gender: registerRequestBody.gender,
          tags: registerRequestBody.tags,
          favoriteSocialMedia: registerRequestBody.favoriteSocialMedia);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
