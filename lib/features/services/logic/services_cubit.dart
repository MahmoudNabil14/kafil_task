import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/services/logic/services_state.dart';


class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesState().init());
}
