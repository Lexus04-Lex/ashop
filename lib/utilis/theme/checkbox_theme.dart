import 'package:flutter/material.dart';

class ACheckBox {
  ACheckBox._();
  static CheckboxThemeData lightCheckTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.white; // Color when checkbox is disabled
      }
      return Colors.black; // Default check color
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white; // Color when checkbox is selected
      }
      return Colors.black; // Default fill color
    }),
  );

  static CheckboxThemeData darkCheckTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.white; // Color when checkbox is disabled
      }
      return Colors.black; // Default check color
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white; // Color when checkbox is selected
      }
      return Colors.black; // Default fill color
    }),
  );
}