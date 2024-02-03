import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';
import 'package:kafil_task/core/theming/colors.dart';

class BirthdateField extends StatelessWidget {
  const BirthdateField({
    super.key,
    this.birthDate,
  });

  final String? birthDate;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      initialText: birthDate,
      validator: (value) {},
      labelText: "Birthdate",
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.calendar_month_outlined,
          color: ColorsManager.lightGray,
          size: 20.sp,
        ),
      ),
    );
  }
}
