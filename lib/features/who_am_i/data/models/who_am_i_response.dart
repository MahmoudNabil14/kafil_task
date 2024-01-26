import 'package:freezed_annotation/freezed_annotation.dart';
part 'who_am_i_response.g.dart';

@JsonSerializable()
class WhoAmIResponse {
  final int status;
  final bool success;
  @JsonKey(name: "data")
  final UserData userData;

  WhoAmIResponse({required this.status, required this.success, required this.userData});

  factory WhoAmIResponse.fromJson(Map<String, dynamic> json) => _$WhoAmIResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  int? id;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  String? about;
  List<Tags>? tags;
  @JsonKey(name: "favorite_social_media")
  List<String>? favoriteSocialMedia;
  int? salary;
  String? email;
  @JsonKey(name: "birth_date")
  String? birthDate;
  int? gender;
  Type? type;
  String? avatar;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.about,
    this.tags,
    this.favoriteSocialMedia,
    this.salary,
    this.email,
    this.birthDate,
    this.gender,
    this.type,
    this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

@JsonSerializable()
class Type {
  int? code;
  String? name;
  @JsonKey(name: "nice_name")
  String? niceName;

  Type({
    this.code,
    this.name,
    this.niceName,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

@JsonSerializable()
class Tags {
  int? id;
  String? name;

  Tags({
    this.id,
    this.name,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
}
