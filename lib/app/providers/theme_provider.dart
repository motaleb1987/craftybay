import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ThemeProvider extends ChangeNotifier{
  final String _themeKey = 'theme';

   ThemeMode _mode = ThemeMode.system;

  ThemeMode get themeMode => _mode;


  List<ThemeMode> get themeModes => [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system
  ];



  void changeThemeMode(ThemeMode newThemeMode){
    _mode = newThemeMode;
    _saveThemeMode();
    notifyListeners();
  }


  Future<void> _saveThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeKey, _mode.name);
  }

  Future<void> loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString(_themeKey);
    if(savedTheme != null){
      _mode = ThemeMode.values.firstWhere((mode) => mode.name == savedTheme);
    }
  }

}