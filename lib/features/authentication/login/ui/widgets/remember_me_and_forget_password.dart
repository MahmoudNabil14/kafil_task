import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class RememberMeAndForgetPassword extends StatelessWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;
    return Row(
      children: [
        StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return Checkbox(
                activeColor: ColorsManager.mainGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.r),
                ),
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                });
          },
        ),
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
