import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/helpers/constants.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/helpers/secure_cache_service.dart';
import 'package:kafil_task/core/routing/routes.dart';
import 'package:kafil_task/core/shared_widgets/api_error_widget.dart';
import 'package:kafil_task/core/shared_widgets/api_loading_widget.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/authentication/login/data/models/login_response.dart';
import 'package:kafil_task/features/authentication/login/logic/login_cubit.dart';
import 'package:kafil_task/features/authentication/login/logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showApiLoadingDialog(context: context);

        }, success: (loginResponse) {
          userAccessToken = (loginResponse as LoginResponse).accessToken;
          SecureCacheService.saveData(key: "userAccessToken", value: userAccessToken);
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.appLayout, predicate: (Route<dynamic> route) { return false; });
        }, error: (error) {
          showApiErrorDialog(context: context, error: error);
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}
