import 'package:flutter_bloc/flutter_bloc.dart';

import 'who_am_i_state.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  WhoAmICubit() : super(WhoAmIState().init());
}
