import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String confirmPassword;
  @JsonKey(name: "type")
  final int userType;
  final String about;
  @JsonKey(name: "birth_date")
  final String brithDate;
  final int gender;
  final int salary;
  @JsonKey(includeFromJson: false)
  final File? avatar;
  final List<int> tags;
  @JsonKey(name: "favorite_social_media")
  final List<String> favoriteSocialMedia;

  RegisterRequestBody(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.userType,
      required this.about,
        this.avatar,
      required this.brithDate,
      required this.gender,
      required this.salary,
      required this.tags,
      required this.favoriteSocialMedia});

  Map<String, dynamic> toJson()=>_$RegisterRequestBodyToJson(this);


}
