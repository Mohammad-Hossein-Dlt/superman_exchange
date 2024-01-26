import 'package:superman_exchange/utils/theme/theme_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  String THEME_STATUS = "THEMESTATUS";

  void setTheme({required ThemeEntities theme}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(THEME_STATUS, theme.toString());
  }

  Future<ThemeEntities> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ThemeEntities theme = ThemeEntities.light;
    String value =
        preferences.getString(THEME_STATUS) ?? ThemeEntities.light.toString();
    if (value == ThemeEntities.dark.toString()) {
      theme = ThemeEntities.dark;
    }
    if (value == ThemeEntities.light.toString()) {
      theme = ThemeEntities.light;
    }
    return theme;
  }
}
