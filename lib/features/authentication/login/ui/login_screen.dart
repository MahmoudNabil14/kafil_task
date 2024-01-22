import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/authentication/login/ui/widgets/email_and_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorsManager.black,
                  ),
                ),
                horizontalSpace(20),
                Text("Account Login", style: TextStyles.font18BlackW600,)
              ],
            ),
            verticalSpace(30),
            SvgPicture.asset("assets/svgs/login_image.svg"),
            verticalSpace(20),
            const EmailAndPassword(),
          ],
        ),
      )),
    );
  }
}
