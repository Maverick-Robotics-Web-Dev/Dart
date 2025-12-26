import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User? user;
  final Failure? errorMessage;

  const AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    Failure? errorMessage,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [authStatus, user, errorMessage];
}
