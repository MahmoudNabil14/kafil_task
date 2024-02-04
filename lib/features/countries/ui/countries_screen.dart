import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/features/countries/logic/countries_cubit.dart';
import 'package:kafil_task/features/countries/logic/countries_state.dart';
import 'package:kafil_task/features/countries/ui/widgets/countries_table.dart';
import 'package:kafil_task/features/countries/ui/widgets/pagination_buttons.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountriesCubit>(
      create: (context) => getIt<CountriesCubit>()..emitCountriesState(pageNumber: 1),
      child: Column(
        children: [
          BlocConsumer<CountriesCubit, CountriesState>(
            listener: (BuildContext context, Object? state) {},
            builder: (BuildContext context, state) {
              if (state is GetCountriesLoading) {
                return const CircularProgressIndicator(color: ColorsManager.mainGreen,);
              } else if (state is GetCountriesSuccess) {
                return Column(
                  children: [
                    CountriesTable(
                      countriesResponseModel: state.countriesResponseModel,
                    ),
                    verticalSpace(20),
                    PaginationButtons(currentPage: state.countriesResponseModel.pagination.currentPage, totalPages: state.countriesResponseModel.pagination.totalPages)
                  ],
                );
              } else if (state is GetCountriesError) {
                return Text(state.error);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}





