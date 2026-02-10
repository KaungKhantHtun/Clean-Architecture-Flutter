import 'package:easy_localization/easy_localization.dart';

extension Translate on String {
  // String tr() {
  //   return StringTranslateExtension(this).tr();
  // }

  String get tr => StringTranslateExtension(this).tr();
}
