// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_dependencies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDependenciesResponse _$AppDependenciesResponseFromJson(
        Map<String, dynamic> json) =>
    AppDependenciesResponse(
      status: json['status'] as int,
      success: json['success'] as bool,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppDependenciesResponseToJson(
        AppDependenciesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userTypes: (json['types'] as List<dynamic>)
          .map((e) => UserTypeDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      userSkills: (json['tags'] as List<dynamic>)
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['social_media'] as List<dynamic>)
          .map((e) => SocialMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'types': instance.userTypes,
      'tags': instance.userSkills,
      'social_media': instance.socialMedia,
    };

SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) => SocialMedia(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$SocialMediaToJson(SocialMedia instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      value: json['value'] as int,
      label: json['label'] as String,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

UserTypeDependency _$UserTypeDependencyFromJson(Map<String, dynamic> json) =>
    UserTypeDependency(
      value: json['value'] as int,
      label: json['label'] as String,
    );

Map<String, dynamic> _$UserTypeDependencyToJson(UserTypeDependency instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };
