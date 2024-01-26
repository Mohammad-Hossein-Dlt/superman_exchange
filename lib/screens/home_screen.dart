import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/notification_screen.dart';
import 'package:superman_exchange/screens/transactions_history_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/banner_list.dart';
import 'package:superman_exchange/widgets/full_details_coin_box.dart';
import 'package:superman_exchange/widgets/regular_coin_box.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode_ = false;

  List<Map<String, dynamic>> mostProfitable = [
    {
      "name": "BTC",
      "price": "\$10.123",
      "coinProfitState": CoinProfitState.increase,
      "profitPercent": "+8,1%",
      "image": "btc_image.png",
    },
    {
      "name": "ETH",
      "price": "\$500",
      "coinProfitState": CoinProfitState.increase,
      "profitPercent": "+8,1%",
      "image": "eth_image.png",
    }
  ];

  List<Map<String, dynamic>> coins = [
    {
      "name": "BTC",
      "price": "\$10.123",
      "priceFa": "1 میلیاد 200 تومان",
      "coinProfitState": CoinProfitState.decrease,
      "profitPercent": "-1.32%",
      "image": "btc_image.png",
      "chartImage": "chart_small_1.png",
    },
    {
      "name": "ETH",
      "price": "\$500",
      "priceFa": "1 میلیاد 200 تومان",
      "coinProfitState": CoinProfitState.increase,
      "profitPercent": "-1.32%",
      "image": "eth_image.png",
      "chartImage": "chart_small_2.png",
    }
  ];
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text("پر سود ترین ها"),
                    ),
                  ),
                  ...mostProfitable.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RegularCoinBox(
                        name: e["name"],
                        price: e["price"],
                        coinProfitState: e["coinProfitState"],
                        profitPercent: e["profitPercent"],
                        image: e["image"],
                        selected: false,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: actions(),
            ),
            const SizedBox(height: 20),
            const BannerList(
              banners: [
                "banner_1.jpg",
                "banner_2.jpg",
              ],
            ),
            const SizedBox(height: 20),
            ...coins.map(
              (e) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: FullDetailsCoinBox(
                  name: e["name"],
                  price: e["price"],
                  priceFa: e["priceFa"],
                  coinProfitState: e["coinProfitState"],
                  profitPercent: e["profitPercent"],
                  image: e["image"],
                  chartImage: e["chartImage"],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            backgroundColor: isDarkMode_ ? secondaryBlack : lightBlue,
            minimumSize: const Size(70, 70),
            maximumSize: const Size(70, 70),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.flash_1,
                size: 30,
                color: isDarkMode_ ? white : primaryBlack,
              ),
              const Text(
                "ارز رایگان",
                style: TextStyle(fontSize: 12, color: lightGray),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            backgroundColor: isDarkMode_ ? secondaryBlack : lightBlue,
            minimumSize: const Size(70, 70),
            maximumSize: const Size(70, 70),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.card_add,
                size: 30,
                color: isDarkMode_ ? white : primaryBlack,
              ),
              const Text(
                "کارت",
                style: TextStyle(fontSize: 12, color: lightGray),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            backgroundColor: isDarkMode_ ? secondaryBlack : lightBlue,
            minimumSize: const Size(70, 70),
            maximumSize: const Size(70, 70),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.notification_bing,
                size: 30,
                color: isDarkMode_ ? white : primaryBlack,
              ),
              const Text(
                "اعلان ها",
                style: TextStyle(fontSize: 12, color: lightGray),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            backgroundColor: isDarkMode_ ? secondaryBlack : lightBlue,
            minimumSize: const Size(70, 70),
            maximumSize: const Size(70, 70),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TransactionsHistoryScreen(),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.clock,
                size: 30,
                color: isDarkMode_ ? white : primaryBlack,
              ),
              const Text(
                "سوابق",
                style: TextStyle(fontSize: 12, color: lightGray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
