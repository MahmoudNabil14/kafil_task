// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'who_am_i_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhoAmIResponse _$WhoAmIResponseFromJson(Map<String, dynamic> json) =>
    WhoAmIResponse(
      status: json['status'] as int,
      success: json['success'] as bool,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WhoAmIResponseToJson(WhoAmIResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      about: json['about'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteSocialMedia: (json['favorite_social_media'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      salary: json['salary'] as int?,
      email: json['email'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as int?,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'about': instance.about,
      'tags': instance.tags,
      'favorite_social_media': instance.favoriteSocialMedia,
      'salary': instance.salary,
      'email': instance.email,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'type': instance.type,
      'avatar': instance.avatar,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      code: json['code'] as int?,
      name: json['name'] as String?,
      niceName: json['nice_name'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'nice_name': instance.niceName,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
