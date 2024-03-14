import 'package:flutter/material.dart';
import 'package:web_template/src/common/theme/theme_resolver.dart';

/// The mixing ThemeStateMixin provides the functionality for
/// managing themes.
mixin ThemeStateMixin<T extends StatefulWidget> on State<T> {
  /// The main class of the navigaiton package.
  late final ThemeResolver _themeResolver;

  @override
  void initState() {
    _themeResolver = ThemeResolver();
    super.initState();
  }

  /// The light theme of the application
  ThemeData get lightTheme => _themeResolver.light;

  /// The dark theme of the application
  ThemeData get darkTheme => _themeResolver.dark;
}
