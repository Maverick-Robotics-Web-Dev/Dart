import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/admin/admin_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/admin/admin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AuthUseCases authUseCases;

  AdminBloc(this.authUseCases) : super(AdminState()) {
    on<ChangeDrawerScreenEvent>(_onChangeDrawerScreenEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  Future<void> _onChangeDrawerScreenEvent(
    ChangeDrawerScreenEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(screenIndex: event.screenIndex));
  }

  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter<AdminState> emit,
  ) async {
    await authUseCases.signOut();
  }
}
