import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/authentication/register/data/models/register_request_body.dart';
import 'package:kafil_task/features/authentication/register/data/repo/register_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  late List<UserType> userTypes;
  late UserType selectedType;


  RegisterCubit(this._registerRepo) : super(const RegisterState.initial()){
    // Initialize userTypes and selectedType in the constructor
    userTypes = [
      UserType(id: 1, type: "Seller"),
      UserType(id: 2, type: "Buyer"),
      UserType(id: 3, type: "Both"),
    ];
    selectedType = userTypes[0];
  }

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
  File? selectedAvatar;
  List<num> tags = [];
  List<String> favoriteSocialMedia = [];

  void emitRegisterStates({required RegisterRequestBody registerRequestBody}) async {
    emit(const RegisterState.loading());
    final response = await _registerRepo.register(registerRequestBody: registerRequestBody, avatar: await MultipartFile.fromFile(selectedAvatar!.path));
    response.when(success: (registerResponse) {
      emit(RegisterState.success(registerResponse));
    }, failure: (error) {
      emit(RegisterState.error(error: error.apiErrorModel.message??''));

    });
  }
}

class UserType {
  final int id;
  final String type;

  UserType({required this.id, required this.type});
}
