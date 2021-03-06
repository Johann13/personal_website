import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/lang/default_lang.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lang/de.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static String get languageCode => html.window.navigator.language;

// Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    if(locale.languageCode=='de'){
      _localizedStrings = de;
    }else{
      _localizedStrings = defaultLang;
    }
    return true;
  }

  // This method will be called from every widget which needs a localized text
  Map get translations {
    return _localizedStrings;
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'de'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AppLocalizations localizations = new AppLocalizations(locale);
    String languageCode = AppLocalizations.languageCode;
    String saved = preferences.getString('languageCode');
    if (saved == null) {
      await preferences.setString('languageCode', languageCode);
    }
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
