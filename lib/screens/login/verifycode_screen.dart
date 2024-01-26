import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/screens/main_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/persian_number.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen(
      {super.key, required this.isLogin, required this.loginAtBeginning});
  final bool isLogin;
  final bool loginAtBeginning;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool isDarkMode_ = false;

  late Timer countDown;

  Duration duration = const Duration(seconds: 59);

  void setCountDown() {
    int reduceSeconsBy = 1;
    setState(() {
      final curentSeconds = duration.inSeconds - reduceSeconsBy;
      if (curentSeconds <= 0) {
        duration = const Duration(seconds: 0);
        countDown.cancel();
      } else {
        duration = Duration(seconds: curentSeconds);
      }
    });
  }

  @override
  void initState() {
    countDown = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
    super.initState();
  }

  @override
  void dispose() {
    countDown.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      textStyle: TextStyle(
          fontSize: 28,
          color: isDarkMode_ ? white : primaryBlack,
          fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: isDarkMode_ ? secondaryBlack : lightBlue,
        border: Border.all(color: isDarkMode_ ? secondaryBlack : lightBlue),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: isDarkMode_ ? lightBlue200 : blue),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: isDarkMode_ ? lightBlue200 : blue),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login_img.png",
                  width: 220,
                  height: 220,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.isLogin ? "ورورد" : "ساخت حساب کاربری جدید",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "کد ارسال شده رو وارد کنید.",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: lightGray,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Pinput(
                      autofocus: true,
                      preFilledWidget: Container(
                        width: 10,
                        height: 1,
                        decoration: const BoxDecoration(
                          color: darkGray,
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                      ),
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      enabled: duration.inSeconds != 0,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      length: 5,
                      onCompleted: (pin) {},
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          PersianNumber(
                            number:
                                "${(duration.inSeconds / 60).floor()}:${(duration.inSeconds % 60).floor() < 10 ? 00 : ''}${(duration.inSeconds % 60).floor()}",
                            style: const TextStyle(
                              color: lightGray,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: duration.inSeconds == 0 ? () {} : null,
                            child: Text("ارسال دوباره کد",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: duration.inSeconds == 0
                                        ? blue
                                        : lightGray)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: midBlue,
                    maximumSize: const Size(double.infinity, 52),
                    minimumSize: const Size(double.infinity, 52),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  onPressed: () {
                    if (widget.loginAtBeginning) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MainScreenNavigationBar(),
                        ),
                      );
                    } else {
                      Provider.of<UserProvider>(context, listen: false)
                          .loginStatus = true;
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                            builder: (_) => const MainScreenNavigationBar()),
                        // ModalRoute.withName("MainScreenNavigationBar"),
                      );
                    }
                  },
                  child: const Text(
                    "ثبت",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
