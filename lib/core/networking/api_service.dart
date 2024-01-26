import 'package:dio/dio.dart' hide Headers;
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/networking/api_constants.dart';
import 'package:kafil_task/features/authentication/login/data/models/login_request_body.dart';
import 'package:kafil_task/features/authentication/login/data/models/login_response.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_request_body.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_response.dart';
import 'package:kafil_task/features/who_am_i/data/models/who_am_i_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.register)
  @Headers({
    'Accept': 'application/json',
    'Accept-Language': 'ar',
    'Content-Type': 'multipart/form-data',
  })
  Future<RegisterResponse> register(
      @Body() RegisterRequestBody registerRequestBody,
  );

  @GET(ApiConstants.appDependencies)

  Future<AppDependenciesResponse> getAppDependencies();

  @GET(ApiConstants.whoAmI)
  Future<WhoAmIResponse> whoAmI();
}
