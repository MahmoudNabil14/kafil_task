import 'package:freezed_annotation/freezed_annotation.dart';
part 'who_am_i_state.freezed.dart';
@freezed
class WhoAmIState<T> with _$WhoAmIState<T>{
  const factory WhoAmIState.initial() = _Initial;
  const factory WhoAmIState.loading() = Loading;
  const factory WhoAmIState.success(T data) = Success<T>;
  const factory WhoAmIState.error({required String error}) = Error;
}
