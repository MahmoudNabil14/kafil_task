import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/routing/routes.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(children: [
      TextSpan(text: "Don’t have an account? ", style: TextStyles.font14GrayW500),
      TextSpan(text: "Register ", style: TextStyles.font14MainGreenW600,recognizer: TapGestureRecognizer()
        ..onTap = () {
          context.pushReplacementNamed(Routes.registerScreen);
        },),
    ]));
  }
}
