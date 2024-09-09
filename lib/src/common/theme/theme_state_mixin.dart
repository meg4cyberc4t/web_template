import 'package:flutter/material.dart';

/// The mixing ThemeStateMixin provides the functionality for
/// managing themes.
mixin ThemeStateMixin<T extends StatefulWidget> on State<T> {
  /// The dark theme of the application
  final ThemeData darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.lightGreen,
      brightness: Brightness.dark,
    ),
  );

  /// The light theme of the application
  final ThemeData lightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ),
  );
}
