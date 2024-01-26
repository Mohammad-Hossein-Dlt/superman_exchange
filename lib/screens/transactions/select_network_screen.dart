import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/transactions/factor_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SelectNetworkScreen extends StatefulWidget {
  SelectNetworkScreen({super.key, required this.coin});
  final Map<String, String> coin;
  @override
  State<SelectNetworkScreen> createState() => _SelectNetworkScreenState();
}

class _SelectNetworkScreenState extends State<SelectNetworkScreen> {
  bool isDarkMode_ = false;

  String value = "crypto";

  List<String> networkList = [
    "TRON",
  ];

  Map<String, String> transactionInfo = {
    "amount": "1,540.00",
    "currency": "USDT",
    "wage": "1 USDT کارمزد",
    "wallet": "48394u83uc483jjds884334",
    "selectedNetwork": "",
  };

  @override
  void initState() {
    transactionInfo["selectedNetwork"] = networkList[0];
    super.initState();
  }

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
              "انتخاب شبکه",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "مقداری که انتقال میدید",
                style: TextStyle(fontSize: 14, color: lightGray),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    transactionInfo["amount"] ?? "",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    transactionInfo["currency"] ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Text(
                transactionInfo["wage"] ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  color: lightGray,
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "شبکه",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity - 40,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButton(
                    focusColor: secondaryBlack,
                    hint: const Text(
                      "شبکه انتقال رو انتخاب کنید",
                      style: TextStyle(
                        fontSize: 16,
                        color: lightGray,
                      ),
                    ),
                    value: transactionInfo["selectedNetwork"],
                    elevation: 0,
                    underline: const SizedBox(),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Iconsax.arrow_down_1,
                        size: 20,
                        color: lightGray,
                      ),
                    ),
                    isExpanded: true,
                    dropdownColor: isDarkMode_ ? secondaryBlack : gray100,
                    items: networkList
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  e,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.ltr,
                                  style: const TextStyle(
                                    color: red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        transactionInfo["selectedNetwork"] = value ?? "";
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FactorScreen(
                          coin: widget.coin, transactionInfo: transactionInfo),
                    ),
                  );
                },
                child: const Text(
                  "ادامه",
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
    );
  }
}
