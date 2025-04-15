import 'dart:io';

void main(List<String> arguments) {
  // print('Introduce tu año de nacimiento:');
  // String inputYear = stdin.readLineSync()!;
  // const int currentYear = 2025;
  // int intYear = int.parse(inputYear);
  // int age = currentYear - intYear;
  // print('Tu edad es: $age años');

  print('Introduce el dia de la semana:');
  int inputDay = int.parse(stdin.readLineSync()!);

  switch (inputDay) {
    case 1:
      print('Lunes');
    case 2:
      print('Martes');
    case 3:
      print('Miércoles');
    case 4:
      print('Jueves');
    case 5:
      print('Viernes');
    case 6:
      print('Sábado');
    case 7:
      print('Domingo');
    default:
      print('Número de día inválido. Debe ser entre 1 y 7.');
  }
}
