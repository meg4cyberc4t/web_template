// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:web_template/src/common/localizations/localizations_state_mixin.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.localizations.title),
        ),
        body: Center(
          child: Text(context.localizations.title),
        ),
      );
}
