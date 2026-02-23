import 'package:craftybay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalizationProvider extends ChangeNotifier{
  final String _localKey = 'local';
  Locale _locale = Locale('en');
  Locale get local => _locale;

  List<Locale> get supportedLocals => AppLocalizations.supportedLocales;

  void changeLocal(Locale newLocal){
    _locale = newLocal;
    _saveLocale();
    notifyListeners();
  }


  Future<void> _saveLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_localKey, _locale.languageCode);
  }

  Future<void> loadLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocale = prefs.getString(_localKey);
    if(savedLocale != null){
      _locale = Locale(savedLocale);
    }
  }

}