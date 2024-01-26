import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class FormValidationFailedText extends StatelessWidget {
  const FormValidationFailedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r), color: ColorsManager.lightestOrange),
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
      ],
    );
  }
}
