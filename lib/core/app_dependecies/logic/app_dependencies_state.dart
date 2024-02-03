import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_dependencies_state.freezed.dart';
@freezed
class AppDependenciesState<T> with _$AppDependenciesState<T> {
  const factory AppDependenciesState.initial()= _Initial;
  const factory AppDependenciesState.appDependenciesLoading()= appDependenciesLoading;
  const factory AppDependenciesState.appDependenciesSuccess(T appDependenciesResponse)= appDependenciesSuccess<T>;
  const factory AppDependenciesState.appDependenciesError({required String error})= appDependenciesError;
}
