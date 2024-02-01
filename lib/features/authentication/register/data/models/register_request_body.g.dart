// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
      userType: json['type'] as int,
      about: json['about'] as String,
      brithDate: json['birth_date'] as String,
      gender: json['gender'] as int,
      salary: json['salary'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      favoriteSocialMedia: (json['favoriteSocialMedia'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
        RegisterRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'type': instance.userType,
      'about': instance.about,
      'birth_date': instance.brithDate,
      'gender': instance.gender,
      'salary': instance.salary,
    };
