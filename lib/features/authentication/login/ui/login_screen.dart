import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_button.dart';
import 'package:kafil_task/core/shared_widgets/screen_title_and_back_button.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/authentication/login/logic/login_cubit.dart';
import 'package:kafil_task/features/authentication/login/ui/widgets/dont_have_an_account_widget.dart';
import 'package:kafil_task/features/authentication/login/ui/widgets/email_and_password.dart';
import 'package:kafil_task/features/authentication/login/ui/widgets/login_bloc_listener.dart';
import 'package:kafil_task/features/authentication/login/ui/widgets/remember_me_and_forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
                child:
                    Text("Account Login", style: TextStyles.font18BlackW600)),
            verticalSpace(30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svgs/login_image.svg"),
                    verticalSpace(20),
                    const EmailAndPassword(),
                    const RememberMeAndForgetPassword(),
                    verticalSpace(30),
                    AppTextButton(
                      buttonText: 'Login',
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(30),
                    const DontHaveAnAccountText(),
                    const LoginBlocListener()
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
