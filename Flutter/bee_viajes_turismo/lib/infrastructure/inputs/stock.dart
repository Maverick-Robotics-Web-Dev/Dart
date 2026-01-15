import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:formz/formz.dart';

class Stock extends FormzInput<double, StockError> {
  // Call super.pure to represent an unmodified form input.
  const Stock.pure() : super.pure(0.0);

  // Call super.dirty to represent a modified form input.
  const Stock.dirty({double value = 0.0}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == StockError.empty) {
      return 'El Campo es requerido';
    }
    if (displayError == StockError.value) {
      return 'Tiene que ser igual a cero o mayor';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  StockError? validator(double value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return StockError.empty;
    }
    if (value < 0) return StockError.value;

    return null;
  }
}
