import 'package:flutter/material.dart';
import 'locales.dart';

class LocaleText extends StatelessWidget {
  const LocaleText(
    this.k, {
    this.style,
    this.upperCase = false,
    Key? key,
    this.overflow,
    this.locale = true,
  }) : super(key: key);
  final String k;
  final TextStyle? style;
  final bool upperCase, locale;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    String s = !locale ? k : Locales.string(context, k);
    if (upperCase) {
      s = s.toUpperCase();
    }
    return Text(
      s,
      style: style,
      overflow: overflow,
    );
  }
}
