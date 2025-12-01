import 'package:flutter/material.dart';

class AppColors {
  static const Color seedColor = Color(0xFF08296C);
}

/// Tonal Palette Material You basada en el color seed 0xFF08296C
// class AppTonalPalette {
//   static const Color seed = Color(0xFF08296C);

//   // 13 tonos M3 aproximados (T0 a T100)
//   static const List<Color> tones = [
//     Color(0xFFE5E7FF), // T0
//     Color(0xFFCCD2FF), // T10
//     Color(0xFFB3BBFF), // T20
//     Color(0xFF99A3FF), // T30
//     Color(0xFF809CFF), // T40
//     Color(0xFF6685FF), // T50
//     Color(0xFF4D6EFF), // T60
//     Color(0xFF3358FF), // T70
//     Color(0xFF1A41FF), // T80
//     Color(0xFF002AFF), // T90
//     Color(0xFF001FCC), // T95
//     Color(0xFF001699), // T99
//     Color(0xFF000F66), // T100
//   ];

//   static Color tone(int index) {
//     assert(index >= 0 && index <= 12, "Índice debe estar entre 0 y 12");
//     return tones[index];
//   }
// }

class AppTonalPalette {
  static const Color seed = Color(0xFF08296C);

  // 13 tonos M3 aproximados (T0 a T100)
  static const List<Color> tones = [
    Color(0xFFE1E6F1),
    Color(0xFFB5C0DC),
    Color(0xFF8497C5),
    Color(0xFF536EAE),
    Color(0xFF2E509D),
    Color(0xFF08296C),
    Color(0xFF072563),
    Color(0xFF061F58),
    Color(0xFF05194E),
    Color(0xFF030F3C),
    Color(0xFF001699), // T99
    Color(0xFF000F66), // T100
    Color(0xFF000F66), // T100
  ];

  static Color tone(int index) {
    assert(index >= 0 && index <= 12, "Índice debe estar entre 0 y 12");
    return tones[index];
  }
}

const MaterialColor customBlue = MaterialColor(0xFF08296C, <int, Color>{
  50: Color(0xFFE1E6F1),
  100: Color(0xFFB5C0DC),
  200: Color(0xFF8497C5),
  300: Color(0xFF536EAE),
  400: Color(0xFF2E509D),
  500: Color(0xFF08296C),
  600: Color(0xFF072563),
  700: Color(0xFF061F58),
  800: Color(0xFF05194E),
  900: Color(0xFF030F3C),
});
