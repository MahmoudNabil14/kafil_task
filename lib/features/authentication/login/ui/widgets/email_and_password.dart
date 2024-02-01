import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/helpers/app_regex.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';
import 'package:kafil_task/features/authentication/login/logic/login_cubit.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    bool isObscureText = true;
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
                controller: context.read<LoginCubit>().emailController,
                textInputType: TextInputType.emailAddress,
                labelText: "Email Address",
                validator: (value) {
                  if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                    return "Email Address format is invalid";
                  }
                }),
            verticalSpace(30),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return AppTextFormField(
                  controller: context.read<LoginCubit>().passwordController,
                  labelText: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty || !AppRegex.passwordHasMinLength(value)) {
                      return "Password must be at least 8 characters";
                    }
                  },
                  isObscureText: isObscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
