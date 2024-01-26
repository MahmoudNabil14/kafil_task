import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final int? minLines;
  final int? maxLength;
  final bool readOnly;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    required this.labelText,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.maxLength, this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyles.font12GrayW500,
        ),
        verticalSpace(10),
        TextFormField(
          minLines: minLines??1,
          maxLines: minLines??1,
          maxLength: maxLength,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          textInputAction: textInputAction,
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            counterText: "",
            isDense: true,
            contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.lightestGray,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.lightestGray,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            hintStyle: hintStyle ?? TextStyles.font12GrayW500,
            hintText: hintText,
            suffixIcon: suffixIcon,
            fillColor: backgroundColor ?? ColorsManager.lightestGray,
            filled: true,
          ),
          obscureText: isObscureText ?? false,
          style: TextStyles.font14DarkGrayW500,
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
