import 'package:flutter/material.dart';

class AppTheme {
  // 🔵 Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightGreen,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightGreen,
      foregroundColor: Color.fromARGB(255, 0, 0, 0),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.lightGreen,
      secondary: Colors.orange,
      tertiary: Color.fromARGB(255, 95, 94, 94),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: const Color.fromARGB(255, 41, 41, 41),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.green,
      secondary: Colors.teal,
      tertiary: Color.fromARGB(255, 235, 233, 233),
    ),
  );
}
