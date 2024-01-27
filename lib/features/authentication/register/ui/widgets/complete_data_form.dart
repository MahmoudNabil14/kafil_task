import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/app_regex.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/shared_widgets/app_text_form_field.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/authentication/register/logic/register_cubit.dart';

class CompleteDataForm extends StatelessWidget {
  const CompleteDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();
    return Form(
      key: context.read<RegisterCubit>().completeDataFormKey,
      child: Column(
        children: [
          verticalSpace(10),
          ProfileAvatar(picker: picker),
          verticalSpace(20),
          AppTextFormField(
            controller: context.read<RegisterCubit>().aboutController,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isAboutValid(value)) {
                return "";
              }
            },
            labelText: "About",
            maxLength: 1000,
            minLines: 4,
            textInputAction: TextInputAction.newline,
          ),
          verticalSpace(15),
          const SalaryField(),
          verticalSpace(15),
          const BirthdateField(),
          verticalSpace(15),
          const GenderRadioButtons(),
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
          const FavoriteSocialMedia(),
        ],
      ),
    );
  }
}

class FavoriteSocialMedia extends StatelessWidget {
  const FavoriteSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorite Social Media",
              style: TextStyles.font12GrayW500,
            ),
            verticalSpace(5),
            Row(
              children: [
                Checkbox(
                  value: context.read<RegisterCubit>().favoriteSocialMedia.contains("facebook"),
                  onChanged: (isSelected) {
                    setState(() {
                      context.read<RegisterCubit>().favoriteSocialMedia.contains("facebook")
                          ? context.read<RegisterCubit>().favoriteSocialMedia.remove("facebook")
                          : context.read<RegisterCubit>().favoriteSocialMedia.add("facebook");
                    });
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      return context.read<RegisterCubit>().favoriteSocialMedia.contains("facebook") ? ColorsManager.mainGreen : ColorsManager.white;
                    },
                  ),
                  side: BorderSide(width: 1.5.w, color: ColorsManager.lighterGray),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                SvgPicture.asset(
                  "assets/svgs/facebook.svg",
                  height: 22.h,
                  width: 22.w,
                ),
                horizontalSpace(10),
                Text(
                  "Facebook",
                  style: TextStyles.font14BlackW500,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: context.read<RegisterCubit>().favoriteSocialMedia.contains("x"),
                  onChanged: (isSelected) {
                    setState(() {
                      context.read<RegisterCubit>().favoriteSocialMedia.contains("x")
                          ? context.read<RegisterCubit>().favoriteSocialMedia.remove("x")
                          : context.read<RegisterCubit>().favoriteSocialMedia.add("x");
                    });
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      return context.read<RegisterCubit>().favoriteSocialMedia.contains("x") ? ColorsManager.mainGreen : Colors.white;
                    },
                  ),
                  side: BorderSide(width: 1.5.w, color: ColorsManager.lighterGray),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                SvgPicture.asset(
                  "assets/svgs/twitter.svg",
                  height: 22.h,
                  width: 22.w,
                ),
                horizontalSpace(10),
                Text(
                  "Twitter",
                  style: TextStyles.font14BlackW500,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: context.read<RegisterCubit>().favoriteSocialMedia.contains("instagram"),
                  onChanged: (isSelected) {
                    setState(() {
                      context.read<RegisterCubit>().favoriteSocialMedia.contains("instagram")
                          ? context.read<RegisterCubit>().favoriteSocialMedia.remove("instagram")
                          : context.read<RegisterCubit>().favoriteSocialMedia.add("instagram");
                    });
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      return context.read<RegisterCubit>().favoriteSocialMedia.contains("instagram") ? ColorsManager.mainGreen : ColorsManager.white;
                    },
                  ),
                  side: BorderSide(width: 1.5.w, color: ColorsManager.lighterGray),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                SvgPicture.asset(
                  "assets/svgs/instagram.svg",
                  height: 22.h,
                  width: 22.w,
                ),
                horizontalSpace(10),
                Text(
                  "Instagram",
                  style: TextStyles.font14BlackW500,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class BirthdateField extends StatelessWidget {
  const BirthdateField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: context.read<RegisterCubit>().birthDateController,
      validator: (value) {},
      labelText: "Birthdate",
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: () {
          showDatePicker(
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDatePickerMode: DatePickerMode.day,
            helpText: "Select your birthdate",
            context: context,
            firstDate: DateTime.now().subtract(
              const Duration(days: 29200),
            ),
            initialDate: DateTime(1990, 1, 1),
            lastDate: DateTime.now().subtract(
              const Duration(days: 1),
            ),
          ).then((selectedDate) {
            if (selectedDate != null) {
              context.read<RegisterCubit>().birthDateController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
            }
          });
        },
        icon: Icon(
          Icons.calendar_month_outlined,
          color: ColorsManager.lightGray,
          size: 20.sp,
        ),
      ),
    );
  }
}

