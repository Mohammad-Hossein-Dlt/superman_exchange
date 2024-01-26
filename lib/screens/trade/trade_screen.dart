import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/trade/finish_trade_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/chart.dart';
import 'package:superman_exchange/widgets/regular_coin_box.dart';
import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
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

  String selectedCoinsGroup = "bests";

  String selectedChartTime = "now";
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
              "ترید سوپرمن",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: selectedCoinsGroup == "famous"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : lightGray,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCoinsGroup = "famous";
                        });
                      },
                      child: Text(
                        "معروف",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: selectedCoinsGroup == "famous"
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: selectedCoinsGroup == "bestProfit"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : lightGray,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCoinsGroup = "bestProfit";
                        });
                      },
                      child: Text(
                        "بهترین سود",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: selectedCoinsGroup == "bestProfit"
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: selectedCoinsGroup == "lowestProfit"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : lightGray,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCoinsGroup = "lowestProfit";
                        });
                      },
                      child: Text(
                        "کم ترین سود",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: selectedCoinsGroup == "lowestProfit"
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: selectedCoinsGroup == "bests"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : lightGray,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCoinsGroup = "bests";
                        });
                      },
                      child: Text(
                        "بهترینها",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: selectedCoinsGroup == "bests"
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    ...coins.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          onTap: () {
                            setState(() {
                              selectedCrypto = e;
                            });
                          },
                          child: RegularCoinBox(
                            name: e["name"],
                            price: e["price"],
                            coinProfitState: e["coinProfitState"],
                            profitPercent: e["profitPercent"],
                            image: e["image"],
                            selected: e["name"] == selectedCrypto["name"],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: selectedCrypto["name"].isNotEmpty,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(colors: [
                      Color(0xff9747FF),
                      Color(0xff177DFF),
                    ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCrypto["price"] ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode_ ? primaryBlack : white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: isDarkMode_ ? primaryBlack : gray100,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  selectedCrypto["nameFa"] ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  "assets/images/${selectedCrypto['image']}",
                                  errorBuilder: (_, __, ___) =>
                                      const Text("خطا!"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: isDarkMode_ ? primaryBlack : gray100,
                            ),
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedChartTime == "1year"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : isDarkMode_
                                ? Colors.white.withOpacity(0.2)
                                : gray100,
                        foregroundColor: selectedChartTime == "1year"
                            ? isDarkMode_
                                ? primaryBlack
                                : white
                            : isDarkMode_
                                ? white
                                : primaryBlack,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedChartTime = "1year";
                        });
                      },
                      child: const Text(
                        "1 سال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedChartTime == "6months"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : isDarkMode_
                                ? Colors.white.withOpacity(0.2)
                                : gray100,
                        foregroundColor: selectedChartTime == "6months"
                            ? isDarkMode_
                                ? primaryBlack
                                : white
                            : isDarkMode_
                                ? white
                                : primaryBlack,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedChartTime = "6months";
                        });
                      },
                      child: const Text(
                        "6 ماه",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedChartTime == "1months"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : isDarkMode_
                                ? Colors.white.withOpacity(0.2)
                                : gray100,
                        foregroundColor: selectedChartTime == "1months"
                            ? isDarkMode_
                                ? primaryBlack
                                : white
                            : isDarkMode_
                                ? white
                                : primaryBlack,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedChartTime = "1months";
                        });
                      },
                      child: const Text(
                        "1 ماه",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedChartTime == "1weak"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : isDarkMode_
                                ? Colors.white.withOpacity(0.2)
                                : gray100,
                        foregroundColor: selectedChartTime == "1weak"
                            ? isDarkMode_
                                ? primaryBlack
                                : white
                            : isDarkMode_
                                ? white
                                : primaryBlack,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedChartTime = "1weak";
                        });
                      },
                      child: const Text(
                        "1 هفته",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedChartTime == "now"
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : isDarkMode_
                                ? Colors.white.withOpacity(0.2)
                                : gray100,
                        foregroundColor: selectedChartTime == "now"
                            ? isDarkMode_
                                ? primaryBlack
                                : white
                            : isDarkMode_
                                ? white
                                : primaryBlack,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedChartTime = "now";
                        });
                      },
                      child: const Text(
                        "الان",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const LineChartSample2(
                amounts: [
                  [0, 2],
                  [2.6, 1],
                  [4.9, 2.5],
                  [6.8, 0.4],
                  [8, 2],
                  [9.5, 1.5],
                  [11, 4],
                ],
                prices: ["0", "200", "400", "600", "800"],
                dates: ["11:17", "11:01", "10:44", "10:28"],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlue900,
                      elevation: 0,
                      maximumSize: const Size(164, 48),
                      minimumSize: const Size(164, 48),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FinishTradeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "فروش",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: midBlue,
                      elevation: 0,
                      maximumSize: const Size(164, 48),
                      minimumSize: const Size(164, 48),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FinishTradeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "خرید",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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
}
