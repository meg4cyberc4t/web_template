import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:web_template/src/common/logger/logger.dart';

/// {@template LoggerBlocObserver}
/// An [LoggerBlocObserver] for observing the behavior of [Bloc] instances.
/// {@endtemplate}
final class LoggerBlocObserver extends BlocObserver {
  /// {@macro LoggerBlocObserver}
  const LoggerBlocObserver();

  /// Called whenever a [Bloc] is instantiated.
  /// In many cases, a cubit may be lazily instantiated and
  /// [onCreate] can be used to observe exactly when the cubit
  /// instance is created.
  @override
  @protected
  @mustCallSuper
  void onCreate(final BlocBase<dynamic> bloc) {
    logger.verbose('Bloc | onCreate ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  /// Called whenever an [event] is `added` to any [bloc] with the given [bloc]
  /// and [event].
  @override
  @protected
  @mustCallSuper
  void onEvent(final Bloc<dynamic, dynamic> bloc, final Object? event) {
    logger.verbose('Bloc | onEvent ${bloc.runtimeType} with event $event');
    super.onEvent(bloc, event);
  }

  /// Called whenever a [Change] occurs in any [bloc]
  /// A [change] occurs when a new state is emitted.
  /// [onChange] is called before a bloc's state has been updated.
  @override
  @protected
  @mustCallSuper
  void onChange(final BlocBase<dynamic> bloc, final Change<dynamic> change) {
    logger.verbose(
      'Bloc | onChange ${bloc.runtimeType} '
      'from ${change.currentState} to ${change.nextState}',
    );
    super.onChange(bloc, change);
  }

  /// Called whenever a transition occurs in any [bloc] with the given [bloc]
  /// and [transition].
  /// A [transition] occurs when a new `event` is added
  /// and a new state is `emitted` from a corresponding [EventHandler].
  /// [onTransition] is called before a [bloc]'s state has been updated.
  @override
  @protected
  @mustCallSuper
  void onTransition(
    final Bloc<dynamic, dynamic> bloc,
    final Transition<dynamic, dynamic> transition,
  ) {
    logger.verbose(
      'Bloc | onTransition ${bloc.runtimeType} '
      'from ${transition.currentState} to ${transition.nextState}',
    );
    super.onTransition(bloc, transition);
  }

  /// Called whenever an [error] is thrown in any [Bloc] or [Cubit].
  /// The [stackTrace] argument may be [StackTrace.empty] if an error
  /// was received without a stack trace.
  @override
  @protected
  @mustCallSuper
  void onError(
    final BlocBase<dynamic> bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    logger.error(
      'Bloc | onError ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  /// Called whenever a [Bloc] is closed.
  /// [onClose] is called just before the [Bloc] is closed
  /// and indicates that the particular instance will no longer
  /// emit new states.
  @override
  @protected
  @mustCallSuper
  void onClose(final BlocBase<dynamic> bloc) {
    logger.verbose('Bloc | onClose ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
