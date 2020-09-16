part of 'locale_notifier.dart';

class LocaleBuilder extends StatefulWidget {
  LocaleBuilder({@required this.builder, Key key}) : super(key: key);
  final Widget Function(Locale) builder;
  @override
  _LocaleBuilderState createState() => _LocaleBuilderState();
}

class _LocaleBuilderState extends State<LocaleBuilder> {
  Locale locale;

  @override
  void initState() {
    super.initState();
    locale = PreferenceUtils.instance.locale;
  }

  @override
  Widget build(BuildContext context) {
    return LocaleNotifier(
      state: this,
      child: Builder(
        builder: (context) => widget.builder(LocaleNotifier.of(context).locale),
      ),
    );
  }

  changeLocale(String lng) {
    setState(() {
      PreferenceUtils.instance.setLocale(lng);
      locale = PreferenceUtils.instance.locale;
    });
  }
}
