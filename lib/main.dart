import 'dart:async';

import 'package:web_template/src/common/logger/logger.dart';
import 'package:web_template/src/features/initialization/logic/app_runner.dart';

void main() {
  logger.runLogging(
    () {
      runZonedGuarded(
        () async => AppRunner().initializeAndRun(),
        logger.logZoneError,
      );
    },
    const LogOptions(),
  );
}
