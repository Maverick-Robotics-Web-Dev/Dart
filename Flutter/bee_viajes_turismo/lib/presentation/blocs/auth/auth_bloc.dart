import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';
import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = AuthRepositoryImpl();
  final sharedPrefService = SharedPrefServiceImpl();

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
      await sharedPrefService.setValue('token', user.token);
      emit(
        state.copyWith(
          user: user,
          authStatus: AuthStatus.authenticated,
          errorMessage: '',
        ),
      );
    } on Failure catch (e) {
      emit(
        state.copyWith(
          user: null,
          authStatus: AuthStatus.notAuthenticated,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          user: null,
          authStatus: AuthStatus.notAuthenticated,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    await authRepository.signOut();
    emit(
      state.copyWith(
        user: null,
        authStatus: AuthStatus.notAuthenticated,
        errorMessage: '',
      ),
    );
  }

  void _onSignUp(SignUp event, Emitter<AuthState> emit) {}

  void _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final token = await sharedPrefService.getValue<String>('token');

    if (token == null) {
      emit(state.copyWith(user: null, authStatus: AuthStatus.notAuthenticated));
      return;
    }

    try {
      final user = await authRepository.checkAuthStatus(token: token);
      emit(state.copyWith(user: user, authStatus: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(user: null, authStatus: AuthStatus.notAuthenticated));
    }
  }

  // void _setLoggedUser(User user) {
  //   state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  // }
}
