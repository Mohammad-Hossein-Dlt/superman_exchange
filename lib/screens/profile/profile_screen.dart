import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/profile/add_card_screen.dart';
import 'package:superman_exchange/screens/profile/authentication_screen.dart';
import 'package:superman_exchange/screens/profile/two_step_password_screen.dart';
import 'package:superman_exchange/screens/profile/user_password_edit_screen.dart';
import 'package:superman_exchange/screens/profile/user_profile_edit_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/utils/theme/theme_entities.dart';
import 'package:superman_exchange/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode_ = false;

  Map userData = {
    "userFullName": "محمدحسین دولت آبادی",
    "userProfileImage": "assets/images/profile_avatar.png",
  };
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
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
              "پروفایل",
              style: TextStyle(
                color: isDarkMode_ ? white : primaryBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: isDarkMode_ ? secondaryBlack : lightBlue,
                      elevation: 0,
                      shadowColor: Theme.of(context).colorScheme.shadow,
                      maximumSize: const Size(52, 52),
                      minimumSize: const Size(52, 52),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.camera5,
                      size: 24,
                      color: isDarkMode_ ? blue : midBlue,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 108,
                        height: 108,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: isDarkMode_ ? darkBlue900 : lightBlue,
                        ),
                      ),
                      Image.asset(
                        userData["userProfileImage"],
                        width: 75,
                        height: 86,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "سلام ${userData["userFullName"]}",
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "اینجا میتونی تنظیمات اکانتت رو انجام بدی.",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: lightGray),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  item(
                    title: "اطلاعات حساب کاربری",
                    subTitle: "نام کاربری ، شماره همراه ، رمز عبور ...",
                    icon: Icon(
                      Iconsax.user_edit,
                      size: 24,
                      color: isDarkMode_ ? white : secondaryBlack,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UserProfileEditScreen(),
                        ),
                      );
                    },
                  ),
                  item(
                    title: "رمز عبور",
                    subTitle: "تغییر پسورد اکانت",
                    icon: Icon(
                      Iconsax.password_check,
                      size: 24,
                      color: isDarkMode_ ? white : secondaryBlack,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UserPasswordEditScreen(),
                        ),
                      );
                    },
                  ),
                  item(
                    title: "احراز هویت",
                    subTitle:
                        "تغییرات شماره تماس و ارسال مدارک در این بخش است.",
                    icon: Icon(
                      Iconsax.personalcard,
                      size: 24,
                      color: isDarkMode_ ? white : secondaryBlack,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AuthenticationScreen(),
                        ),
                      );
                    },
                  ),
                  item(
                    title: "رمز دو مرحله ایی",
                    subTitle:
                        "برای امنیت حسابتون در این بخش میتوانید اقدام کنید.",
                    icon: Icon(
                      Iconsax.shield_security2,
                      size: 24,
                      color: isDarkMode_ ? white : secondaryBlack,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TwoStepPasswordScreen(),
                        ),
                      );
                    },
                  ),
                  item(
                    title: "کارت بانکی",
                    subTitle: "برای خرید باید کارت بانکی اضافه کنید.",
                    icon: Icon(
                      Iconsax.card_add,
                      size: 24,
                      color: isDarkMode_ ? white : secondaryBlack,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddCardScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget item({
    required String title,
    String? subTitle,
    required Widget icon,
    required Function() function,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: isDarkMode_ ? secondaryBlack : Colors.white,
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              onTap: () {
                function();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                subTitle != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              subTitle,
                                              textDirection: TextDirection.rtl,
                                              // overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: lightGray,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: isDarkMode_ ? tertiaryBlack : lightBlue,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: icon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
