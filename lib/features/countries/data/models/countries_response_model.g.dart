// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesResponseModel _$CountriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CountriesResponseModel(
      status: json['status'] as int,
      success: json['success'] as bool,
      countries: (json['data'] as List<dynamic>)
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountriesResponseModelToJson(
        CountriesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.countries,
      'pagination': instance.pagination,
    };

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      id: json['id'] as int,
      countryCode: json['country_code'] as String,
      name: json['name'] as String,
      capital: json['capital'] as String,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_code': instance.countryCode,
      'name': instance.name,
      'capital': instance.capital,
    };

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      total: json['total'] as int,
      count: json['count'] as int,
      perPage: json['perPage'] as int,
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      links: json['links'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'perPage': instance.perPage,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'links': instance.links,
    };
