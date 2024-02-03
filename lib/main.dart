import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/bloc_observer.dart';
import 'package:kafil_task/core/helpers/constants.dart';
import 'package:kafil_task/core/helpers/secure_cache_service.dart';
import 'package:kafil_task/core/routing/app_router.dart';
import 'package:kafil_task/kafil_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  await SecureCacheService.init();
  userAccessToken = await SecureCacheService.getData(
    key: "userAccessToken",
  );
  setupGetIt();
  Bloc.observer = AppBlocObserver();
  runApp(KafilApp(
    appRouter: AppRouter(),
  ));
}
