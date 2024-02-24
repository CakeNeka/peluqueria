import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Colors.black;

  static ThemeData lightMode = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade600,
        error: Colors.redAccent.shade400,
      ),
      textTheme: ThemeData.light().textTheme.apply(
            bodyColor: Colors.grey[800],
            displayColor: Colors.black,
          ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[500]),
      )

      /*
    scaffoldBackgroundColor: lightMode.colorScheme.background,
    appBarTheme:
        AppBarTheme(elevation: 0, color: lightMode.colorScheme.secondary),
        */
      );
}
