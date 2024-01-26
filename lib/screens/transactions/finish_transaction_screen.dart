import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FinishTransactionScreen extends StatefulWidget {
  const FinishTransactionScreen({super.key});

  @override
  State<FinishTransactionScreen> createState() =>
      _FinishTransactionScreenState();
}

class _FinishTransactionScreenState extends State<FinishTransactionScreen> {
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
              "فاکتور پرداخت شما",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 374,
            child: Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              shadowColor: Theme.of(context).colorScheme.shadow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: green,
                    size: 95,
                  ),
                  const Column(
                    children: [
                      Text(
                        "تراکنش موفق",
                        style: TextStyle(fontSize: 32, color: darkGray),
                      ),
                      Text(
                        "انتقال شما با موفقیت در کیف پول سوپرمن انجام شد",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: lightGray),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      elevation: 0,
                      maximumSize: const Size(226, 56),
                      minimumSize: const Size(226, 56),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "برگشت",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
