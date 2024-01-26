import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_cubit.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/constants.dart';
import 'package:kafil_task/core/routing/routes.dart';
import 'package:kafil_task/features/app_layout/logic/app_layout_cubit.dart';
import 'package:kafil_task/features/app_layout/ui/app_layout.dart';
import 'package:kafil_task/features/authentication/login/logic/login_cubit.dart';
import 'package:kafil_task/features/authentication/login/ui/login_screen.dart';
import 'package:kafil_task/features/authentication/register/logic/register_cubit.dart';
import 'package:kafil_task/features/authentication/register/ui/register_screen.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.initialRoute:
        return userAccessToken!=null ?MaterialPageRoute(
          builder: (_) => BlocProvider<AppLayoutCubit>(create: (BuildContext context) {
            return getIt<AppLayoutCubit>();
          },
              child: const AppLayout()),
        ):MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (BuildContext context) {
              return getIt<LoginCubit>();
            },
            child: const LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<RegisterCubit>(
                create: (BuildContext context) {
                  return getIt<RegisterCubit>();
                },
              ),
              BlocProvider<AppDependenciesCubit>(
                create: (BuildContext context) {
                  return getIt<AppDependenciesCubit>()..emitAppDependenciesState();
                },
              ),
            ],
            child: const RegisterScreen(),
          ),
        );
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AppLayoutCubit>(create: (BuildContext context) {
            return getIt<AppLayoutCubit>();
          },
          child: const AppLayout()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
