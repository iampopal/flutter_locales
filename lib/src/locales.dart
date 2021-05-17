import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'preference_utils.dart';

class Locales {
  final Locale locale;
  Locales(this.locale);
  static Locales? of(BuildContext context) {
    return Localizations.of<Locales>(context, Locales);
  }

  static late List<Locale> supportedLocales;

  static Future init(List<String> localeNames) async {
    try {
      supportedLocales = localeNames.map((n) => Locale(n)).toList();
      await PreferenceUtils.init();
    } catch (e) {}
  }

  static change(BuildContext context, String lang) =>
      LocaleNotifier.of(context)!.change(lang);

  static Locale? currentLocale(context) => LocaleNotifier.of(context)!.locale;

  static const LocalizationsDelegate<Locales> delegate = _LocalesDelegate();

  static const delegates = [
    Locales.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  Map<String, String> _localizedStings = HashMap();

  Future load() async {
    String lng = locale.languageCode;
    String jsonString = await rootBundle.loadString("assets/locales/$lng.json");

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String get(String key) {
    return _localizedStings[key] ?? "\$$key";
  }

  static String string(BuildContext context, String key) {
    return Localizations.of<Locales>(context, Locales)!.get(key);
  }
}

class _LocalesDelegate extends LocalizationsDelegate<Locales> {
  const _LocalesDelegate();
  @override
  bool isSupported(Locale locale) {
    for (Locale l in Locales.supportedLocales) {
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<Locales> load(Locale locale) async {
    Locales localization = Locales(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Locales> old) {
    return false;
  }
}
