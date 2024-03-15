// ignore_for_file: public_member_api_docs

import 'dart:js_interop' show NullableObjectUtilExtension;

import 'package:flutter/material.dart';
import 'package:web/web.dart' hide Text;
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
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Source Code Repository'),
          onPressed: () {
            console.log(DateTime.now().jsify());
            for (int i = 0; i < 9999999; i++) {
              for (int l = 0; l < 99999999; l++) {
                for (int k = 0; k < 9999999; k++) {
                  final ans = k * l * i;
                  console.log(ans.jsify());
                }
              }
            }
            console.log(DateTime.now().jsify());
            //TODO:!
          },
        ),
      );
}
