import 'package:flutter/material.dart';

class AppColors {
  static const Color seedColor = Color(0xFF08296C);
}

/// Tonal Palette Material You basada en el color seed 0xFF08296C
class AppTonalPalette {
  static const Color seed = Color(0xFF08296C);

  // 13 tonos M3 aproximados (T0 a T100)
  static const List<Color> tones = [
    Color(0xFFE5E7FF), // T0
    Color(0xFFCCD2FF), // T10
    Color(0xFFB3BBFF), // T20
    Color(0xFF99A3FF), // T30
    Color(0xFF809CFF), // T40
    Color(0xFF6685FF), // T50
    Color(0xFF4D6EFF), // T60
    Color(0xFF3358FF), // T70
    Color(0xFF1A41FF), // T80
    Color(0xFF002AFF), // T90
    Color(0xFF001FCC), // T95
    Color(0xFF001699), // T99
    Color(0xFF000F66), // T100
  ];

  static Color tone(int index) {
    assert(index >= 0 && index <= 12, "Índice debe estar entre 0 y 12");
    return tones[index];
  }
}
