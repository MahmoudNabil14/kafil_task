import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class FavoriteSocialMedia extends StatelessWidget {
  const FavoriteSocialMedia({
    super.key,
    required this.userFavoriteSocialMedia,
    required this.allSocialMedia,
  });

  final List<String> userFavoriteSocialMedia;
  final List<SocialMedia> allSocialMedia;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Favorite Social Media",
          style: TextStyles.font12GrayW500,
        ),
        verticalSpace(5),
        ...allSocialMedia.map((socialMedia) => Row(
          children: [
            Checkbox(
              value: userFavoriteSocialMedia.contains(socialMedia.value),
              onChanged: null,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                  return userFavoriteSocialMedia.contains(socialMedia.value) ? ColorsManager.mainGreen : ColorsManager.white;
                },
              ),
              side: BorderSide(width: 1.5.w, color: ColorsManager.lighterGray),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.r),
              ),
            ),
            SvgPicture.asset(
              "assets/svgs/${socialMedia.value}.svg",
              height: 22.h,
              width: 22.w,
            ),
            horizontalSpace(10),
            Text(
              socialMedia.label,
              style: TextStyles.font14BlackW500,
            ),
          ],
        ))
      ],
    );
  }
}
