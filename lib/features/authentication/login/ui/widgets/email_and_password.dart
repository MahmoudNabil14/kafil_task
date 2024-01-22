import 'package:flutter/material.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    bool isObscureText = true;
    return Form(
        child: Column(
      children: [
        AppTextFormField(
            labelText: "Email Address", validator: (String? value) {}),
        verticalSpace(30),
        StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return AppTextFormField(
            labelText: "Password",
            validator: (String? value) {},
            isObscureText: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon( isObscureText? Icons.visibility_off:Icons.visibility),
            ),
          );
        },

        ),
      ],
    ));
  }
}
