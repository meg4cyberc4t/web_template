import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:web_template/src/common/app_metadata/app_metadata.dart';
import 'package:web_template/src/common/application/application.dart';
import 'package:web_template/src/common/environment/environment_store.dart';
import 'package:web_template/src/common/logger/logger.dart';
import 'package:web_template/src/common/logger/observers/bloc_observer.dart';
import 'package:web_template/src/features/initialization/data/dependencies.dart';
import 'package:web_template/src/features/initialization/data/initialization_result.dart';

/// The starting point of the application
final class AppRunner {
  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun() async {
    final WidgetsBinding bindings = WidgetsFlutterBinding.ensureInitialized()
      ..deferFirstFrame();

    FlutterError.onError = logger.logFlutterError;
    PlatformDispatcher.instance.onError = logger.logPlatformDispatcherError;

    final InitializationResult result = await processInitialization();

    bindings.allowFirstFrame();

    runApp(Application(dependencies: result.dependencies));
  }

  /// Initializing dependencies
  @visibleForTesting
  Future<InitializationResult> processInitialization() async {
    logger.info('Dependencies initialization has started');
    final stopwatch = Stopwatch()..start();

    final dependencies = await _$initializationDependencies();

    stopwatch.stop();
    logger.info(
      'Dependencies initialization'
      ' has ended in ${stopwatch.elapsedMilliseconds}ms',
    );

    return InitializationResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
  }

  Future<Dependencies> _$initializationDependencies() async {
    Bloc.observer = const LoggerBlocObserver();

    const environmentStore = EnvironmentStore();

    const flutterSecureStorage = FlutterSecureStorage();

    final packageInfo = await PackageInfo.fromPlatform();
    final appMetadata = AppMetadata(
      packageInfo,
    );

    return Dependencies(
      flutterSecureStorage: flutterSecureStorage,
      appMetadata: appMetadata,
      environmentStore: environmentStore,
    );
  }
}
