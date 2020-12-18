import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocal{

   Locale locale;
  AppLocal({this.locale});


  static AppLocal of(BuildContext context){
    return Localizations.of(context, AppLocal);
  }

  Map<String, String> _trans;

  Future loadLangs() async {
    String langFile = await rootBundle.loadString('assets/${locale.languageCode}.json');
    Map<String, dynamic> _loadedlang = jsonDecode(langFile);
    _trans = _loadedlang.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslate(String key){
    return _trans[key];
  }

  static const LocalizationsDelegate<AppLocal> delegate = _AppLocalDelegate();

}


class _AppLocalDelegate extends LocalizationsDelegate<AppLocal>{
  const _AppLocalDelegate();

  @override
  bool isSupported(Locale locale) {
   return ["ar", "en", "fr", "ur"].contains(locale.languageCode);
  }

  @override
  Future<AppLocal> load(Locale locale)async {
   AppLocal appLocal = AppLocal(locale: locale);
   await appLocal.loadLangs();

   return appLocal;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocal> old) => false;

}