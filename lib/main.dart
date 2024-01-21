import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/routing/app_router.dart';
import 'package:kafil_task/kafil_app.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(KafilApp(appRouter: AppRouter(),));
}


