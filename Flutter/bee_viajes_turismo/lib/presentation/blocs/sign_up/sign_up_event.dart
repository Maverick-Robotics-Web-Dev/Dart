import 'package:bee_viajes_turismo/domain/entities/entities.dart';
import 'package:bee_viajes_turismo/infrastructure/inputs/inputs.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpInit extends SignUpEvent {
  final FormStatus formStatus;
  SignUpInit({required this.formStatus});
}

class NameChange extends SignUpEvent {
  final Name name;

  NameChange({required this.name});
}

class LastnameChange extends SignUpEvent {
  final LastName lastname;

  LastnameChange({required this.lastname});
}

class UsernameChange extends SignUpEvent {
  final UserName username;

  UsernameChange({required this.username});
}

class PasswordChange extends SignUpEvent {
  final Password password;

  PasswordChange({required this.password});
}

class ConfirmPasswordChange extends SignUpEvent {
  final ConfirmPassword confirmPassword;

  ConfirmPasswordChange({required this.confirmPassword});
}

class EmailChange extends SignUpEvent {
  final Email email;

  EmailChange({required this.email});
}

class AddressChange extends SignUpEvent {
  final Address address;

  AddressChange({required this.address});
}

class PhoneChange extends SignUpEvent {
  final String phone;

  PhoneChange({required this.phone});
}

class OnSubmit extends SignUpEvent {
  OnSubmit();
}
