import 'package:clean_architecture_flutter/core/extensions/string_extensions.dart';
import 'package:easy_localization/easy_localization.dart' show BuildContextEasyLocalizationExtension;

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello".tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(onPressed: () => context.setLocale(Locale('en', 'TH')), label: Text('TH')),
            ElevatedButton.icon(onPressed: () => context.setLocale(Locale('en', 'US')), label: Text('US')),
          ],
        ),
      ),
    );
  }
}
