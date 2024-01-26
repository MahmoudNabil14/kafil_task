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
  @JsonKey(name: "avatar")
  final String avatarAsBytes;
  final String about;
  @JsonKey(name: "birth_date")
  final String brithDate;
  final int gender;
  final int salary;
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
      required this.avatarAsBytes,
      required this.about,
      required this.brithDate,
      required this.gender,
      required this.salary,
      required this.tags,
      required this.favoriteSocialMedia});

  Map<String, dynamic> toJson()=>_$RegisterRequestBodyToJson(this);

}
