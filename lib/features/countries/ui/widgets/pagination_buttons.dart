import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/countries/logic/countries_cubit.dart';
import 'package:pagination_flutter/pagination.dart';

class PaginationButtons extends StatelessWidget {
  const PaginationButtons({super.key, required this.currentPage, required this.totalPages});
  final int currentPage, totalPages;
  @override
  Widget build(BuildContext context) {
    return Pagination(
      buttonsSize: context.screenWidth / 13,
      spacing: 3.w,
      numOfPages: totalPages,
      selectedPage: currentPage,
      pagesVisible: 3,
      onPageChanged: (pageIndex) {
        context.read<CountriesCubit>().emitCountriesState(pageNumber: pageIndex);
      },
      activeTextStyle: TextStyles.font12WhiteW500,
      inactiveTextStyle: TextStyles.font12BlackW500,
      previousIcon: SvgPicture.asset(
        "assets/svgs/previous_page_icon.svg",
        colorFilter: ColorFilter.mode(
            currentPage > 1 ? ColorsManager.black : ColorsManager.lighterGray,
            BlendMode.srcIn),
        height: 18.h,
        width: 18.w,
      ),
      nextIcon: SvgPicture.asset(
        "assets/svgs/next_page_icon.svg",
        colorFilter: ColorFilter.mode(
            currentPage < totalPages
                ? ColorsManager.black
                : ColorsManager.lighterGray,
            BlendMode.srcIn),
        height: 18.h,
        width: 18.w,
      ),
      firstIcon: SvgPicture.asset(
        "assets/svgs/first_page_icon.svg",
        colorFilter: ColorFilter.mode(
            currentPage > 1 ? ColorsManager.black : ColorsManager.lighterGray,
            BlendMode.srcIn),
        height: 18.h,
        width: 18.w,
      ),
      lastIcon: SvgPicture.asset(
        "assets/svgs/last_page_icon.svg",
        colorFilter: ColorFilter.mode(
            currentPage < totalPages
                ? ColorsManager.black
                : ColorsManager.lighterGray,
            BlendMode.srcIn),
        height: 18.h,
        width: 18.w,
      ),
      buttonsInactiveBorderColor: ColorsManager.lighterGray,
      activePageButtonColor: ColorsManager.mainGreen,
      buttonsBorderRadius: 7.r,
    );
  }
}
