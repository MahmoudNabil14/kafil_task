import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/who_am_i/data/repo/who_am_i_repo.dart';

import 'who_am_i_state.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  final WhoAmIRepo _whoAmIRepo;

  WhoAmICubit(this._whoAmIRepo) : super(const WhoAmIState.initial());


  void emitWhoAmIStates() async {
    emit(const WhoAmIState.loading());
    final response = await _whoAmIRepo.whoAmI();
    response.when(success: (whoAmIResponse) {
      emit(
        WhoAmIState.success(whoAmIResponse),
      );
    }, failure: (error) {
      emit(
        WhoAmIState.error(error: error.apiErrorModel.message ?? ""),
      );
    });
  }
}
