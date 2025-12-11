import 'package:formz/formz.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';

class Email extends FormzInput<String, EmailError> {
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) {
      return 'El Campo es requerido';
    }
    if (displayError == EmailError.format) {
      return 'No tiene formato de correo electronico';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EmailError.empty;
    }
    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
