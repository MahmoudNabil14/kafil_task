import 'package:flutter/material.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';

class FirstNameAndLastName extends StatelessWidget {
  const FirstNameAndLastName({super.key, this.firstName, this.lastName});

  final String? firstName;
  final String? lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AppTextFormField(initialText: firstName, labelText: "First name", readOnly: true, validator: (value) {}),
        ),
        horizontalSpace(10),
        Expanded(
          child: AppTextFormField(initialText: lastName, labelText: "Last name", readOnly: true, validator: (value) {}),
        ),
      ],
    );
  }
}
