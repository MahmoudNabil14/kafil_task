import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/app_dependecies/data/repo/app_dependecies_repo.dart';
import 'app_dependencies_state.dart';

class AppDependenciesCubit extends Cubit<AppDependenciesState> {
  final AppDependenciesRepo _appDependenciesRepo;

  AppDependenciesCubit(this._appDependenciesRepo) : super(const AppDependenciesState.initial());

  void emitAppDependenciesState() async {
    emit(const AppDependenciesState.appDependenciesLoading());
    final response = await _appDependenciesRepo.getAppDependencies();
    response.when(success: (appDependenciesResponse) {
      emit(AppDependenciesState.appDependenciesSuccess(appDependenciesResponse));
    }, failure: (error) {
      emit(AppDependenciesState.appDependenciesError(error: error.apiErrorModel.message ?? ""));
    });
  }
}
