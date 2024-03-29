import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/routing/routes.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/authentication/register/logic/register_cubit.dart';
import 'package:kafil_task/features/authentication/register/logic/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainGreen,
              ),
            ),
          );
        }, success: (registerResponse) {
          context.pop();
          showSuccessDialog(context);
          // context.pop();
        }, error: (error) {
          setupErrorState(context, error);
        });
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font14MainGreenW600,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'OK',
              style: TextStyles.font15BlackW500,
            ),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registered Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have registered successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: ColorsManager.mainGreen,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) => false);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }
}
