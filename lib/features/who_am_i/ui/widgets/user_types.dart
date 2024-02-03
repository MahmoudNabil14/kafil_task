import 'package:flutter/material.dart';
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/who_am_i/data/models/who_am_i_response.dart';

class UserTypes extends StatelessWidget {
  const UserTypes({
    super.key,
    required this.appDependencies,
    required this.userData,
  });

  final AppDependenciesResponse appDependencies;
  final WhoAmIResponse userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User Type",
          style: TextStyles.font12GrayW500,
        ),
        verticalSpace(10),
        Row(
          children: appDependencies.userData.userTypes
              .map(
                (userType) => Row(
              children: [
                Radio(
                  value: userType.value,
                  groupValue: userData.userData.type!.code,
                  onChanged: null,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    return userType.value == userData.userData.type!.code ? ColorsManager.mainGreen : ColorsManager.lighterGray;
                  }),
                ),
                Text(
                  userType.label,
                  style: TextStyles.font14BlackW500,
                ),
                horizontalSpace(20),
              ],
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}
