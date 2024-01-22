import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/core/networking/dio_factory.dart';
import 'package:kafil_task/features/authentication/login/data/repos/login_repo.dart';
import 'package:kafil_task/features/authentication/login/logic/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
