import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/screens/transactions/crypto_search_screen.dart';
import 'package:superman_exchange/screens/transactions/select_network_screen.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SetAmountScreen extends StatefulWidget {
  const SetAmountScreen({super.key});

  @override
  State<SetAmountScreen> createState() => _SetAmountScreenState();
}

class _SetAmountScreenState extends State<SetAmountScreen> {
  bool isDarkMode_ = false;

  String value = "crypto";

  Map<String, String> selectedCrypto = {
    "name": "",
    "image": "",
  };
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
              "انتقال",
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: value == "crypto"
                          ? isDarkMode_
                              ? white
                              : primaryBlack
                          : lightGray,
                    ),
                    onPressed: () {
                      setState(() {
                        value = "crypto";
                      });
                    },
                    child: Column(
                      children: [
                        const Text(
                          "کریپتو",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color:
                                value == "crypto" ? blue : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: value == "nft"
                          ? isDarkMode_
                              ? white
                              : primaryBlack
                          : lightGray,
                    ),
                    onPressed: () {
                      setState(() {
                        value = "nft";
                      });
                    },
                    child: Column(
                      children: [
                        const Text(
                          "NFT",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: value == "nft" ? blue : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "ارز مورد نظر انتخاب کنید",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: () async {
                  Navigator.push<Map<String, String>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CryptoSearchScreen(),
                    ),
                  ).then((value) {
                    setState(() {
                      if (value != null) {
                        selectedCrypto = value;
                      }
                    });
                  });

                  // ScaffoldMessenger.of(context)
                  //   ..removeCurrentSnackBar()
                  //   ..showSnackBar(SnackBar(content: Text(r.toString())));
                },
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Iconsax.arrow_down_1,
                          size: 20,
                          color: lightGray,
                        ),
                        selectedCrypto["name"]!.isEmpty
                            ? const Text(
                                "انتخاب",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: lightGray,
                                ),
                              )
                            : Row(
                                children: [
                                  Image.asset(selectedCrypto["image"] ?? ""),
                                  const SizedBox(width: 10),
                                  Text(
                                    selectedCrypto["name"] ?? "",
                                    style: const TextStyle(
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
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                "مقدار رو بنویسید",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Text(
                      "ريال",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDarkMode_ ? secondaryBlack : lightBlue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: const TextField(
                        maxLines: 1,
                        minLines: 1,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: lightBlue200, width: 1.4)),
                          enabledBorder: InputBorder.none,
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          hintText: "مقدار",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: lightGray,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
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
                        builder: (context) =>
                            SelectNetworkScreen(coin: selectedCrypto),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
