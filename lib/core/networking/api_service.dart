import 'package:dio/dio.dart' hide Headers;
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/networking/api_constants.dart';
import 'package:kafil_task/features/authentication/login/data/models/login_request_body.dart';
import 'package:kafil_task/features/authentication/login/data/models/login_response.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_response.dart';
import 'package:kafil_task/features/services/data/models/service_response_model.dart';
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
  @Headers(<String, dynamic>{
  "Accept": "application/json",
  "Content-Type": "multipart/form-data",
  'Accept-Language': 'ar'
  })
  Future<RegisterResponse> register({
    @Part(name: "first_name") required String firstName,
    @Part(name: "last_name") required String lastName,
    @Part() required String email,
    @Part() required String password,
    @Part(name: "password_confirmation") required String passwordConfirmation,
    @Part(name: "type") required int userType,
    @Part(name: "avatar") required List<MultipartFile> files,
    @Part() required String about,
    @Part() required int salary,
    @Part(name: "birth_date") required String birthDate,
    @Part() int? gender,
    @Part(name: "tags[]") required List<String> tags,
    @Part(name: "favorite_social_media[]") required List<String> favoriteSocialMedia,
  });

  @GET(ApiConstants.appDependencies)
  Future<AppDependenciesResponse> getAppDependencies();

  @GET(ApiConstants.whoAmI)
  @Headers(<String, dynamic>{
    'Authorization': "{userAccessToken}",
    'Accept': 'application/json',
    'Accept-Language': 'ar'
  })
  Future<WhoAmIResponse> whoAmI(@Header('Authorization') String userAccessToken);

  @GET(ApiConstants.services)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Accept-Language': 'ar'
  })
  Future<ServiceResponseModel> getServices();

  @GET(ApiConstants.popularServices)
  Future<ServiceResponseModel> getPopularServices();
}
