import 'package:flutter/material.dart';

class AppTheme {
  // Define your primary colors
  static const Color primaryColor = Color(0xFF0099D5);
  static const Color secondaryColor = Color(0xFF1C1F1E);
  static const Color accentColor = Color(0xFFA7A6A5);
  static const Color DESCRIOTIONfont = Color(0xFF2D2B2E);
  static const Color SwitchColor = Color(0xFF2DC4FF);
  static const Color PURPLE = Color(0xFF064BA6);

  // Additional colors
  static const Color lightBlue = Color(0xFF3BB0DF);
  static const Color green = Color(0xFF0AA655);
  static const Color red = Color(0xFFE72F49);
  static const Color orange = Color(0xFFF7AA1E);
  static const Color darkBlue = Color(0xFF0C3469);
  static const Color brightBlue = Color(0xFF0099D6);
  static const Color grey = Color(0xFF585858);
  static const Color lightGreen = Color(0xFFDFFCED);
  static const Color blue = Color(0xFF2C6EFF);
  static const Color black2 = Color(0xFF666666);
  static const Color grisTextField = Color(0xFFF4F6F5);

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor, // Replace accentColor with colorScheme.secondary
      surface: lightGreen,
      background: Colors.white,
      error: red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: grey,
      onBackground: grey,
      onError: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor, // Replace accentColor with colorScheme.secondary
      surface: darkBlue,
      error: red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: grey,
      onBackground: grey,
      onError: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
