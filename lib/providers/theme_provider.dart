import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMOde(ThemeMode mode){
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeMode == ThemeMode.dark){
      _themeMode = ThemeMode.light;
    } else{
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}