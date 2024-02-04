import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kafil_task/features/countries/data/models/countries_response_model.dart';
part 'countries_state.freezed.dart';
@freezed
class CountriesState with _$CountriesState{

  const factory CountriesState.initial() = _initial;
  const factory CountriesState.getCountriesLoading() = GetCountriesLoading;
  const factory CountriesState.getCountriesSuccess(CountriesResponseModel countriesResponseModel) = GetCountriesSuccess;
  const factory CountriesState.getCountriesError({required String error}) = GetCountriesError;
}
