import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/countries/logic/countries_state.dart';


class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesState().init());
}
