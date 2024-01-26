import 'package:superman_exchange/screens/welcome_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ExchangeApp());
}

class ExchangeApp extends StatefulWidget {
  const ExchangeApp({super.key});

  @override
  State<ExchangeApp> createState() => _ExchangeAppState();
}

class _ExchangeAppState extends State<ExchangeApp> {
  ThemeProvider themeProvider = ThemeProvider();

  void getTheme() async {
    themeProvider.setTheme = await themeProvider.themePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (buildContext) {
        return themeProvider;
      },
      child: Consumer<ThemeProvider>(
        builder: (buildContext, value, child) => MaterialApp(
          theme: AppTheme.theme(
            theme: themeProvider.theme,
          ),
          // darkTheme: darkTheme,
          // theme: lightTheme,
          debugShowCheckedModeBanner: false,

          home: const WelcomeScreen(),
        ),
      ),
    );
  }
}
