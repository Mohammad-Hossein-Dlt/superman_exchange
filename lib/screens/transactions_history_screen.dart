import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/persian_number.dart';
import 'package:flutter/material.dart';

class TransactionsHistoryScreen extends StatefulWidget {
  const TransactionsHistoryScreen({super.key});

  @override
  State<TransactionsHistoryScreen> createState() =>
      _TransactionsHistoryScreenState();
}

class _TransactionsHistoryScreenState extends State<TransactionsHistoryScreen> {
  bool isDarkMode_ = false;

  Map<String, List<Map<String, String>>> transactions = {
    "اخیر": [
      {
        "type": "sale",
        "description": "فروش بیت کوین",
        "amount": "0.01213 BTC",
        "status": "progressing",
        "day": "2 آبان",
        "hour": "12:30",
      },
    ],
    "دیروز": [
      {
        "type": "buy",
        "description": "خرید بیت کوین",
        "amount": "0.01213 BTC",
        "status": "done",
        "day": "1 آبان",
        "hour": "17:20",
      },
    ],
    "30 مهر": [
      {
        "type": "sale",
        "description": "فروش بیت کوین",
        "amount": "0.01213 BTC",
        "status": "canceled",
        "day": "30 مهر",
        "hour": "12:30",
      },
    ],
  };

  String state = "all";

  Widget canceled() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: isDarkMode_ ? lightRed_darkTheme : lightRed,
      ),
      child: Icon(
        Iconsax.close_square5,
        color: isDarkMode_ ? red_darkTheme : red,
      ),
    );
  }

  Widget done() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isDarkMode_ ? lightGreen_darkTheme : lightGreen,
      ),
      child: Icon(
        Icons.check_box_rounded,
        color: isDarkMode_ ? green_darkTheme : green,
      ),
    );
  }

  Widget progressing() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isDarkMode_ ? lightYellow_darkTheme : lightYellow,
      ),
      child: Icon(
        Icons.check_box_rounded,
        color: isDarkMode_ ? yellow_darkTheme : yellow,
      ),
    );
  }

  Widget canceledMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isDarkMode_ ? lightRed_darkTheme : lightRed,
      ),
      child: Text(
        "لغو شده",
        style:
            TextStyle(color: isDarkMode_ ? red_darkTheme : red, fontSize: 12),
      ),
    );
  }

  Widget doneMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isDarkMode_ ? lightGreen_darkTheme : lightGreen,
      ),
      child: Text(
        "انجام شده",
        style: TextStyle(
          color: isDarkMode_ ? green_darkTheme : green,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget progressingMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isDarkMode_ ? lightYellow_darkTheme : lightYellow,
      ),
      child: Text(
        "درحال انجام",
        style: TextStyle(
          color: isDarkMode_ ? yellow_darkTheme : yellow,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: state == "canceled"
                            ? isDarkMode_
                                ? red_darkTheme
                                : red
                            : Colors.transparent,
                        foregroundColor: state == "canceled"
                            ? isDarkMode_
                                ? primaryBlack
                                : white
                            : isDarkMode_
                                ? red_darkTheme
                                : red,
                        side: BorderSide(
                            color: isDarkMode_ ? red_darkTheme : red),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(82, 40),
                        maximumSize: const Size(82, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          state = "canceled";
                        });
                      },
                      child: const Text(
                        "لغو شده",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: state == "progressing"
                            ? isDarkMode_
                                ? yellow_darkTheme
                                : yellow
                            : Colors.transparent,
                        foregroundColor: state == "progressing"
                            ? isDarkMode_
                                ? primaryBlack
                                : Colors.white
                            : isDarkMode_
                                ? yellow_darkTheme
                                : yellow,
                        side: BorderSide(
                            color: isDarkMode_ ? yellow_darkTheme : yellow),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(82, 40),
                        maximumSize: const Size(82, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          state = "progressing";
                        });
                      },
                      child: const Text(
                        "درحال انجام",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: state == "done"
                            ? isDarkMode_
                                ? green_darkTheme
                                : green
                            : Colors.transparent,
                        foregroundColor: state == "done"
                            ? isDarkMode_
                                ? primaryBlack
                                : Colors.white
                            : isDarkMode_
                                ? green_darkTheme
                                : green,
                        side: BorderSide(
                            color: isDarkMode_ ? green_darkTheme : green),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(82, 40),
                        maximumSize: const Size(82, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          state = "done";
                        });
                      },
                      child: const Text(
                        "انجام شده",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            state == "all" ? midBlue : Colors.transparent,
                        foregroundColor: state == "all"
                            ? isDarkMode_
                                ? primaryBlack
                                : Colors.white
                            : midBlue,
                        side: const BorderSide(color: midBlue),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(82, 40),
                        maximumSize: const Size(82, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          state = "all";
                        });
                      },
                      child: const Text(
                        "همه",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ...transactions.keys.toList().map((e) => transactionItem(
                      title: e, transactionsList: transactions[e] ?? [])),
                ],
              ),
            ),
          ],
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
          const Divider(),
          SizedBox(height: 10),
          ...transactionsList.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          PersianNumber(
                            number: e["day"] ?? "",
                            textDirection: TextDirection.rtl,
                            style:
                                const TextStyle(fontSize: 14, color: lightGray),
                          ),
                          PersianNumber(
                            number: e["hour"] ?? "",
                            textDirection: TextDirection.ltr,
                            style:
                                const TextStyle(fontSize: 14, color: lightGray),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      if (e['status'] == "progressing")
                        progressingMessage()
                      else if (e['status'] == "done")
                        doneMessage()
                      else if (e['status'] == "canceled")
                        canceledMessage(),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                e['description'] ?? "",
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: lightGray,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e['amount'] ?? "",
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: lightGray,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (e['status'] == "progressing")
                          progressing()
                        else if (e['status'] == "done")
                          done()
                        else if (e['status'] == "canceled")
                          canceled()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
