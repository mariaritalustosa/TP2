import 'package:flutter/material.dart';
import 'package:tp2/themes/themes.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDarkMode = false;
  bool get isDarkMOde => _isDarkMode;

  ThemeData get themeData => _isDarkMode ? AppTheme.darkTheme: AppTheme.lightTheme;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark: ThemeMode.light;

  void toggleTheme(){
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
} 