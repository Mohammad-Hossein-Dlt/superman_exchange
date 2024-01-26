import 'package:superman_exchange/utils/theme/theme_data/dark_theme.dart';
import 'package:superman_exchange/utils/theme/theme_data/light_theme.dart';
import 'package:superman_exchange/utils/theme/theme_entities.dart';
import 'package:superman_exchange/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTheme {
  static ThemeData theme({required ThemeEntities theme}) {
    ThemeData theme_ = lightTheme;

    if (theme == ThemeEntities.dark) {
      theme_ = darkTheme;
    }

    if (theme == ThemeEntities.light) {
      theme_ = lightTheme;
    }

    return theme_;
  }

  static bool isDarkMode(BuildContext ctx) {
    // var brightness = MediaQuery.of(ctx).platformBrightness;

    // return brightness == Brightness.dark;

    ThemeEntities theme = Provider.of<ThemeProvider>(ctx).theme;

    return theme == ThemeEntities.dark;
  }
}
