import 'package:dashed_stepper/dashed_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int step = 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              DashedStepper(
                height: 30,
                icons: const [
                  Text("Register"),
                  Text("Complete Data"),
                ],
                length: 2,
                step: step,
                lineHeight: 2,
                disabledColor: ColorsManager.lighterGray,
                indicatorColor: ColorsManager.mainGreen,
                activeWidget: CircleAvatar(
                  radius: 17,
                  backgroundColor: ColorsManager.mainGreen,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: Text(
                      "1",
                      style: TextStyles.font12mainGreenW600,
                    ),
                  ),
                ),
                finishedWidget: const SizedBox(
                  width: 25,
                  height: 25,
                  child: Material(
                    shape: StadiumBorder(),
                    color: ColorsManager.mainGreen,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
                inActiveWidget: const CircleAvatar(
                  radius: 17,
                  backgroundColor: ColorsManager.moreLightGray,

                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
