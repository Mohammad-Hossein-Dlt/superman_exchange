import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CryptoSearchScreen extends StatefulWidget {
  CryptoSearchScreen({
    super.key,
  });

  @override
  State<CryptoSearchScreen> createState() => _CryptoSearchScreenState();
}

class _CryptoSearchScreenState extends State<CryptoSearchScreen> {
  bool isDarkMode_ = false;

  List<Map<String, String>> cryptos = [
    {
      "name": "BTC",
      "image": "assets/images/btc.png",
    },
    {
      "name": "TETHER",
      "image": "assets/images/tet.png",
    },
    {
      "name": "ETH",
      "image": "assets/images/eth.png",
    },
    {
      "name": "Chain",
      "image": "assets/images/cha.png",
    },
    {
      "name": "BNB",
      "image": "assets/images/bnb.png",
    },
    {
      "name": "ADA",
      "image": "assets/images/ada.png",
    },
    {
      "name": "SOL",
      "image": "assets/images/sol.png",
    },
  ];
  TextEditingController search = TextEditingController();
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
              "انتخاب ارز برای انتقال",
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                  const Text(
                    "انتخاب",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode_ ? secondaryBlack : lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: TextField(
                  controller: search,
                  maxLines: 1,
                  minLines: 1,
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide:
                            BorderSide(color: lightBlue200, width: 1.4)),
                    enabledBorder: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    hintText: "جست و جو",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: lightGray,
                    ),
                    prefixIcon: Icon(
                      Iconsax.search_normal_1,
                      color: lightGray,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: search,
                builder: (_, Value, __) => Value.text.isEmpty
                    ? Column(
                        children: [
                          ...cryptos.map(
                            (e) => Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop<Map<String, String>>(
                                        context, e);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(e["image"] ?? ""),
                                        const SizedBox(width: 10),
                                        Text(
                                          e["name"] ?? "",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ...cryptos
                              .where((element) =>
                                  element["name"]
                                      ?.toLowerCase()
                                      .contains(search.text.toLowerCase()) ??
                                  false)
                              .map(
                                (e) => Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop<Map<String, String>>(
                                            context, e);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          children: [
                                            Image.asset(e["image"] ?? ""),
                                            const SizedBox(width: 10),
                                            Text(
                                              e["name"] ?? "",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
