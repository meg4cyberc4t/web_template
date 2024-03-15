import 'package:flutter/material.dart';
import 'package:web_template/src/features/initialization/data/dependencies.dart';

/// {@template InheritedDependencies}
/// InheritedDependencies widget.
/// {@endtemplate}
class InheritedDependencies extends InheritedWidget {
  /// {@macro InheritedDependencies}
  const InheritedDependencies({
    required this.dependencies,
    required super.child,
    super.key,
  });

  /// Dependencies of the application.
  ///
  /// See also: [Dependencies].
  final Dependencies dependencies;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  static Dependencies? maybeOf(final BuildContext context) => context
      .getInheritedWidgetOfExactType<InheritedDependencies>()
      ?.dependencies;

  /// The state from the closest instance of this class
  /// that encloses the given context.
  static Dependencies of(final BuildContext context) =>
      maybeOf(context) ?? _notFoundInheritedWidget();

  static Never _notFoundInheritedWidget() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a InheritedDependencies of the exact type',
        'out_of_scope',
      );

  @override
  bool updateShouldNotify(final InheritedDependencies oldWidget) =>
      oldWidget.dependencies != dependencies;
}
