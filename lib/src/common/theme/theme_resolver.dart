import 'package:flutter/material.dart';

/// {@template ThemeResolver}
/// A class for providing application themes
/// {@endtemplate}
final class ThemeResolver {
  /// {@macro ThemeResolver}
  ThemeResolver();

  final ColorScheme _darkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.lightGreen,
    brightness: Brightness.dark,
  );

  final ColorScheme _lightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
  );

  /// The dark theme of the application
  ThemeData get dark => ThemeData.from(
        colorScheme: _darkColorScheme,
      );

  /// The light theme of the application
  ThemeData get light => ThemeData.from(
        colorScheme: _lightColorScheme,
      );
}
