import 'package:flutter/widgets.dart';
import 'package:web_template/src/common/logger/logger.dart';

/// Makes an observer for navigator.
///
/// Notifies the logger about the user's navigation movements.
final class LoggerNavigatorObserver extends NavigatorObserver {
  /// The [Navigator] pushed `route`.
  ///
  /// The route immediately below that one, and thus the previously active
  /// route, is `previousRoute`.
  @override
  @mustCallSuper
  void didPush(
    final Route<dynamic> route,
    final Route<dynamic>? previousRoute,
  ) =>
      logger.info('Navigator | didPush: ${route.settings}');

  /// The [Navigator] popped `route`.
  ///
  /// The route immediately below that one, and thus the newly active
  /// route, is `previousRoute`.
  @override
  @mustCallSuper
  void didPop(
    final Route<dynamic> route,
    final Route<dynamic>? previousRoute,
  ) =>
      logger.info('Navigator | didPop: ${route.settings}');

  /// The [Navigator] removed `route`.
  ///
  /// If only one route is being removed, then the route immediately below
  /// that one, if any, is `previousRoute`.
  ///
  /// If multiple routes are being removed, then the route below the
  /// bottommost route being removed, if any, is `previousRoute`, and this
  /// method will be called once for each removed route, from the topmost route
  /// to the bottommost route.
  @override
  @mustCallSuper
  void didRemove(
    final Route<dynamic> route,
    final Route<dynamic>? previousRoute,
  ) =>
      logger.info('Navigator | didRemove: ${route.settings}');

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  @mustCallSuper
  void didReplace({
    final Route<dynamic>? newRoute,
    final Route<dynamic>? oldRoute,
  }) =>
      logger.info(
        'Navigator | didReplace: ${newRoute?.settings} '
        'from ${oldRoute?.settings}',
      );

  /// The [Navigator]'s routes are being moved by a user gesture.
  ///
  /// For example, this is called when an iOS back gesture starts, and is used
  /// to disabled hero animations during such interactions.
  @override
  @mustCallSuper
  void didStartUserGesture(
    final Route<dynamic> route,
    final Route<dynamic>? previousRoute,
  ) =>
      logger.info('Navigator | didStartUserGesture: ${route.settings}');

  /// User gesture is no longer controlling the [Navigator].
  ///
  /// Paired with an earlier call to [didStartUserGesture].
  @override
  void didStopUserGesture() => logger.info('Navigator | didStopUserGesture');
}
