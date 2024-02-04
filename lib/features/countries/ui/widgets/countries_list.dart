import 'package:flutter/material.dart';
import 'package:kafil_task/features/countries/data/models/countries_response_model.dart';
import 'package:kafil_task/features/countries/ui/widgets/country_row.dart';
import 'package:kafil_task/features/countries/ui/widgets/table_seperator.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({super.key, required this.countries});

  final List<CountryModel> countries;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CountryRow(
            country: countries[index].name,
            capital: countries[index].capital,
          );
        },
        separatorBuilder: (context, index) {
          return const TableSeparator();
        },
        itemCount: countries.length,
      ),
    );
  }
}
