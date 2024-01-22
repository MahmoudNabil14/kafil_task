import 'package:flutter/material.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class RememberMeAndForgetPassword extends StatelessWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    bool rememberMe = true;
    return Row(
      children: [
        StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Checkbox(
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                });
          },
        ),
        horizontalSpace(10),
        Text(
          "Remember me",
          style: TextStyles.font12GrayW500,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password?",
            style: TextStyles.font12GrayW500,
          ),
        ),
      ],
    );
  }
}
