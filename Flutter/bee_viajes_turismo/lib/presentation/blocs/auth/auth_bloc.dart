import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';
import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = AuthRepositoryImpl();

  AuthBloc() : super(AuthState()) {
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
    on<SignUp>(_onSignUp);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    try {
      final user = await authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      // _setLoggedUser(user);
      emit(state.copyWith(user: user, authStatus: AuthStatus.authenticated));
    } on WrongCredentials {
      emit(
        state.copyWith(
          user: null,
          authStatus: AuthStatus.notAuthenticated,
          errorMessage: 'Wrong email or password.',
        ),
      );
      print('WrongCredentials:${state.errorMessage}');
    } catch (e) {
      emit(
        state.copyWith(
          user: null,
          authStatus: AuthStatus.notAuthenticated,
          errorMessage: 'An unknown error occurred.',
        ),
      );
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {}

  void _onSignUp(SignUp event, Emitter<AuthState> emit) {}

  void _onCheckAuthStatus(CheckAuthStatus event, Emitter<AuthState> emit) {}

  void _setLoggedUser(User user) {
    state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  }

  void setSignOut({String errorMessage = ''}) {
    state.copyWith(
      user: null,
      authStatus: AuthStatus.notAuthenticated,
      errorMessage: errorMessage,
    );
  }
}
