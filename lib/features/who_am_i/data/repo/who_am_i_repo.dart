import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/core/networking/api_result.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/features/who_am_i/data/models/who_am_i_response.dart';

class WhoAmIRepo{
  final ApiService _apiService;

  WhoAmIRepo(this._apiService);

  Future<ApiResult<WhoAmIResponse>> whoAmI()async{
    final response = await _apiService.whoAmI();
    try{
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}