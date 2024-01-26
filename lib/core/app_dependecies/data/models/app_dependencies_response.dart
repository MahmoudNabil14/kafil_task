import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_dependencies_response.g.dart';

@JsonSerializable()
class AppDependenciesResponse {
  final int status;
  final bool success;
  @JsonKey(name: "data")
  final UserData userData;

  AppDependenciesResponse({required this.status, required this.success, required this.userData});

  factory AppDependenciesResponse.fromJson(Map<String, dynamic> json) => _$AppDependenciesResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "types")
  final List<UserTypeDependency> userTypes;
  @JsonKey(name: "tags")
  final List<Skill> userSkills;
  @JsonKey(name: "social_media")
  final List<SocialMedia> socialMedia;

  UserData({required this.userTypes, required this.userSkills, required this.socialMedia});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

@JsonSerializable()
class SocialMedia {
  final String value;
  final String label;

  SocialMedia({required this.value, required this.label});

  factory SocialMedia.fromJson(Map<String, dynamic> json) => _$SocialMediaFromJson(json);
}

@JsonSerializable()
class Skill {
  final int value;
  final String label;

  Skill({required this.value, required this.label});

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}

@JsonSerializable()
class UserTypeDependency {
  final int value;
  final String label;

  UserTypeDependency({required this.value, required this.label});

  factory UserTypeDependency.fromJson(Map<String, dynamic> json) => _$UserTypeDependencyFromJson(json);
}
