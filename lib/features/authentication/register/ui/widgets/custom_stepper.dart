import 'package:dashed_stepper/dashed_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key, required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    const List<String> stepperSteps = ["Register", "Complete data"];
    return DashedStepper(
      height: 25.h,
      steps: stepperSteps.length,
      topStepsWidgets: List.generate(
        stepperSteps.length,
            (index) => Text(
          stepperSteps[index],
          style: currentStep > index ? TextStyles.font12mainGreenW600 : TextStyles.font12lighterGrayW500,
        ),
      ),
      currentStep: currentStep,
      lineHeight: 2,
      disabledColor: ColorsManager.lighterGray,
      indicatorColor: ColorsManager.mainGreen,
      activeWidget: CircleAvatar(
        radius: 12.r,
        backgroundColor: ColorsManager.mainGreen,
        child: CircleAvatar(
          radius: 10.r,
          backgroundColor: Colors.white,
          child: Text(
            currentStep.toString(),
            style: TextStyles.font12mainGreenW600,
          ),
        ),
      ),
      finishedWidget: CircleAvatar(
        radius: 12.r,
        backgroundColor: ColorsManager.mainGreen,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 18.spMin,
        ),
      ),
      inActiveWidget: CircleAvatar(
        radius: 12.r,
        backgroundColor: ColorsManager.moreLightGray,
      ),
    );
  }
}
