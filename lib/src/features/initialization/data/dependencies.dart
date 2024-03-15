import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_template/src/common/app_metadata/app_metadata.dart';
import 'package:web_template/src/common/config/config.dart';
import 'package:web_template/src/features/initialization/widget/inherited_dependencies.dart';

/// {@template Dependencies}
/// Dependencies of application
/// {@endtemplate}
final class Dependencies {
  /// {@macro Dependencies}
  const Dependencies({
    required this.flutterSecureStorage,
    required this.appMetadata,
    required this.environmentStore,
  });

  /// The state from the closest instance of this class.
  factory Dependencies.of(final BuildContext context) =>
      InheritedDependencies.of(context);

  /// Shared preferences
  final FlutterSecureStorage flutterSecureStorage;

  /// {@macro AppMetadata}
  final AppMetadata appMetadata;

  /// {@macro IEnvironmentStore}
  final IEnvironmentStore environmentStore;
}
