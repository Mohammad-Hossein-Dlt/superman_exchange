import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/login/signin_form.dart';
import 'package:superman_exchange/screens/login/signup_form.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/utils/theme/theme_entities.dart';
import 'package:superman_exchange/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, this.isLogin = true, required this.loginAtBeginning});

  bool isLogin;
  final bool loginAtBeginning;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDarkMode_ = false;
  bool isLogin = true;

  @override
  void initState() {
    isLogin = widget.isLogin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (isDarkMode_) {
              Provider.of<ThemeProvider>(context, listen: false).setTheme =
                  ThemeEntities.light;
            } else {
              Provider.of<ThemeProvider>(context, listen: false).setTheme =
                  ThemeEntities.dark;
            }
          },
          icon: Icon(
            isDarkMode_ ? Iconsax.sun_15 : Iconsax.moon5,
            color: isDarkMode_ ? yellow_darkTheme : lightBlue200,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              isLogin ? "ورود" : "ثبت نام",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLogin
                  ? SignInScreen(loginAtBeginning: widget.loginAtBeginning)
                  : SignUpScreen(loginAtBeginning: widget.loginAtBeginning),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  maximumSize: const Size(double.infinity, 52),
                  minimumSize: const Size(double.infinity, 52),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin ? "ساخت حساب کاربری" : "ورود به حساب کاربری",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
