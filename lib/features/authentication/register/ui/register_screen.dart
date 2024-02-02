import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_button.dart';
import 'package:kafil_task/core/shared_widgets/screen_title_and_back_button.dart';
import 'package:kafil_task/features/authentication/register/logic/register_cubit.dart';
import 'package:kafil_task/features/authentication/register/ui/widgets/app_dependencies_bloc_listener.dart';
import 'package:kafil_task/features/authentication/register/ui/widgets/complete_data_form.dart';
import 'package:kafil_task/features/authentication/register/ui/widgets/custom_stepper.dart';
import 'package:kafil_task/features/authentication/register/ui/widgets/form_validation_failed_text.dart';
import 'package:kafil_task/features/authentication/register/ui/widgets/register_bloc_listener.dart';
import 'package:kafil_task/features/authentication/register/ui/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool registerFormValidationFailed = false;
  bool completeDataFormValidationFailed = false;
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              const ScreenTitleAndBackButton(screenTitle: "Register"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if ((currentStep == 1 && registerFormValidationFailed) || currentStep == 2 && completeDataFormValidationFailed)
                        const FormValidationFailedText(),
                      CustomStepper(currentStep: currentStep),
                      verticalSpace(20),
                      if (currentStep == 1) const RegisterForm() else const CompleteDataForm(),
                      verticalSpace(35),
                      if (currentStep == 1)
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: AppTextButton(
                              buttonText: "Next",
                              onPressed: () {
                                if (context.read<RegisterCubit>().registerFormKey.currentState!.validate()) {
                                  setState(() {
                                    registerFormValidationFailed = false;
                                    currentStep = 2;
                                  });
                                } else {
                                  setState(() {
                                    registerFormValidationFailed = true;
                                  });
                                }
                              },
                              buttonWidth: MediaQuery.of(context).size.width / 3),
                        )
                      else
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: AppTextButton(
                            buttonText: "Submit",
                            onPressed: () async {
                              if (context.read<RegisterCubit>().completeDataFormKey.currentState!.validate() &&
                                  context.read<RegisterCubit>().selectedAvatar != null &&
                                  context.read<RegisterCubit>().selectedType != null &&
                                  context.read<RegisterCubit>().selectedTags.isNotEmpty &&
                                  context.read<RegisterCubit>().selectedFavoriteSocialMedia.isNotEmpty) {
                                setState(() {
                                  completeDataFormValidationFailed = false;
                                });

                                context.read<RegisterCubit>().emitRegisterStates();

                              } else {
                                setState(() {
                                  completeDataFormValidationFailed = true;
                                });
                              }
                            },
                          ),
                        ),
                      const AppDependenciesBlocListener(),
                      const RegisterBlocListener(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
