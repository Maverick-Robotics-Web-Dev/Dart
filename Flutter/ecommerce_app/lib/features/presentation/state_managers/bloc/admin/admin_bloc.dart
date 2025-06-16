import 'package:ecommerce_app/features/presentation/state_managers/bloc/admin/admin_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/admin/admin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminState()) {
    on<ChangeDrawerScreenEvent>(_onChangeDrawerScreenEvent);
  }

  Future<void> _onChangeDrawerScreenEvent(
    ChangeDrawerScreenEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(screenIndex: event.screenIndex));
  }
}
