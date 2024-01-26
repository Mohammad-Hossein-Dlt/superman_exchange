import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/regular_coin_box.dart';
import 'package:flutter/material.dart';

class FinancialAssetsScreen extends StatefulWidget {
  const FinancialAssetsScreen({super.key});

  @override
  State<FinancialAssetsScreen> createState() => _FinancialAssetsScreenState();
}

class _FinancialAssetsScreenState extends State<FinancialAssetsScreen> {
  bool isDarkMode_ = false;

  List<Map<String, dynamic>> coins = [
    {
      "name": "BTC",
      "nameFa": "بیت کوین",
      "price": "\$10.123",
      "coinProfitState": CoinProfitState.decrease,
      "profitPercent": "+8,1%",
      "image": "btc.png",
    },
    {
      "name": "ETH",
      "nameFa": "اتریوم",
      "price": "\$500",
      "coinProfitState": CoinProfitState.increase,
      "profitPercent": "+8,1%",
      "image": "eth.png",
    },
    {
      "name": "TETHER",
      "nameFa": "تتر",
      "price": "\$1 USD",
      "coinProfitState": CoinProfitState.increase,
      "profitPercent": "+0,0%",
      "image": "tet.png",
    },
    {
      "name": "BNB",
      "nameFa": "بی ان بی",
      "price": "\$0.36",
      "coinProfitState": CoinProfitState.decrease,
      "profitPercent": "-0,89%",
      "image": "bnb.png",
    },
  ];

  Map<String, dynamic> selectedCrypto = {
    "name": "",
    "nameFa": "",
    "image": "",
    "price": "",
    "profitPercent": "",
  };

  @override
  void initState() {
    selectedCrypto = coins[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const SizedBox(),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "دارایی",
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode_
                            ? Colors.transparent
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: isDarkMode_
                          ? Image.asset("assets/images/card_bg_dark.png")
                          : Image.asset("assets/images/card_bg.png"),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Image.asset(
                        "assets/images/${selectedCrypto['image']}",
                        errorBuilder: (_, __, ___) => const Text("خطا!"),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Column(
                        children: [
                          Text(
                            selectedCrypto["nameFa"] ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            selectedCrypto["name"] ?? "",
                            style: const TextStyle(
                              color: lightGray,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      left: 20,
                      child: Row(
                        children: [
                          Text(
                            selectedCrypto["profitPercent"] ?? "",
                            style: TextStyle(
                              color: selectedCrypto["coinProfitState"] ==
                                      CoinProfitState.increase
                                  ? green
                                  : red,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          selectedCrypto["coinProfitState"] ==
                                  CoinProfitState.increase
                              ? const Icon(Iconsax.arrow_up_3,
                                  size: 16, color: green)
                              : Transform.scale(
                                  scaleY: -1,
                                  child: const Icon(Iconsax.arrow_up_3,
                                      size: 16, color: red),
                                ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 20,
                      child: Text(
                        selectedCrypto["price"] ?? "",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: midBlue,
                          elevation: 0,
                          maximumSize: const Size(double.infinity, 48),
                          minimumSize: const Size(double.infinity, 48),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () {},
                        child: Text(
                          "تبدیل ${selectedCrypto['nameFa']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ...coins.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                        setState(() {
                          selectedCrypto = e;
                        });
                      },
                      child: Card(
                        elevation: 2,
                        shadowColor: Theme.of(context).colorScheme.shadow,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                              color: isDarkMode_ ? secondaryBlack : gray100,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: selectedCrypto["name"] == e["name"]
                                      ? isDarkMode_
                                          ? lightBlue200
                                          : midBlue
                                      : Colors.transparent)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/${e['image']}",
                                errorBuilder: (_, __, ___) =>
                                    const Text("خطا!"),
                              ),
                              Row(
                                children: [
                                  Text(
                                    e["profitPercent"] ?? "",
                                    style: TextStyle(
                                      color: e["coinProfitState"] ==
                                              CoinProfitState.increase
                                          ? green
                                          : red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  e["coinProfitState"] ==
                                          CoinProfitState.increase
                                      ? const Icon(Iconsax.arrow_up_3,
                                          size: 16, color: green)
                                      : Transform.scale(
                                          scaleY: -1,
                                          child: const Icon(Iconsax.arrow_up_3,
                                              size: 16, color: red),
                                        ),
                                ],
                              ),
                              Text(
                                e["price"] ?? "",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: [
                                  Text(
                                    e["nameFa"] ?? "",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    e["name"] ?? "",
                                    style: const TextStyle(
                                      color: lightGray,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "تبدیل ارز",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "شما در این بخش میتونید ارزی که میخواهید رو با کارمزد نسبتا کن به ارزی که میخواهید تبدیل کنید و اون ارز رو برداشت کنید.",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: lightGray,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
