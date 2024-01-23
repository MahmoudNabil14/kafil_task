import 'package:dashed_stepper/dashed_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/shared_widgets/screen_title_and_back_button.dart';
import 'package:kafil_task/core/theming/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                step: 3,
                lineHeight: 2,
                dotSize: 35,
                disabledColor: ColorsManager.lighterGray,

                indicatorColor: ColorsManager.mainGreen, stepIcon: SizedBox(
                width: 35, height: 35,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
