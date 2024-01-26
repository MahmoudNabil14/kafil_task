import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/app_layout/logic/app_layout_state.dart';
import 'package:kafil_task/features/countries/ui/countries_screen.dart';
import 'package:kafil_task/features/services/ui/services_screen.dart';
import 'package:kafil_task/features/who_am_i/ui/who_am_i_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutState().init());

  List<BottomNavItem> bottomNavItems = [
    BottomNavItem(iconPath: "assets/svgs/who_am_i.svg", label: 'Who Am I'),
    BottomNavItem(iconPath: "assets/svgs/countries.svg", label: 'Countries'),
    BottomNavItem(iconPath: "assets/svgs/services.svg", label: 'Services'),
  ];
  List<String> appLayoutTitles = [
    "Who Am I",
    "Countries",
    "Services",
  ];
  List<Widget> appLayoutScreens =[
   const WhoAmIScreen(),
    const CountriesScreen(),
    const ServicesScreen(),
  ];
}

class BottomNavItem {
  final String iconPath;
  final String label;

  BottomNavItem({required this.iconPath, required this.label});
}
