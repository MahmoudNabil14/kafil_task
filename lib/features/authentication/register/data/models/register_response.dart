import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_response.g.dart';
@JsonSerializable()
class RegisterResponse{
  final int status;
  final bool success;
  final String? data;
  final Map<String, List<String>>? errors;

  RegisterResponse({this.data, this.errors, required this.status, required this.success});

  factory RegisterResponse.fromJson(Map<String, dynamic> json)=> _$RegisterResponseFromJson(json);

}