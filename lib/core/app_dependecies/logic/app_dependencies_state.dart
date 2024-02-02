import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kafil_task/core/app_dependecies/data/models/app_dependencies_response.dart';
part 'app_dependencies_state.freezed.dart';
@freezed
class AppDependenciesState with _$AppDependenciesState {
  const factory AppDependenciesState.initial()= _Initial;
  const factory AppDependenciesState.loading()= Loading;
  const factory AppDependenciesState.success(AppDependenciesResponse appDependenciesResponse)= Success;
  const factory AppDependenciesState.error({required String error})= Error;
}
