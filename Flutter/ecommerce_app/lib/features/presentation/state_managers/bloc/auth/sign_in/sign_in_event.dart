import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {}

class SignInInitEvent extends SignInEvent {
  SignInInitEvent();

  @override
  List<Object?> get props => [];
}

class EmailChangedEvent extends SignInEvent {
  final BlocFormItem email;

  EmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChangedEvent extends SignInEvent {
  final BlocFormItem password;

  PasswordChangedEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class SignInFormResetEvent extends SignInEvent {
  SignInFormResetEvent();

  @override
  List<Object?> get props => [];
}

class SignInSubmitEvent extends SignInEvent {
  SignInSubmitEvent();

  @override
  List<Object?> get props => [];
}