class SalaryField extends StatelessWidget {
  const SalaryField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Salary",
          style: TextStyles.font12GrayW500,
        ),
        verticalSpace(10),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.lightestGray,
            borderRadius: BorderRadius.circular(16.r),
          ),
          height: 55.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.w,
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: context.read<RegisterCubit>().salary > 100
                          ? () {
                              setState(() {
                                context.read<RegisterCubit>().salary -= 100;
                              });
                            }
                          : null,
                      icon: CircleAvatar(
                        radius: 13.r,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.remove,
                          color: ColorsManager.mainGreen,
                        ),
                      ),
                    ),
                    Text(
                      "SAR ${context.read<RegisterCubit>().salary}",
                      style: TextStyles.font14DarkGrayW500,
                    ),
                    IconButton(
                      onPressed: context.read<RegisterCubit>().salary < 1000
                          ? () {
                              setState(() {
                                context.read<RegisterCubit>().salary += 100;
                              });
                            }
                          : null,
                      icon: CircleAvatar(
                        radius: 13.r,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.add,
                          color: ColorsManager.mainGreen,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class GenderRadioButtons extends StatelessWidget {
  const GenderRadioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyles.font12GrayW500,
        ),
        verticalSpace(10),
        StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: context.read<RegisterCubit>().selectedGender,
                      onChanged: (selectedGender) {
                        if (selectedGender != context.read<RegisterCubit>().selectedGender) {
                          setState(() {
                            context.read<RegisterCubit>().selectedGender = selectedGender!;
                          });
                        }
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return context.read<RegisterCubit>().selectedGender == 0 ? ColorsManager.mainGreen : ColorsManager.lighterGray;
                      }),
                    ),
                    Text(
                      "Male",
                      style: TextStyles.font14BlackW500,
                    )
                  ],
                ),
                horizontalSpace(20),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: context.read<RegisterCubit>().selectedGender,
                      onChanged: (selectedGender) {
                        if (selectedGender != context.read<RegisterCubit>().selectedGender) {
                          setState(() {
                            context.read<RegisterCubit>().selectedGender = selectedGender!;
                          });
                        }
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return context.read<RegisterCubit>().selectedGender == 1 ? ColorsManager.mainGreen : ColorsManager.lighterGray;
                      }),
                    ),
                    Text(
                      "Female",
                      style: TextStyles.font14BlackW500,
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.picker});

  final ImagePicker picker;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 55.r,
              backgroundColor: ColorsManager.mainGreen,
              child: CircleAvatar(
                radius: 52.r,
                backgroundImage: context.read<RegisterCubit>().selectedAvatar != null
                    ? FileImage(context.read<RegisterCubit>().selectedAvatar!)
                    : const NetworkImage(
                            "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=1380&t=st=1706140634~exp=1706141234~hmac=d738b3859e6cbdd9196a7e5487ed501339b0a5c217d9e665ae4fe1fa0ea4c4b2")
                        as ImageProvider,
              ),
            ),
            CircleAvatar(
              radius: 17.r,
              backgroundColor: ColorsManager.mainGreen,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (builderContext) {
                      return BlocProvider<RegisterCubit>(
                        create: (context) => getIt<RegisterCubit>(),
                        child: AlertDialog(
                          contentPadding: EdgeInsets.all(25.sp),
                          content: SizedBox(
                            height: 140.h,
                            width: context.screenWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorsManager.lightestGray,
                                          borderRadius: BorderRadius.circular(15.r),
                                        ),
                                        height: 100.h,
                                        width: 100.w,
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: ColorsManager.mainGreen,
                                          size: 60.sp,
                                        ),
                                      ),
                                      onTap: () async {
                                        await picker.pickImage(source: ImageSource.camera).then((image) {
                                          if (image != null) {
                                            context.read<RegisterCubit>().selectedAvatar = File(image.path);
                                            setState(() {
                                              context.pop();
                                            });
                                          }
                                        });

                                      },
                                    ),
                                    verticalSpace(10),
                                    Text(
                                      "Camera",
                                      style: TextStyles.font14BlackW500,
                                    )
                                  ],
                                ),
                                horizontalSpace(20),
                                Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorsManager.lightestGray,
                                          borderRadius: BorderRadius.circular(15.r),
                                        ),
                                        height: 100.h,
                                        width: 100.w,
                                        child: Icon(
                                          Icons.photo,
                                          color: ColorsManager.mainGreen,
                                          size: 60.sp,
                                        ),
                                      ),
                                      onTap: () async {
                                        await picker.pickImage(source: ImageSource.gallery).then((image) {
                                          if (image != null) {
                                            context.read<RegisterCubit>().selectedAvatar = File(image.path);
                                            setState(() {
                                              context.pop();
                                            });
                                          }
                                        });
                                      },
                                    ),
                                    verticalSpace(10),
                                    Text(
                                      "Gallery",
                                      style: TextStyles.font14BlackW500,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Center(
                  child: Icon(
                    Icons.add,
                    size: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
