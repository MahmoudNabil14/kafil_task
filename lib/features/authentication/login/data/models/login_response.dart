import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse{
  final int status;
  final bool  success;
  @JsonKey(name: "data")
  final UserData userData;
  @JsonKey(name: "access_token")
  final String accessToken;

  LoginResponse({required this.status, required this.success, required this.userData, required this.accessToken});

factory LoginResponse.fromJson(Map<String, dynamic> json)=> _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final int id;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String about;
  final List<Tag> tags;
  @JsonKey(name: "favorite_social_media")
  final List<String> favoriteSocialMedia;
  final int salary;
  final String email;
  @JsonKey(name:"birth_date")
  final String birthDate;
  final int gender;
  @JsonKey(name: "type")
  final UserType userType;
  final String avatar;

  UserData({required this.id, required this.firstName, required this.lastName, required this.about, required this.tags, required this.favoriteSocialMedia, required this.salary, required this.email, required this.birthDate, required this.gender, required this.userType, required this.avatar});
  factory UserData.fromJson(Map<String, dynamic> json)=> _$UserDataFromJson(json);

}

@JsonSerializable()
class UserType {
  final int code;
  final String name;
  @JsonKey(name: "nice_name")
  final String niceName;

  UserType({required this.code, required this.name, required this.niceName});

  factory UserType.fromJson(Map<String, dynamic> json)=> _$UserTypeFromJson(json);

}
@JsonSerializable()
class Tag {
  final int id;
  final String name;

  Tag({required this.id, required this.name});
  factory Tag.fromJson(Map<String, dynamic> json)=> _$TagFromJson(json);

}