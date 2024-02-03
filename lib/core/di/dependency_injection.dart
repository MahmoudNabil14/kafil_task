import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafil_task/core/app_dependecies/data/repo/app_dependecies_repo.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_cubit.dart';
import 'package:kafil_task/core/networking/api_service.dart';
import 'package:kafil_task/core/networking/dio_factory.dart';
import 'package:kafil_task/features/app_layout/logic/app_layout_cubit.dart';
import 'package:kafil_task/features/authentication/login/data/repos/login_repo.dart';
import 'package:kafil_task/features/authentication/login/logic/login_cubit.dart';
import 'package:kafil_task/features/authentication/register/data/repo/register_repo.dart';
import 'package:kafil_task/features/authentication/register/logic/register_cubit.dart';
import 'package:kafil_task/features/services/data/repo/services_repo.dart';
import 'package:kafil_task/features/services/logic/services_cubit.dart';
import 'package:kafil_task/features/who_am_i/data/repo/who_am_i_repo.dart';
import 'package:kafil_task/features/who_am_i/logic/who_am_i_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //app dependencies
  getIt.registerLazySingleton<AppDependenciesRepo>(() => AppDependenciesRepo(getIt()));
  getIt.registerFactory<AppDependenciesCubit>(() => AppDependenciesCubit(getIt()));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  //who am i
  getIt.registerLazySingleton<WhoAmIRepo>(() => WhoAmIRepo(getIt()));
  getIt.registerFactory<WhoAmICubit>(() => WhoAmICubit(getIt()));

  //services
  getIt.registerLazySingleton<ServicesRepo>(() => ServicesRepo(getIt()));
  getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt()));

  //app layout
  getIt.registerLazySingleton<AppLayoutCubit>(() => AppLayoutCubit());
}
