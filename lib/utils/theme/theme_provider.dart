import 'package:superman_exchange/utils/theme/theme_entities.dart';
import 'package:superman_exchange/utils/theme/theme_preference.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();

  ThemeEntities _THEME_STATE = ThemeEntities.light;

  ThemeEntities get theme => _THEME_STATE;

  set setTheme(ThemeEntities theme) {
    _THEME_STATE = theme;
    themePreference.setTheme(theme: theme);
    notifyListeners();
  }
}
