import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UserProfileEditScreen extends StatefulWidget {
  const UserProfileEditScreen({super.key});

  @override
  State<UserProfileEditScreen> createState() => _UserProfileEditScreenState();
}

class _UserProfileEditScreenState extends State<UserProfileEditScreen> {
  bool isDarkMode_ = false;

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
                    "نام",
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
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    hintText: "نام",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "نام خانوادگی",
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
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    hintText: "نام خانوادگی",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "آدرس ایمیل",
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
                child: const TextField(
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.emailAddress,
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
                    hintText: "com.__@__",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "شماره موبایل",
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
                child: const TextField(
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.phone,
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
                    hintText: "...09",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
