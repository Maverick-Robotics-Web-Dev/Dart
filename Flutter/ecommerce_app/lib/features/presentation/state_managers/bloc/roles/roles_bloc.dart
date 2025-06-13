import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/roles/roles_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/roles/roles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  AuthUseCases authUseCases;

  RolesBloc(this.authUseCases) : super(RolesState()) {
    on<GetRolesListEvent>(_onGetRolesListEvent);
  }

  Future<void> _onGetRolesListEvent(
    GetRolesListEvent event,
    Emitter<RolesState> emit,
  ) async {
    SignInResponseModel? signInResponse = await authUseCases.getUserSession();

    emit(state.copyWith(roles: signInResponse?.user.roles));
  }
}
