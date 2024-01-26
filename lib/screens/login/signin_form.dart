import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/screens/login/verifycode_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.loginAtBeginning});
  final bool loginAtBeginning;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isDarkMode_ = false;

  bool userNamePassword = false;
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/sign_in.png",
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 100),
        userNamePassword
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: isDarkMode_ ? secondaryBlack : lightBlue,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: const TextField(
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      minLines: 1,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide:
                                BorderSide(color: lightBlue200, width: 1.4)),
                        enabledBorder: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        hintText: "نام کاربری",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: isDarkMode_ ? secondaryBlack : lightBlue,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      maxLines: 1,
                      minLines: 1,
                      obscureText: _showPassword,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide:
                                BorderSide(color: lightBlue, width: 1.4)),
                        enabledBorder: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        hintText: "کلمه عبور",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: isDarkMode_ ? darkGray : darkGray,
                            )),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                decoration: BoxDecoration(
                  color: isDarkMode_ ? secondaryBlack : lightBlue,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: const TextField(
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide:
                            BorderSide(color: lightBlue200, width: 1.4)),
                    enabledBorder: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    hintText: "شماره موبایل",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            setState(() {
              userNamePassword = !userNamePassword;
            });
          },
          child: Text(
            userNamePassword
                ? "ورود با شتماره موبایل"
                : "ورورد با نام کاربری و رمز عبور",
            style: const TextStyle(
              color: lightGray,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: midBlue,
            foregroundColor: isDarkMode_ ? primaryBlack : white,
            elevation: 0,
            maximumSize: const Size(double.infinity, 52),
            minimumSize: const Size(double.infinity, 52),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              customPageRoute: MaterialPageRoute(
                builder: (context) => VerifyCodeScreen(
                    isLogin: true, loginAtBeginning: widget.loginAtBeginning),
              ),
              screen: const SizedBox(),
            );
          },
          child: const Text(
            "ورود به حساب کاربری",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
