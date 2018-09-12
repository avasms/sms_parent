import 'dart:ui';
import 'package:fluro/fluro.dart';

class Application {

  static final Application _application = Application._internal();
  static Router router;

  factory Application() {
    return _application;
  }

  Application._internal();

  final List<String> supportedLanguagesCodes = [
    "en",
    "my",
  ];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;

  
}

Application application = Application();

typedef void LocaleChangeCallback(Locale locale);