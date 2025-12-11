import 'package:formz/formz.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';

class ConfirmPassword extends FormzInput<String, ConfirmPasswordError> {
  // Call super.pure to represent an unmodified form input.
  const ConfirmPassword.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const ConfirmPassword.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == ConfirmPasswordError.empty) {
      return 'El Campo es requerido';
    }
    if (displayError == ConfirmPasswordError.length) {
      return 'Minimo 6 caracteres';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ConfirmPasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return ConfirmPasswordError.empty;
    }
    if (value.length < 6) return ConfirmPasswordError.length;

    return null;
  }
}
