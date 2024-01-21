import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/routing/app_router.dart';
import 'package:kafil_task/core/routing/routes.dart';
import 'features/authentication/login/ui/login_screen.dart';

class KafilApp extends StatelessWidget {
  final AppRouter appRouter;
  const KafilApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Kafil Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
        
      ),
    );
  }
}
