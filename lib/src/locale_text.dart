import 'package:flutter/material.dart';
import 'locales.dart';

class LocaleText extends Text {
  const LocaleText(
    this.k, {
    this.style,
    this.upperCase = false,
    Key? key,
    this.overflow,
    this.localize = true,
    this.params,
    this.textAlign,
    this.textDirection,
    this.localeParams,
    this.maxLines,
  }) : super(
          k,
          key: key,
          style: style,
          overflow: overflow,
          textAlign: textAlign,
          textDirection: textDirection,
          maxLines: maxLines,
        );
  final String k;
  final TextStyle? style;
  final bool upperCase, localize;
  final TextOverflow? overflow;
  final List<String>? params, localeParams;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    String s = !localize
        ? k
        : Locales.string(
            context,
            k,
            params: params,
            localeParams: localeParams,
          );
    if (upperCase) {
      s = s.toUpperCase();
    }
    return Text(
      s,
      style: this.style,
      overflow: this.overflow,
      textAlign: this.textAlign,
      maxLines: this.maxLines,
    );
  }
}
