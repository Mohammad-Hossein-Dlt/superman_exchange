import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/transactions/finish_transaction_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FactorScreen extends StatefulWidget {
  const FactorScreen({
    super.key,
    required this.coin,
    required this.transactionInfo,
  });
  final Map<String, String> coin;
  final Map<String, String> transactionInfo;
  @override
  State<FactorScreen> createState() => _FactorScreenState();
}

class _FactorScreenState extends State<FactorScreen> {
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
              "فاکتور نهایی",
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: isDarkMode_ ? secondaryBlack : lightBlue,
                ),
                child: Column(
                  children: [
                    const Text(
                      "مقدار واریزی",
                      style: TextStyle(fontSize: 14, color: lightGray),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.transactionInfo["amount"] ?? "",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.transactionInfo["currency"] ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.transactionInfo["wage"] ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        color: lightGray,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDarkMode_ ? lightGray : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Image.asset("assets/images/barcode_dark.png"),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "آدرس کیف پول",
                  style: TextStyle(fontSize: 14, color: lightGray),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.transactionInfo["wallet"] ?? "",
                      // "ekjerkv ke vker ve vkev ekv ekv ekv kf vkrnb wefewf emf em e de   m",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.content_copy_rounded,
                      color: midBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: isDarkMode_ ? secondaryBlack : lightBlue,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          widget.coin["image"] ?? "",
                          errorBuilder: (_, __, ___) => const Text(
                            "تصویر وجود ندارد!",
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.coin["name"] ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "کوین",
                    style: TextStyle(fontSize: 14, color: lightGray),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.transactionInfo["selectedNetwork"] ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Text(
                    "شبکه",
                    style: TextStyle(fontSize: 14, color: lightGray),
                  ),
                ],
              ),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FinishTransactionScreen(),
                    ),
                  );
                },
                child: const Text(
                  "تایید",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
