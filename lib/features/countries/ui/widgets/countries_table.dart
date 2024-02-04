import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/helpers/extensions.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/colors.dart';
import 'package:kafil_task/features/countries/data/models/countries_response_model.dart';
import 'package:kafil_task/features/countries/ui/widgets/countries_list.dart';
import 'package:kafil_task/features/countries/ui/widgets/header_row.dart';

class CountriesTable extends StatelessWidget {
  const CountriesTable({
    super.key,
    required this.countriesResponseModel,
  });

  final CountriesResponseModel countriesResponseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight / 2,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.shadowColor.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 40,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const HeaderRow(),
          verticalSpace(10),
          CountriesList(
            countries: countriesResponseModel.countries,
          ),
        ],
      ),
    );
  }
}
