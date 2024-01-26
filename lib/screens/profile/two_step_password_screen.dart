import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class TwoStepPasswordScreen extends StatefulWidget {
  const TwoStepPasswordScreen({super.key});

  @override
  State<TwoStepPasswordScreen> createState() => _TwoStepPasswordScreenState();
}

class _TwoStepPasswordScreenState extends State<TwoStepPasswordScreen> {
  bool isDarkMode_ = false;

  List<String> numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
  ];

  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
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
                "رمز دومرحله ایی",
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
                const Text(
                  "رمز دو مرحله ایی خود را وارد کنید توجه کنید این رمز غیر قابل تغییر و غیرقابل دسترسی برای ما میباشد.",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 14,
                    color: lightGray,
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "رمز دو مرحله ایی",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Pinput(
                  controller: password,
                  useNativeKeyboard: false,
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
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  length: 4,
                  onCompleted: (pin) {},
                ),
                const SizedBox(height: 20),
                numPad(),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    elevation: 0,
                    maximumSize: const Size(226, 56),
                    minimumSize: const Size(226, 56),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  onPressed: () {
                    print(password.text);
                  },
                  child: const Text(
                    "تایید رمز",
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

  Widget numPad() {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        ...numbers.map((e) => numberButton(number: e)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkMode_ ? secondaryBlack : lightBlue,
            foregroundColor: isDarkMode_ ? white : primaryBlack,
            elevation: 0,
            maximumSize: const Size(70, 70),
            minimumSize: const Size(70, 70),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
          onPressed: () {
            if (password.text.length > 0) {
              setState(() {
                password.text =
                    password.text.substring(0, password.text.length - 1);
              });
            }
          },
          child: const Icon(
            Icons.backspace_rounded,
            size: 28,
          ),
        )
      ],
    );
  }

  Widget numberButton({required String number}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isDarkMode_ ? secondaryBlack : lightBlue,
        foregroundColor: isDarkMode_ ? white : primaryBlack,
        elevation: 0,
        maximumSize: const Size(70, 70),
        minimumSize: const Size(70, 70),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      onPressed: password.text.length >= 4
          ? null
          : () {
              setState(() {
                password.text += number;
              });
            },
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
