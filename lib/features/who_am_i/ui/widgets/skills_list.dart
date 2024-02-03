import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/who_am_i/data/models/who_am_i_response.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({
    super.key,
    required this.userSelectedSkills,
    required this.allSkills,
  });

  final List<Tags> userSelectedSkills;
  final List<Skill> allSkills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: TextStyles.font12GrayW500,
        ),
        verticalSpace(10),
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: ColorsManager.lightestGray,
            borderRadius: BorderRadius.circular(16.r),
          ),
          height: 130.h,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // change this number to display more or less items in a row
              childAspectRatio: 3, // change this number to control the aspect ratio of the items
            ),
            itemCount: userSelectedSkills.length,
            itemBuilder: (context, index) {
              return ChoiceChip(
                avatar: Icon(Icons.close, color: ColorsManager.mainGreen, size: 20.sp),
                showCheckmark: false,
                selectedColor: ColorsManager.moreLighterGreen,
                label: Text(
                  userSelectedSkills[index].name!,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font12MainGreenW500,
                ),
                selected: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
