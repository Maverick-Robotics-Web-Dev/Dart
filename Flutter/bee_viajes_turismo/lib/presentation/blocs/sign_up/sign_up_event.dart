import 'package:bee_viajes_turismo/domain/entities/entities.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpInit extends SignUpEvent {
  final FormStatus formStatus;
  SignUpInit({required this.formStatus});
}

class NameChange extends SignUpEvent {
  final String name;

  NameChange({required this.name});
}

class LastnameChange extends SignUpEvent {
  final String lastname;

  LastnameChange({required this.lastname});
}

class UsernameChange extends SignUpEvent {
  final String username;

  UsernameChange({required this.username});
}

class PasswordChange extends SignUpEvent {
  final String password;

  PasswordChange({required this.password});
}

class ConfirmPasswordChange extends SignUpEvent {
  final String confirmPassword;

  ConfirmPasswordChange({required this.confirmPassword});
}

class EmailChange extends SignUpEvent {
  final String email;

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
