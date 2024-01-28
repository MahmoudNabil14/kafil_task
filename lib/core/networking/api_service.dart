import 'dart:developer';

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
  @MultiPart()
  Future<RegisterResponse> register(
      @Part() String firstName,
      @Part() String lastName,
      @Part() String email,
      @Part() String password,
      @Part() String passwordConfirmation,
      @Part() String about,
      @Part() String birthDate,
      @Part() int userType,
      @Part() String gender,
      @Part() String salary,
      // @Part() List<String> tags,
      // @Part() List<String> favoriteSocialMedia,
      @Part(name: 'files') List<MultipartFile> avatar,
  );

  @GET(ApiConstants.appDependencies)

  Future<AppDependenciesResponse> getAppDependencies();

  @GET(ApiConstants.whoAmI)
  Future<WhoAmIResponse> whoAmI();
}
