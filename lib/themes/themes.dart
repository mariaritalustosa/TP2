import 'package:flutter/material.dart';

class AppTheme{
  static final primaryColor = Colors.blue.shade800;
  static final accentColor = Colors.orangeAccent;

  static final inputDecoration = InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    labelStyle: TextStyle(color: primaryColor),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      labelStyle: TextStyle(color: primaryColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      secondary: accentColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: accentColor),
      ),
      labelStyle: TextStyle(color: primaryColor),
    ),
  );
}
