import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/theming/colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.profileAvatar,
  });

  final String profileAvatar;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return CircleAvatar(
          radius: 55.r,
          backgroundColor: ColorsManager.mainGreen,
          child: CircleAvatar(
            radius: 52.r,
            backgroundImage: NetworkImage(profileAvatar),
          ),
        );
      },
    );
  }
}
