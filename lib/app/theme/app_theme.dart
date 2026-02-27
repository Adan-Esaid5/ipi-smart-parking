import 'package:flutter/material.dart';

class AppTheme {
  // Dark + Yellow brand palette
  static const Color bg = Color(0xFF0B0F14);
  static const Color card = Color(0xFF141A22);
  static const Color text = Color(0xFFEAF0F6);
  static const Color text2 = Color(0xFF9AA6B2);
  static const Color yellow = Color(0xFFFFC107);

  static ThemeData dark(TextTheme baseText) {
    const scheme = ColorScheme.dark(
      primary: yellow,
      secondary: yellow,
      surface: card,
      onSurface: text,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      error: Colors.redAccent,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: bg,
      textTheme: baseText.apply(bodyColor: text, displayColor: text),
      appBarTheme: const AppBarTheme(
        backgroundColor: bg,
        foregroundColor: text,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: card,
        hintStyle: const TextStyle(color: text2),
        labelStyle: const TextStyle(color: text2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: yellow,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: text,
          side: const BorderSide(color: Color(0xFF2A3441)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFF25303C)),
    );
  }

  static ThemeData light(TextTheme baseText) {
    return ThemeData(
      useMaterial3: true,
      textTheme: baseText,
      colorScheme: ColorScheme.fromSeed(seedColor: yellow),
    );
  }
}