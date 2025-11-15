import 'package:flutter/material.dart';

/// AppTheme
/// - Centralise le thème global.
/// - Active Material 3.
/// - Génère un ColorScheme cohérent à partir d'une seedColor.
class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF006699),
        brightness: Brightness.light,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
