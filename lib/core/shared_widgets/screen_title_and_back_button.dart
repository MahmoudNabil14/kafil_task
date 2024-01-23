import 'package:flutter/material.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class ScreenTitleAndBackButton extends StatelessWidget {
  const ScreenTitleAndBackButton({
    super.key, required this.screenTitle,
  });
  final String screenTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.black,
          ),
        ),
        horizontalSpace(10),
        Text(
          screenTitle,
          style: TextStyles.font18BlackW600,
        )
      ],
    );
  }
}
