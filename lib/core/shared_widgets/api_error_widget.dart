import 'package:flutter/material.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

void showApiErrorDialog({required BuildContext context, required String error}) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font14MainGreenW600,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'OK',
            style: TextStyles.font15BlackW500,
          ),
        ),
      ],
    ),
  );
}