import 'package:flutter/material.dart';
import 'package:web_template/src/common/environment/environment_store.dart';
import 'package:web_template/src/common/localizations/localizations_state_mixin.dart';
import 'package:web_template/src/common/navigation/router_state_mixin.dart';
import 'package:web_template/src/common/theme/theme_state_mixin.dart';
import 'package:web_template/src/features/initialization/data/dependencies.dart';

/// [MaterialContext] is an entry point to the material context.
///
/// This widget setting locales, themes, and routing.
class MaterialContext extends StatefulWidget {
  /// The default constructor
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext>
    with RouterStateMixin, LocalizationsStateMixin, ThemeStateMixin {
  late final IEnvironmentStore _environmentStore;

  @override
  void initState() {
    _environmentStore = Dependencies.of(context).environmentStore;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => MaterialApp.router(
        restorationScopeId: 'application',
        routerConfig: router.config,
        onGenerateTitle: (final context) => onGenerateTitle(
          context.localizations,
          _environmentStore.flavor,
        ),
        supportedLocales: localizationDelegate.supportedLocales,
        localizationsDelegates: localizationsDelegate,
        theme: lightTheme,
        darkTheme: darkTheme,
        builder: (final context, final child) {
          final MediaQueryData mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(
              /// We close the possibility to systematically
              /// increase or decrease the font for accessibility,
              /// so as not to break the layout
              textScaler: mediaQueryData.textScaler.clamp(
                minScaleFactor: _environmentStore.scaleFactor.min,
                maxScaleFactor: _environmentStore.scaleFactor.max,
              ),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
      );
}
