import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF0D47A1);
const List<Color> _colorThemes = [
  _customColor,
  Color(0xFF00219E),
  Color(0xFF0530B1),
  Color(0xFF0A3EC4),
  Color(0xFF003A91),
  Color(0xFF1F4EA9),
  Colors.red,
];

class AppTheme {
  final int selectedColorIndex;

  AppTheme({this.selectedColorIndex = 0})
    : assert(
        selectedColorIndex >= 0 &&
            selectedColorIndex <= _colorThemes.length - 1,
        'Colors must be between 0 and ${_colorThemes.length}',
      );

  ThemeData customTheme() {
    return ThemeData(colorSchemeSeed: _colorThemes[selectedColorIndex]);
  }
}
