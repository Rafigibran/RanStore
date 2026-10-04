import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF0867F2);
  static const background = Color(0xFFF6F8FC);
  static const text = Color(0xFF101828);
  static const muted = Color(0xFF667085);

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.w800, color: text),
          titleLarge: TextStyle(fontWeight: FontWeight.w800, color: text),
          titleMedium: TextStyle(fontWeight: FontWeight.w700, color: text),
          bodyMedium: TextStyle(color: text),
          bodySmall: TextStyle(color: muted),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Color(0xFFE4E7EC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: primary, width: 1.5),
          ),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Color(0xFFE9F1FF),
        ),
      );
}