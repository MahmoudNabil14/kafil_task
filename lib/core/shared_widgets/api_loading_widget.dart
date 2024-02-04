import 'package:flutter/material.dart';
import 'package:kafil_task/core/theming/colors.dart';

void showApiLoadingDialog({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.mainGreen,
      ),
    ),
  );
}