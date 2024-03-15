// ignore_for_file: do_not_use_environment

import 'package:flutter/foundation.dart';

/// Application environments.
abstract interface class IEnvironmentStore {
  const IEnvironmentStore();

  /// The current [EnvironmentFlavor] of a running application.
  abstract final EnvironmentFlavor flavor;
}

/// {@template IEnvironmentStore}
/// Implementation of a [IEnvironmentStore].
/// {@endtemplate}
final class EnvironmentStore implements IEnvironmentStore {
  /// {@macro IEnvironmentStore}
  EnvironmentStore();

  @override
  EnvironmentFlavor get flavor => EnvironmentFlavor.fromString(
        const String.fromEnvironment(
          'ENVIRONMENT',
          defaultValue: 'PRODUCTION',
        ),
      );
}

/// A list of flavors for the app.
///
/// You can track them in launch.json
enum EnvironmentFlavor {
  /// Production flavor. Used by default.
  production,

  /// Development flavor.
  ///
  /// It is expected to be used exclusively by developers and testers.
  development;

  /// The constructor for [EnvironmentFlavor] from String.
  /// It will take values that will match in value.
  /// Otherwise, it will take production flavor if the launch mod
  /// is a release, or the development option if the mod is not a release one.
  static EnvironmentFlavor fromString(final String value) {
    switch (value) {
      case 'PRODUCTION':
        return production;
      case 'DEVELOPMENT':
        return development;
      case _:
        return kReleaseMode ? production : development;
    }
  }

  /// Whether the environment is production.
  bool get isProduction => this == production;

  /// Whether the environment is development.
  bool get isDevelopment => this == development;
}
