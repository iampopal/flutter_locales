# flutter_locales

Localize your Flutter app within seconds to multiple locales

## Why Flutter Locales
[x] Change Locale Language within app
[x] Save Locale Language After changed
[x] Easily Get Translation with `LocaleText('key')`

## Example App
Do a look at Simple app at [GitHub](https://github.com/iampopal/flutter_locales/example).

![Example App](simple.GIF)

### 1) Create locales assets
```
> | android
> | assets
>       | locales
>           | en.json
>           | fs.json
>           | ps.json
> | ios
> | lib
      | main.dart
```
![Example app assets/locales](assets.png)

### 2) Include Package and assets
> Include latest dependency
```
dependencies:
  flutter:
    sdk: flutter
  flutter_locales:
```
> Include assets
```
flutter:
  uses-material-design: true
  assets:
    - assets/locales/
```


### 3) Implement main app

> Replace your main app with
```
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'fa', 'ps']); // get last saved language

  runApp(MyApp());
}
```

> Wrap MaterialApp with `LocaleBuilder`
```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        title: 'Flutter Locales',
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
```
* `LocaleBuilder` refresh the app you change app language

## Change App Language 
`LocaleNotifier` Use To change app locale
```
LocaleNotifier.of(context).change('ps')
```
- When you change app automatically saves at Locale
- To get current locale call `LocaleNotifier.of(context).locale`

## Translate Text
`LocaleText` Use to translate a key
```
LocaleText(`welcome`);
```
* `LocaleText` Translate a key to string 
*  To get a key String call `Locales.string(constant, 'welcome')`

## Getting Started
This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
