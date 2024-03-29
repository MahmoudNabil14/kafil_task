import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_request_body.dart';
import 'package:kafil_task/features/authentication/register/data/repo/register_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController userTypeController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> completeDataFormKey = GlobalKey<FormState>();

  int salary = 100;

  //gender can be 0-1-null
  int? selectedGender;
  int? selectedType;
  File? selectedAvatar;
  List<String> selectedTags = [];
  List<String> selectedFavoriteSocialMedia = [];

  void emitRegisterStates() async {
    RegisterRequestBody registerRequestBody = RegisterRequestBody(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      userType: selectedType!,
      avatar: await MultipartFile.fromFile(selectedAvatar!.path, filename: selectedAvatar!.path.split('/').last),
      about: aboutController.text,
      brithDate: birthDateController.text,
      gender: selectedGender,
      salary: salary,
      tags: selectedTags,
      favoriteSocialMedia: selectedFavoriteSocialMedia,
    );

    emit(const RegisterState.loading());
    final response = await _registerRepo.register(registerRequestBody: registerRequestBody);
    response.when(success: (registerResponse) {
      emit(RegisterState.success(registerResponse));
    }, failure: (error) {
      emit(RegisterState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}

class UserType {
  final int id;
  final String type;

  UserType({required this.id, required this.type});
}
