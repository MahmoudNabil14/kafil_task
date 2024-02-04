import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class CountryRow extends StatelessWidget {
  const CountryRow({super.key, required this.country, required this.capital});

  final String country;
  final String capital;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              country,
              style: TextStyles.font14BlackW500,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Text(capital, style: TextStyles.font14BlackW500, overflow: TextOverflow.ellipsis, maxLines: capital.contains(" ") ? 2 : 1),
          ),
        ],
      ),
    );
  }
}
