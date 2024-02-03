import 'package:flutter/material.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class GenderRadioButtons extends StatelessWidget {
  const GenderRadioButtons({super.key, required this.selectedGenderCode});

  final int selectedGenderCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyles.font12GrayW500,
        ),
        verticalSpace(10),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: selectedGenderCode,
                  onChanged:null,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    return selectedGenderCode == 0 ? ColorsManager.mainGreen : ColorsManager.lighterGray;
                  }),
                ),
                Text(
                  "Male",
                  style: TextStyles.font14BlackW500,
                )
              ],
            ),
            horizontalSpace(20),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: selectedGenderCode,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    return selectedGenderCode == 1 ? ColorsManager.mainGreen : ColorsManager.lighterGray;
                  }), onChanged:null,
                ),
                Text(
                  "Female",
                  style: TextStyles.font14BlackW500,
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
