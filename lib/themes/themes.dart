import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static final primaryColor = const Color(0xFF6A1B9A);
  static final accentColor = const Color(0xFFF48FB1);
  static const lightBackground = Color(0xFFF7F2FA);
  static const darkBackground = Color(0xFF21003D);

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
    headlineLarge: GoogleFonts.poppins(fontSize: 24, color: primaryColor),
    titleMedium: GoogleFonts.poppins(fontSize: 18, color: primaryColor),
    bodyMedium: GoogleFonts.poppins(fontSize: 16, color: primaryColor),
    labelLarge: GoogleFonts.poppins(fontSize: 14, color: primaryColor),
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
