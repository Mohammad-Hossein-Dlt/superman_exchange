import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isDarkMode_ = false;

  List<String> description = [
    "تصویر کارت ملی با شماره کارت یکی باشد.",
    "نام صاحب شماره با کارت بانکی باید یکی باشد.",
    "در نور مناسب تصاویر رو بگیرید.",
    "تصویر رو ادیت نکنید.",
    "عکس رو کراپ نکنید.",
    "حداکثر حجم 240 کیلوبایت.",
  ];
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          elevation: 0,
          forceElevated: true,
          pinned: true,
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
                "احراز هویت طلایی",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  "assets/images/authentication.png",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    width: double.infinity,
                    height: 134,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondaryBlack,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.camera, size: 24, color: lightGray),
                        SizedBox(height: 10),
                        Text(
                          "تصویر کارت ملی",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: lightGray),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    width: double.infinity,
                    height: 134,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondaryBlack,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.camera, size: 24, color: lightGray),
                        SizedBox(height: 10),
                        Text(
                          "عکس سلفی",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: lightGray),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ...description.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          e,
                          textDirection: TextDirection.rtl,
                          style:
                              const TextStyle(fontSize: 14, color: lightGray),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.check_rounded,
                          color: green,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    elevation: 0,
                    maximumSize: const Size(double.infinity, 52),
                    minimumSize: const Size(double.infinity, 52),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "ثبت درخواست",
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
      ]),
    );
  }
}
