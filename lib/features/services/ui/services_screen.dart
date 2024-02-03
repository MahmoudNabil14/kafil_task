import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafil_task/core/di/dependency_injection.dart';
import 'package:kafil_task/core/helpers/spacing.dart';
import 'package:kafil_task/core/theming/text_styles.dart';
import 'package:kafil_task/features/services/data/models/service_response_model.dart';
import 'package:kafil_task/features/services/logic/services_cubit.dart';
import 'package:kafil_task/features/services/logic/services_state.dart';
import 'package:kafil_task/features/services/ui/widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>(
      create: (context) => getIt<ServicesCubit>()..getServices()..getPopularServices(),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ServicesCubit, ServicesState>(
              buildWhen: (previous, current) => current is GetServicesLoading || current is GetServicesError || current is GetServicesSuccess,
              builder: (context, state) {
                if (state is GetServicesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GetServicesError) {
                  return Text('Error: ${state.error}');
                } else if (state is GetServicesSuccess) {
                  List<Service> services = (state.services as ServiceResponseModel).services;
                  return Expanded(
                    flex: 2,

                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(
                            price: services[index].price,
                            averageRating: services[index].averageRating,
                            completedSalesCount: services[index].completedSalesCount,
                            title: services[index].title,
                            mainImage: services[index].mainImage);
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true, separatorBuilder: (BuildContext context, int index) { return horizontalSpace(15);},
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            verticalSpace(35),
            Text(
              "Popular Services",
              style: TextStyles.font18BlackW600,
            ),
            verticalSpace(30),
            BlocBuilder<ServicesCubit, ServicesState>(
              buildWhen: (previous, current) =>
                  current is GetPopularServicesLoading || current is GetPopularServicesError || current is GetPopularServicesSuccess,
              builder: (context, state) {
                if (state is GetPopularServicesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GetPopularServicesError) {
                  return Text('Error: ${state.error}');
                } else if (state is GetPopularServicesSuccess) {
                  List<Service> popularServices = (state.popularServices as ServiceResponseModel).services;
                  return Expanded(
                    flex: 2,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                      itemCount: popularServices.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(
                            price: popularServices[index].price,
                            averageRating: popularServices[index].averageRating,
                            completedSalesCount: popularServices[index].completedSalesCount,
                            title: popularServices[index].title,
                            mainImage: popularServices[index].mainImage);
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true, separatorBuilder: (BuildContext context, int index) { return horizontalSpace(15);},
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

