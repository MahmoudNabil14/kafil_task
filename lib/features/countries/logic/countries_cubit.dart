import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/networking/api_error_handler.dart';
import 'package:kafil_task/features/countries/data/models/countries_response_model.dart';
import 'package:kafil_task/features/countries/data/repo/countries_repo.dart';
import 'package:kafil_task/features/countries/logic/countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final CountriesRepo _countriesRepo;

  CountriesCubit(this._countriesRepo) : super(const CountriesState.initial());
  int pageNumber = 1;

  void emitCountriesState({required int pageNumber}) async {
    emit(const CountriesState.getCountriesLoading());
    final response = await _countriesRepo.getCountries(pageNumber: pageNumber);
    response.when(
        success: (CountriesResponseModel countriesResponseModel) {
          emit(CountriesState.getCountriesSuccess(countriesResponseModel));
        },
        failure: (ErrorHandler error) {
          emit(CountriesState.getCountriesError(error: error.apiErrorModel.message ?? ""));
        });
  }
}
