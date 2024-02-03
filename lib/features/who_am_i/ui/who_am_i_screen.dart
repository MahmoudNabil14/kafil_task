import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_cubit.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_state.dart' as ads;
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/who_am_i/data/models/who_am_i_response.dart';
import 'package:kafil_task/features/who_am_i/logic/who_am_i_cubit.dart';
import 'package:kafil_task/features/who_am_i/logic/who_am_i_state.dart';
import 'widgets/birthdate.dart';
import 'widgets/favorite_social_media.dart';
import 'widgets/first_and_last_name.dart';
import 'widgets/gender_radio_buttons.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/skills_list.dart';
import 'widgets/user_types.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppDependenciesCubit, ads.AppDependenciesState>(
      listener: (BuildContext context, ads.AppDependenciesState state) {},
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          appDependenciesLoading: () {
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   print("hello world");
            //   showApiLoadingDialog(context: context);
            // });
            return const CircularProgressIndicator();
          },
          appDependenciesSuccess: (appDependenciesResponse) {
            // context.pop();
            AppDependenciesResponse appDependencies = appDependenciesResponse;
            return BlocProvider(
              create: (context) => getIt<WhoAmICubit>()..emitWhoAmIStates(),
              child: BlocBuilder<WhoAmICubit, WhoAmIState>(
                builder: (context, state) {
                  return state.when(loading: () {
                    return const CircularProgressIndicator();
                  }, success: (whoAmIResponse) {
                    WhoAmIResponse userData = whoAmIResponse as WhoAmIResponse;
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            verticalSpace(10),
                            ProfileAvatar(profileAvatar: userData.userData.avatar ?? ""),
                            verticalSpace(20),
                            FirstNameAndLastName(
                              firstName: userData.userData.firstName,
                              lastName: userData.userData.lastName,
                            ),
                            verticalSpace(15),
                            AppTextFormField(initialText: userData.userData.email, labelText: "Email Address", readOnly: true, validator: (value) {}),
                            verticalSpace(15),
                            UserTypes(appDependencies: appDependencies, userData: userData),
                            verticalSpace(15),
                            AppTextFormField(
                              labelText: "About",
                              readOnly: true,
                              maxLength: 1000,
                              minLines: 4,
                              initialText: userData.userData.about,
                              textInputAction: TextInputAction.newline,
                              validator: (value) {},
                            ),
                            verticalSpace(15),
                            AppTextFormField(
                                initialText: userData.userData.salary.toString(), labelText: "Salary", readOnly: true, validator: (value) {}),
                            verticalSpace(15),
                            const BirthdateField(),
                            verticalSpace(15),
                            GenderRadioButtons(
                              selectedGenderCode: userData.userData.gender!,
                            ),
                            SkillsList(
                              userSelectedSkills: userData.userData.tags!,
                              allSkills: appDependencies.userData.userSkills,
                            ),
                            verticalSpace(15),
                            FavoriteSocialMedia(
                              userFavoriteSocialMedia: userData.userData.favoriteSocialMedia!,
                              allSocialMedia: appDependencies.userData.socialMedia,
                            ),
                          ],
                        ),
                      ),
                    );
                  }, error: (error) {
                    return Text(error, style: TextStyles.font14RedW500);
                  }, initial: () {
                    return const SizedBox.shrink();
                  });
                },
              ),
            );
          },
          appDependenciesError: (error) {
            // WidgetsBinding.instance.addPostFrameCallback(
            //   (_) {
            //     showApiErrorDialog(context: context, error: error);
            //   },
            // );
            return Text(error, style: TextStyles.font14RedW500);
          },
        );
      },
    );
  }
}
