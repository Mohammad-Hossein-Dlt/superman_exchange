import 'package:provider/provider.dart';
import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/screens/main_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key, required this.loginAtBeginning});
  final bool loginAtBeginning;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isDarkMode_ = false;

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
                  borderSide: BorderSide(color: lightBlue200, width: 1.4)),
              enabledBorder: InputBorder.none,
              hintTextDirection: TextDirection.rtl,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
              hintText: "نام و نام خانوادگی",
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
          child: const TextField(
            textDirection: TextDirection.rtl,
            maxLines: 1,
            minLines: 1,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(color: lightBlue200, width: 1.4)),
              enabledBorder: InputBorder.none,
              hintTextDirection: TextDirection.rtl,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
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
          child: const TextField(
            textDirection: TextDirection.rtl,
            maxLines: 1,
            minLines: 1,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(color: lightBlue200, width: 1.4)),
              enabledBorder: InputBorder.none,
              hintTextDirection: TextDirection.rtl,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
              hintText: "کد ملی",
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
          child: const TextField(
            textDirection: TextDirection.rtl,
            maxLines: 1,
            minLines: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(color: lightBlue200, width: 1.4)),
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
                  borderSide: BorderSide(color: lightBlue, width: 1.4)),
              enabledBorder: InputBorder.none,
              hintTextDirection: TextDirection.rtl,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
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
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                    color: isDarkMode_ ? darkGray : darkGray,
                  )),
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
                  borderSide: BorderSide(color: lightBlue200, width: 1.4)),
              enabledBorder: InputBorder.none,
              hintTextDirection: TextDirection.rtl,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
              hintText: "تکرار کلمه عبور",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showConfirmPassword = !_showConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _showConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: isDarkMode_ ? darkGray : darkGray,
                  )),
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
            if (widget.loginAtBeginning) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainScreenNavigationBar(),
                ),
              );
            } else {
              Provider.of<UserProvider>(context, listen: false).loginStatus =
                  true;
              Navigator.of(context).pop(
                MaterialPageRoute(
                    builder: (_) => const MainScreenNavigationBar()),
                // ModalRoute.withName("MainScreenNavigationBar"),
              );
            }
          },
          child: const Text(
            "ثبت نام",
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
