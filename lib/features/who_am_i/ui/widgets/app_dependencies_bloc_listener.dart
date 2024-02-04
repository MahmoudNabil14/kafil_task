import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_cubit.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_state.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/shared_widgets/api_error_widget.dart';
import 'package:kafil_task/core/shared_widgets/api_loading_widget.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class AppDependenciesBlocListener extends StatelessWidget {
  const AppDependenciesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppDependenciesCubit, AppDependenciesState>(
      listener: (context, state) {
        state.whenOrNull(appDependenciesLoading: () {
         showApiLoadingDialog(context: context);
        }, appDependenciesSuccess: (appDependencies) {
          context.pop();
        }, appDependenciesError: (error) {
          showApiErrorDialog(context:context, error:error);
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}
