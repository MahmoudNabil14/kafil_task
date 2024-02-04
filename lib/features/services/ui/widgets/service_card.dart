import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key, required this.price, required this.averageRating, required this.completedSalesCount, required this.title, required this.mainImage});

  final int price, averageRating, completedSalesCount;
  final String title, mainImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: context.screenWidth / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ColorsManager.shadowColor.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(5.sp),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: ColorsManager.lighterGray),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                          imageUrl: mainImage,
                          errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.sp),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                        decoration: BoxDecoration(
                          color: ColorsManager.mainGreen,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Text(
                          "\$$price",
                          textAlign: TextAlign.center,
                          style: TextStyles.font12WhiteW500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title.toString(),
                        style: TextStyles.font13BlackW500,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: ColorsManager.lighterGold,
                            size: 25.sp,
                          ),
                          horizontalSpace(5),
                          Text(
                            "($averageRating)",
                            style: TextStyles.font13lighterGoldW400,
                          ),
                          Container(
                            height: 15.h,
                            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                            width: 1.w,
                            color: ColorsManager.lighterGray,
                          ),
                          SvgPicture.asset(
                            "assets/svgs/service_icon.svg",
                            width: 20.w,
                          ),
                          horizontalSpace(5),
                          Text(
                            completedSalesCount.toString(),
                            style: TextStyles.font13mediumGrayW400,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
