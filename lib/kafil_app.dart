import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/routing/app_router.dart';
import 'package:kafil_task/core/routing/routes.dart';
import 'package:kafil_task/core/theming/themes/light_theme.dart';

class KafilApp extends StatelessWidget {
  final AppRouter appRouter;
  const KafilApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kafil Task',
        theme: lightTheme,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute,
        
      ),
    );
  }
}
