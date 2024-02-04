import 'package:freezed_annotation/freezed_annotation.dart';
part 'services_state.freezed.dart';
@freezed
class ServicesState<T> with _$ServicesState<T>{
  const factory ServicesState.initial() = _Initial;
  const factory ServicesState.servicesLoading() = GetServicesLoading;
  const factory ServicesState.servicesSuccess(T services) = GetServicesSuccess<T>;
  const factory ServicesState.servicesError({required String error}) = GetServicesError;

  const factory ServicesState.popularServicesLoading() = GetPopularServicesLoading;
  const factory ServicesState.popularServicesSuccess(T popularServices) = GetPopularServicesSuccess<T>;
  const factory ServicesState.popularServicesError({required String error}) = GetPopularServicesError;
}
