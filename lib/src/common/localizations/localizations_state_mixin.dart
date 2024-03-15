import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:web_template/src/common/config/config.dart';
import 'package:web_template/src/common/localizations/generated/l10n.dart';

/// The mixing LocalizationsStateMixin provides the functionality for
/// managing the localizations.
mixin LocalizationsStateMixin<T extends StatefulWidget> on State<T> {
  /// The main localization delegate.
  late final AppLocalizationDelegate localizationDelegate;

  @override
  void initState() {
    localizationDelegate = const AppLocalizationDelegate();
    super.initState();
  }

  /// Title for the application.
  String onGenerateTitle(
    final GeneratedLocalization localization,
    final EnvironmentFlavor flavor,
  ) =>
      switch (flavor) {
        EnvironmentFlavor.production => localization.title,
        EnvironmentFlavor.development => localization.titleOfDevelopment,
      };

  /// List of LocalizationsDelegate
  late final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegate = [
    localizationDelegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}

/// Provider of localization for BuildContext
extension LocalizationsBuildExtension on BuildContext {
  /// The main localization delegate.
  GeneratedLocalization get localizations => GeneratedLocalization.of(this);
}
