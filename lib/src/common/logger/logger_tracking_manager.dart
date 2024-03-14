import 'dart:async';

import 'package:meta/meta.dart';
import 'package:web_template/src/common/logger/logger.dart';

/// {@template TrackingManager}
/// A class which is responsible for enabling error tracking.
/// {@endtemplate}
abstract base class LoggerTrackingManager {
  final Logger _logger;
  StreamSubscription<LogMessage>? _subscription;

  /// {@macro TrackingManager}
  LoggerTrackingManager(this._logger);

  /// Enables error tracking.
  ///
  /// This method should be called when the user has opted in to error tracking.
  Future<void> enableReporting() async {
    _subscription ??=
        _logger.logs.where(logsCondition).listen((final log) async {
      await onReport(log);
    });
  }

  /// Disables error tracking.
  ///
  /// This method should be called when the user has opted out of error tracking
  Future<void> disableReporting() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  /// Logs condition for the collect
  @protected
  bool logsCondition(final LogMessage event);

  /// Handles the log message.
  ///
  /// This method is called when a log message is received.
  Future<void> onReport(final LogMessage log);
}
