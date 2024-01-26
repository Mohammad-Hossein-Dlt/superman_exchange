import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/persian_number.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isDarkMode_ = false;

  Map<String, List<Map<String, String>>> transactions = {
    "اعلان های امروز": [
      {
        "type": "deposit",
        "date": "12:25 am",
        "description": "واریز موفق بیت کوین مبلغ : 000045BTC",
      },
      {
        "type": "transfer",
        "date": "1:20 am",
        "description": "انتقال موفق بیت کوین مبلغ : 000045BTC",
      },
      {
        "type": "deposit",
        "date": "12:25 am",
        "description": "واریز موفق بیت کوین مبلغ : 000045BTC",
      },
    ],
    "دیروز": [
      {
        "type": "deposit",
        "date": "1:20 am",
        "description": "واریز موفق بیت کوین مبلغ : 000045BTC",
      },
      {
        "type": "transfer",
        "date": "1:20 am",
        "description": "انتقال موفق بیت کوین مبلغ : 000045BTC",
      },
    ],
    "2 آبان 1402": [
      {
        "type": "transfer",
        "date": "1:20 am",
        "description": "انتقال 1 بیت کوین به ولت ******* lksdasdudasx",
      },
    ],
  };
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
              "اعلان ها",
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
            children: [
              ...transactions.keys.toList().map((e) => transactionItem(
                  title: e, transactionsList: transactions[e] ?? [])),
            ],
          ),
        ),
      ),
    );
  }

  Widget transactionItem({
    required String title,
    required List<Map<String, String>> transactionsList,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PersianNumber(
            number: title,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          ...transactionsList.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: e["type"] == "deposit" ? green : blue,
                                shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            (e["type"] == "deposit") ? "واریز" : "انتقال",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      PersianNumber(
                        number: e["date"] ?? "",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(fontSize: 14, color: lightGray),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    e['description'] ?? "",
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 14,
                      color: lightGray,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
