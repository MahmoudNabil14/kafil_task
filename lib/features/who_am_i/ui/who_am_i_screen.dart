import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_cubit.dart';
import 'package:kafil_task/core/app_dependecies/logic/app_dependencies_state.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/app_regex.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/who_am_i/data/models/who_am_i_response.dart';
import 'package:kafil_task/features/who_am_i/logic/who_am_i_cubit.dart';
import 'package:kafil_task/features/who_am_i/logic/who_am_i_state.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhoAmICubit, WhoAmIState>(
      builder: (context, state) {
        state.whenOrNull(loading: () {
          return const SizedBox();
        }, success: (whoAmIResponse) {
          print(whoAmIResponse.runtimeType);
          WhoAmIResponse userData = whoAmIResponse as WhoAmIResponse;
          return Column(
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
              BlocBuilder<AppDependenciesCubit, AppDependenciesState>(
                builder: (context, state) {
                  state.whenOrNull(loading: () {
                    return const SizedBox();
                  }, error: (error) {
                    return const SizedBox();
                  }, success: (appDependenciesResponse) {
                    AppDependenciesResponse appDependencies = appDependenciesResponse;
                    return Row(
                      children: appDependencies.userData.userTypes
                          .map(
                            (userType) => Row(
                              children: [
                                Radio(
                                  value: userType.value,
                                  groupValue: userData.userData.type!.code,
                                  onChanged: null,
                                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                                    return userType.value == userData.userData.type!.code ? ColorsManager.mainGreen : ColorsManager.lighterGray;
                                  }),
                                ),
                                Text(
                                  userType.label,
                                  style: TextStyles.font14BlackW500,
                                ),
                                horizontalSpace(20),
                              ],
                            ),
                          )
                          .toList(),
                    );
                  });
                  return const SizedBox.shrink();
                },
              ),
              verticalSpace(15),
              AppTextFormField(
                labelText: "About",
                maxLength: 1000,
                minLines: 4,
                initialText: userData.userData.about,
                textInputAction: TextInputAction.newline,
                validator: (value) {},
              ),
              AppTextFormField(initialText: userData.userData.salary.toString(), labelText: "Salary", readOnly: true, validator: (value) {}),
              verticalSpace(15),
              const BirthdateField(),
              verticalSpace(15),
              GenderRadioButtons(
                userGenderCode: userData.userData.gender!,
              ),
              //Skills
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Skills",
                    style: TextStyles.font12GrayW500,
                  ),
                  verticalSpace(10),
                  Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    padding: EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(
                      color: ColorsManager.lightestGray,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    height: 120.h,
                    child: StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) setState) {
                        return GridView(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          padding: const EdgeInsets.all(0.0),
                          shrinkWrap: true,
                          children: const [
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                            ChoiceChip(label: Text("data"), selected: true),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              verticalSpace(15),
              FavoriteSocialMedia(
                favoriteSocialMedia: userData.userData.favoriteSocialMedia!,
              ),
            ],
          );
        }, error: (error) {
          return const SizedBox();
        });
        return const SizedBox.shrink();
      },
    );
  }
}

class FavoriteSocialMedia extends StatelessWidget {
  const FavoriteSocialMedia({
    super.key,
    required this.favoriteSocialMedia,
  });

  final List<String> favoriteSocialMedia;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDependenciesCubit, AppDependenciesState>(
      builder: (context, state) {
        state.whenOrNull(
            loading: () {},
            success: (appDependenciesResponse) {
              AppDependenciesResponse appDependencies = appDependenciesResponse;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favorite Social Media",
                    style: TextStyles.font12GrayW500,
                  ),
                  verticalSpace(5),
                  ...appDependencies.userData.socialMedia.map((socialMedia) => Row(
                        children: [
                          Checkbox(
                            value: favoriteSocialMedia.contains(socialMedia.value),
                            onChanged: null,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                return favoriteSocialMedia.contains(socialMedia.value) ? ColorsManager.mainGreen : ColorsManager.white;
                              },
                            ),
                            side: BorderSide(width: 1.5.w, color: ColorsManager.lighterGray),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/svgs/${socialMedia.value}.svg",
                            height: 22.h,
                            width: 22.w,
                          ),
                          horizontalSpace(10),
                          Text(
                            socialMedia.label,
                            style: TextStyles.font14BlackW500,
                          ),
                        ],
                      ))
                ],
              );
            },
            error: (error) {});
        return const SizedBox.shrink();
      },
    );
  }
}

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

class GenderRadioButtons extends StatelessWidget {
  const GenderRadioButtons({super.key, required this.userGenderCode});

  final int userGenderCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDependenciesCubit, AppDependenciesState>(
      builder: (context, state) {
        state.whenOrNull(loading: () {
          return const SizedBox.shrink();
        }, success: (appDependenciesResponse) {
          AppDependenciesResponse appDependencies = appDependenciesResponse;
          Row(
            children: appDependencies.userData.userTypes
                .map((userType) => Row(
                      children: [
                        Radio(
                          value: userType.value,
                          groupValue: userGenderCode,
                          onChanged: null,
                          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                            return userGenderCode == userType.value ? ColorsManager.mainGreen : ColorsManager.lighterGray;
                          }),
                        ),
                        Text(
                          userType.label,
                          style: TextStyles.font14BlackW500,
                        ),
                        horizontalSpace(20),
                      ],
                    ))
                .toList(),
          );
        }, error: (error) {
          return const SizedBox.shrink();
        });
        return const SizedBox.shrink();
      },
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.profileAvatar,
  });

  final String profileAvatar;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return CircleAvatar(
          radius: 55.r,
          backgroundColor: ColorsManager.mainGreen,
          child: CircleAvatar(
            radius: 52.r,
            backgroundImage: const NetworkImage(
                "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=1380&t=st=1706140634~exp=1706141234~hmac=d738b3859e6cbdd9196a7e5487ed501339b0a5c217d9e665ae4fe1fa0ea4c4b2"),
          ),
        );
      },
    );
  }
}

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
