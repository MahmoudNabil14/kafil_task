import 'package:dio/dio.dart';
import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/core/networking/api_result.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_request_body.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_response.dart';

class RegisterRepo{
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponse>> register({required String firstName, required String lastName,required String email, required String password, required String passwordConfirmation, required String about, required String birthDate, required int type, required MultipartFile avatar, required String salary, required String gender})async{
    final response = await _apiService.register(firstName,lastName,email, password,passwordConfirmation, about, birthDate, type, gender, salary,[avatar]);
    try{
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
}