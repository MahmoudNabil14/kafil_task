import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/services/data/repo/services_repo.dart';
import 'package:kafil_task/features/services/logic/services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepo _servicesRepo;

  ServicesCubit(this._servicesRepo) : super(const ServicesState.initial());

  void getServices() async {
    emit(const ServicesState.servicesLoading());
    final result = await _servicesRepo.getServices();
    result.when(success: (serviceResponseModel) {
      emit(ServicesState.servicesSuccess(serviceResponseModel));
    }, failure: (error) {
      emit(ServicesState.servicesError(error: error.apiErrorModel.message ?? ""));
    });
  }

  void getPopularServices() async {
    emit(const ServicesState.popularServicesLoading());
    final result = await _servicesRepo.getPopularServices();
    result.when(success: (serviceResponseModel) {
      emit(ServicesState.popularServicesSuccess(serviceResponseModel));
    }, failure: (error) {
      emit(ServicesState.popularServicesError(error: error.apiErrorModel.message ?? ""));
    });
  }
}
