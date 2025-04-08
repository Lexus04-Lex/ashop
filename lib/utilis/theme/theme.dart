import 'package:a_shop/utilis/theme/aappbartheme.dart';
import 'package:a_shop/utilis/theme/checkbox_theme.dart';
import 'package:a_shop/utilis/theme/chip_theme.dart';
import 'package:a_shop/utilis/theme/inputdecorationtheme.dart';
import 'package:a_shop/utilis/theme/outlinedbutton.dart';
import 'package:a_shop/utilis/theme/texttheme.dart';
import 'package:flutter/material.dart';
import 'package:a_shop/utilis/theme/elevatebuttontheme.dart';

class AAppTheme{
  AAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ATextTheme.lightTextTheme,
    elevatedButtonTheme: AElevateButtonTheme.lightThemeElevatedTextButton,
    appBarTheme: AAppBarTheme.lightAppBarTheme,
    checkboxTheme: ACheckBox.lightCheckTheme,
    chipTheme: AChipTheme.lightChipTheme,
    outlinedButtonTheme: AOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ATextFormFieldTheme.lightInputDecorationTheme,

  );
  static ThemeData darkTheme = ThemeData(

    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ATextTheme.darkTextTheme,
    elevatedButtonTheme: AElevateButtonTheme.darkThemeElevatedTextButton,
    appBarTheme: AAppBarTheme.darkAppBarTheme,
    checkboxTheme: ACheckBox.darkCheckTheme,
    chipTheme: AChipTheme.darkChipTheme,
    outlinedButtonTheme: AOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ATextFormFieldTheme.darkInputDecorationTheme,

  );
}