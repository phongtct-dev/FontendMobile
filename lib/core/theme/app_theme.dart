import 'package:flutter/material.dart';

class AppTheme {
  // Light Mode dựa trên lightPalette của bạn
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1877D2),
      onPrimary: Colors.white,
      surface: Color(0xFFFFFFFF),
      background: Color(0xFFEAEFF5),
    ),
    scaffoldBackgroundColor: const Color(0xFFEAEFF5),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF2A2E33)),
    ),
  );

  // Dark Mode dựa trên darkPalette của bạn
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1E91FF),
      onPrimary: Colors.white,
      surface: Color(0xFF1F2327),
      background: Color(0xFF13161B),
    ),
    scaffoldBackgroundColor: const Color(0xFF13161B),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFB9BEC4)),
    ),
  );
}