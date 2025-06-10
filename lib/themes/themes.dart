import 'package:flutter/material.dart';

class AppTheme{
  static final primaryColor = const Color.fromARGB(255, 3, 31, 63);
  static final accentColor = const Color.fromARGB(255, 129, 66, 126);
  static const lightBackground = Color(0xFFF5F5F5);
  static const darkBackground = Color(0xFF121212);

   static final buttonTheme = FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    elevation: 6,
  );

  static final inputDecoration = InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    labelStyle: TextStyle(color: primaryColor),
  );

  static final textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: primaryColor),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor),
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
    floatingActionButtonTheme: buttonTheme,
    textTheme: textTheme,
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
    floatingActionButtonTheme: buttonTheme,
    textTheme: textTheme,
  );

}
