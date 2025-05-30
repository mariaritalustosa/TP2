import 'package:flutter/material.dart';

class Theme{
  static final primaryColor = Colors.blue.shade800;
  static final accentColor = Colors.orangeAccent;

  static final inputDecoration = InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    labelStyle: TextStyle(color: primaryColor),
  );
}
