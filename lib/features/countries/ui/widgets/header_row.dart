import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        color: ColorsManager.lightestGray,
      ),
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
      child: Row(children: [
        Expanded(child: Text('Country', style: TextStyles.font14GrayW600)),
        const Spacer(),
        Expanded(child: Text('Capital', style: TextStyles.font14GrayW600)),
      ]),
    );
  }
}
