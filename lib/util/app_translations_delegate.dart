import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/util/application.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  final Locale newLocale;

  const AppTranslationsDelegate({this.newLocale});

 // @override
  //bool isSupported(Locale locale) {
  //  return ["en", "my"].contains(locale.languageCode);
  //}

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
  @override
  bool isSupported(Locale locale) {
    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }
}