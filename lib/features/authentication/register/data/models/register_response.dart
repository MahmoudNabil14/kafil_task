import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_response.g.dart';
@JsonSerializable()
class RegisterResponse{
  final String message;
  final Map<String, List<String>> errors;

  RegisterResponse({required this.message, required this.errors});

  factory RegisterResponse.fromJson(Map<String, dynamic> json)=> _$RegisterResponseFromJson(json);

}