import 'package:flutter/material.dart';

class AChipTheme {
  AChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Color.fromRGBO(158, 158, 158, 0.4), // Grey with 0.4 opacity
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}