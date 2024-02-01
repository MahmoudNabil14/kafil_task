import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/helpers/app_regex.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/features/authentication/register/logic/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool passwordIsObscure = true;
    bool confirmPasswordIsObscure = true;
    return Form(
      key: context.read<RegisterCubit>().registerFormKey,
      child: Column(
        children: [
          const FirstNameAndLastName(),
          verticalSpace(15),
          AppTextFormField(
              controller: context.read<RegisterCubit>().emailController,
              textInputType: TextInputType.emailAddress,
              labelText: "Email Address",
              maxLength: 64,
              validator: (value) {
                if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                  return "";

                  return "Email Address format is invalid";
                }
              }),
          verticalSpace(15),
          //Password field
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return AppTextFormField(
                controller: context.read<RegisterCubit>().passwordController,
                labelText: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty || !AppRegex.passwordHasMinLength(value)) {
                    return "";

                    return "Password must be at least 8 characters";
                  }
                },
                isObscureText: passwordIsObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordIsObscure = !passwordIsObscure;
                    });
                  },
                  icon: Icon(passwordIsObscure ? Icons.visibility_off : Icons.visibility),
                ),
              );
            },
          ),
          verticalSpace(15),
          //Confirm password field
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return AppTextFormField(
                controller: context.read<RegisterCubit>().confirmPasswordController,
                labelText: "Confirm password",
                validator: (value) {
                  if (value == null || value.isEmpty || !AppRegex.passwordHasMinLength(value)) {
                    return "";

                    return "Password must be at least 8 characters";
                  } else if (context.read<RegisterCubit>().passwordController.text != context.read<RegisterCubit>().confirmPasswordController.text) {
                    return "";

                    return "Passwords don't match";
                  }
                },
                isObscureText: confirmPasswordIsObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      confirmPasswordIsObscure = !confirmPasswordIsObscure;
                    });
                  },
                  icon: Icon(confirmPasswordIsObscure ? Icons.visibility_off : Icons.visibility),
                ),
              );
            },
          ),
          verticalSpace(15),
          const UserTypesDropDown()
        ],
      ),
    );
  }
}

class UserTypesDropDown extends StatelessWidget {
  const UserTypesDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return AppTextFormField(
          readOnly: true,
          controller: context.read<RegisterCubit>().userTypeController,
            validator: (value) {
            if(value == null || value.isEmpty){
              return "";
            }
            },
            labelText: "User Type",
            suffixIcon: PopupMenuButton<int>(
              color: ColorsManager.lightestGray,
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: ColorsManager.lighterGray,
                size: 28.sp,
              ),
              onSelected: (int type) {
                setState(() {
                  context.read<RegisterCubit>().userTypeController.text = context.read<RegisterCubit>().userTypes[type - 1].type;
                  context.read<RegisterCubit>().selectedType = context.read<RegisterCubit>().userTypes[type - 1];
                });
              },
              itemBuilder: (BuildContext context) => context.read<RegisterCubit>().userTypes.map((userType) {
                return PopupMenuItem<int>(
                  value: userType.id,
                  child: Text(userType.type),
                );
              }).toList(),
            ));
      },
    );
  }
}

class FirstNameAndLastName extends StatelessWidget {
  const FirstNameAndLastName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AppTextFormField(
              controller: context.read<RegisterCubit>().firstNameController,
              labelText: "First name",
              maxLength: 50,
              validator: (value) {
                if (value == null || value.isEmpty || !AppRegex.isNameValid(value)) {
                  // return "First name format is invalid";
                  return "";
                }
              }),
        ),
        horizontalSpace(10),
        Expanded(
          child: AppTextFormField(
              controller: context.read<RegisterCubit>().lastNameController,
              labelText: "Last name",
              maxLength: 50,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                  // return "First name format is invalid";
                }
              }),
        ),
      ],
    );
  }
}
