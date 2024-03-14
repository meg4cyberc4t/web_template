import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';
import 'package:web_template/src/common/logger/logger.dart';
import 'package:web_template/src/common/logger/observers/navigator_observer.dart';
import 'package:web_template/src/common/navigation/routes.dart';

/// The mixing RouterStateMixin provides the functionality for
/// managing the navigation router.
mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  /// The main class of the navigaiton package.
  late final Octopus router;

  @override
  void initState() {
    router = Octopus(
      routes: Routes.values,
      defaultRoute: Routes.home,
      observers: [
        LoggerNavigatorObserver(),
      ],
      onError: (final error, final stackTrace) => logger.error(
        'Exception in navigation',
        error: error,
        stackTrace: stackTrace,
      ),
    );
    super.initState();
  }
}
