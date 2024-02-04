import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries_response_model.g.dart';

@JsonSerializable()
class CountriesResponseModel {
  final int status;
  final bool success;
  @JsonKey(name: 'data')
  final List<CountryModel> countries;
  final PaginationModel pagination;

  CountriesResponseModel({required this.status, required this.success, required this.countries, required this.pagination});

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) => _$CountriesResponseModelFromJson(json);
}

@JsonSerializable()
class CountryModel {
  final int id;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String name;
  final String capital;

  CountryModel({required this.id, required this.countryCode, required this.name, required this.capital});

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
}

@JsonSerializable()
class PaginationModel {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final Map<String, dynamic> links;

  PaginationModel(
      {required this.total, required this.count, required this.perPage, required this.currentPage, required this.totalPages, required this.links});

  factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);
}
