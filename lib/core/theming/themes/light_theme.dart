import 'package:flutter/material.dart';
import 'package:kafil_task/core/theming/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: "Montserrat",
  colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.mainGreen),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
);