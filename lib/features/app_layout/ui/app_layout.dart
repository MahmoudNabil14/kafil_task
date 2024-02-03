import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/app_layout/logic/app_layout_cubit.dart';
import 'package:kafil_task/features/who_am_i/logic/who_am_i_cubit.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int navBarCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(context.read<AppLayoutCubit>().appLayoutTitles[navBarCurrentIndex], style: TextStyles.font18BlackW600),
              ),
              verticalSpace(30),
              context.read<AppLayoutCubit>().appLayoutScreens[navBarCurrentIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: navBarCurrentIndex,
        elevation: 10.h,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: true,
        onTap: (currentIndex) {
          setState(() {
            navBarCurrentIndex = currentIndex;
          });
        },
        selectedItemColor: ColorsManager.mainGreen,
        selectedLabelStyle: TextStyles.font12MainGreenW500,
        unselectedItemColor: ColorsManager.lighterGray,
        unselectedLabelStyle: TextStyles.font12lighterGrayW400,
        iconSize: 22.sp,
        items: List.generate(
          context.read<AppLayoutCubit>().bottomNavItems.length,
          (index) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                context.read<AppLayoutCubit>().bottomNavItems[index].iconPath,
                colorFilter: const ColorFilter.mode(ColorsManager.lighterGray, BlendMode.srcIn),
              ),
              label: context.read<AppLayoutCubit>().bottomNavItems[index].label,
              activeIcon: SvgPicture.asset(
                context.read<AppLayoutCubit>().bottomNavItems[index].iconPath,
                colorFilter: const ColorFilter.mode(
                  ColorsManager.mainGreen,
                  BlendMode.srcIn,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


