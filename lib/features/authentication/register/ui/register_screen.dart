import 'package:dashed_stepper/dashed_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/screen_title_and_back_button.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> stepperSteps = ["Register", "Complete data"];
    int currentStep = 2;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              const ScreenTitleAndBackButton(screenTitle: "Register"),
              Container(
                // height: 35.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: ColorsManager.lightestOrange),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 23.spMin,
                      color: ColorsManager.lighterOrange,
                    ),
                    horizontalSpace(10),
                    Text(
                      "Fill the required fields",
                      style: TextStyles.font12lighterOrangeW500,
                    )
                  ],
                ),
              ),
              verticalSpace(25),
              Expanded(
                child: Column(
                  children: [
                    DashedStepper(
                        height: 25.h,
                        steps: stepperSteps.length,
                        topStepsWidgets: List.generate(
                            stepperSteps.length,
                            (index) => Text(
                                  stepperSteps[index],
                                  style: currentStep > index
                                      ? TextStyles.font12mainGreenW600
                                      : TextStyles.font12lighterGrayW500,
                                )),
                        currentStep: currentStep,
                        lineHeight: 2,
                        disabledColor: ColorsManager.lighterGray,
                        indicatorColor: ColorsManager.mainGreen,
                        activeWidget: CircleAvatar(
                          radius: 17.r,
                          backgroundColor: ColorsManager.mainGreen,
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundColor: Colors.white,
                            child: Text(
                              currentStep.toString(),
                              style: TextStyles.font12mainGreenW600,
                            ),
                          ),
                        ),
                        finishedWidget: CircleAvatar(
                          radius: 17.r,
                          backgroundColor: ColorsManager.mainGreen,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18.spMin,
                          ),
                        ),
                        inActiveWidget: CircleAvatar(
                          radius: 17.r,
                          backgroundColor: ColorsManager.moreLightGray,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
