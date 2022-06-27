import 'package:flutter/cupertino.dart';
import 'package:flutter_locales/flutter_locales.dart';

extension LocalesExtension on BuildContext {
  Locales? get locales => Locales.of(this);
  changeLocale(String lang) => Locales.change(this, lang);
  Locale? get currentLocale => Locales.currentLocale(this);
  String localeString(String key,
          {List<String>? params, List<String>? localeParams}) =>
      Locales.string(this, key, params: params, localeParams: localeParams);
}

extension LocalesStringExtension on String {
  String localize(BuildContext context,
          {List<String>? params, List<String>? localeParams}) =>
      context.localeString(this, params: params, localeParams: localeParams);
}
