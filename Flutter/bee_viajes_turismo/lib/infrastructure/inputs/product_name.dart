import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:formz/formz.dart';

class ProducName extends FormzInput<String, TitleError> {
  // Call super.pure to represent an unmodified form input.
  const ProducName.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const ProducName.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == TitleError.empty) {
      return 'El Campo es requerido';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  TitleError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return TitleError.empty;
    }

    return null;
  }
}
