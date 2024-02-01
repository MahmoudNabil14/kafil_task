// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      data: json['data'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      status: json['status'] as int,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.data,
      'errors': instance.errors,
    };
