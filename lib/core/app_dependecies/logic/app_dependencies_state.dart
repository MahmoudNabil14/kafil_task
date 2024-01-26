import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_dependencies_state.freezed.dart';
@freezed
class AppDependenciesState<T> with _$AppDependenciesState<T> {
  const factory AppDependenciesState.initial()= _Initial;
  const factory AppDependenciesState.loading()= Loading;
  const factory AppDependenciesState.success(T data)= Success<T>;
  const factory AppDependenciesState.error({required String error})= Error;
}
