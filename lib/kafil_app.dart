import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/app_dependecies/data/repo/app_dependecies_repo.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_cubit.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/routing/app_router.dart';
import 'package:kafil_task/core/theming/themes/light_theme.dart';

class KafilApp extends StatelessWidget {
  final AppRouter appRouter;
  const KafilApp({super.key, required this.appRouter,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider<AppDependenciesCubit>(
        create: (context) => AppDependenciesCubit(getIt<AppDependenciesRepo>())..emitAppDependenciesState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kafil Task',
          theme: lightTheme,
          onGenerateRoute: appRouter.generateRoute,

        ),
      ),
    );
  }
}
