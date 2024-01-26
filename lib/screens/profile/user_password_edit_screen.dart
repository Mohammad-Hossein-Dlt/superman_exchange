import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UserPasswordEditScreen extends StatefulWidget {
  const UserPasswordEditScreen({super.key});

  @override
  State<UserPasswordEditScreen> createState() => _UserPasswordEditScreenState();
}

class _UserPasswordEditScreenState extends State<UserPasswordEditScreen> {
  bool isDarkMode_ = false;

  bool _showCurentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmNewPassword = false;
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: IconButton(
              style: IconButton.styleFrom(
                side: BorderSide(
                  color: isDarkMode_ ? darkGray : gray200,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Iconsax.arrow_left,
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "تغییر پروفایل",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "رمز عبور فعلی",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: lightGray,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode_ ? secondaryBlack : lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  maxLines: 1,
                  minLines: 1,
                  obscureText: !_showCurentPassword,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide:
                            BorderSide(color: lightBlue200, width: 1.4)),
                    enabledBorder: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    hintText: "",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showCurentPassword = !_showCurentPassword;
                          });
                        },
                        icon: Icon(
                          !_showCurentPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: isDarkMode_ ? darkGray : darkGray,
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "رمز عبور جدید",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: lightGray,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode_ ? secondaryBlack : lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  maxLines: 1,
                  minLines: 1,
                  obscureText: !_showNewPassword,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide:
                            BorderSide(color: lightBlue200, width: 1.4)),
                    enabledBorder: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    hintText: "",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showNewPassword = !_showNewPassword;
                          });
                        },
                        icon: Icon(
                          !_showNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: isDarkMode_ ? darkGray : darkGray,
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "تکرار رمز عبور جدید",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: lightGray,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode_ ? secondaryBlack : lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  maxLines: 1,
                  minLines: 1,
                  obscureText: !_showConfirmNewPassword,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide:
                            BorderSide(color: lightBlue200, width: 1.4)),
                    enabledBorder: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    hintText: "",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showConfirmNewPassword = !_showConfirmNewPassword;
                          });
                        },
                        icon: Icon(
                          !_showConfirmNewPassword
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
                  elevation: 0,
                  maximumSize: const Size(226, 56),
                  minimumSize: const Size(226, 56),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                onPressed: () {},
                child: const Text(
                  "بروزرسانی",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
