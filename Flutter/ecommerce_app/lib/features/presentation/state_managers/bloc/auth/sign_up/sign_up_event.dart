import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {}

class SignUpInitEvent extends SignUpEvent {
  SignUpInitEvent();

  @override
  List<Object?> get props => [];
}

class NameChangedEvent extends SignUpEvent {
  final BlocFormItem name;

  NameChangedEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class LastNameChangedEvent extends SignUpEvent {
  final BlocFormItem lastname;

  LastNameChangedEvent({required this.lastname});

  @override
  List<Object?> get props => [lastname];
}

class EmailChangedEvent extends SignUpEvent {
  final BlocFormItem email;

  EmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class PhoneChangedEvent extends SignUpEvent {
  final BlocFormItem phone;

  PhoneChangedEvent({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class PasswordChangedEvent extends SignUpEvent {
  final BlocFormItem password;

  PasswordChangedEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChangedEvent extends SignUpEvent {
  final BlocFormItem confirmPassword;

  ConfirmPasswordChangedEvent({required this.confirmPassword});

  @override
  List<Object?> get props => [confirmPassword];
}

class SignUpFormResetEvent extends SignUpEvent {
  SignUpFormResetEvent();

  @override
  List<Object?> get props => [];
}

class SignUpSubmitEvent extends SignUpEvent {
  SignUpSubmitEvent();

  @override
  List<Object?> get props => [];
}
