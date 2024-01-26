import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/persian_number.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool isDarkMode_ = false;

  List<Map<String, String>> cardsList = [
    {
      "name": "انتخاب درگاه بانکی",
      "description": "زرینپال ، پی پل ، شپا",
      "image": "assets/images/zarinpal.png",
    },
    {
      "name": "بانک تجارت",
      "description": "**** 7492",
      "image": "assets/images/visa.png",
    },
  ];
  String selectedCardName = "";
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          elevation: 0,
          forceElevated: true,
          pinned: true,
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
                "کارت بانکی",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ...cardsList.map(
                  (e) => cardItem(
                      name: e["name"] ?? "",
                      description: e["description"] ?? "",
                      image: e["image"] ?? ""),
                ),
                const SizedBox(height: 20),
                const PersianNumber(
                  number: "1,000,000",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "میلیون تومان",
                  style: TextStyle(
                    color: lightGray,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(6),
                    backgroundColor: isDarkMode_ ? tertiaryBlack : lightBlue,
                    elevation: 0,
                    maximumSize: const Size(90, 40),
                    minimumSize: const Size(90, 40),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: blue,
                        ),
                        child: const Icon(
                          Iconsax.arrow_swap_horizontal,
                          color: white,
                          size: 16,
                        ),
                      ),
                      const Text(
                        "BTC",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: midBlue,
                    elevation: 0,
                    maximumSize: const Size(double.infinity, 56),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "خرید",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget cardItem({
    required String name,
    required String description,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          setState(() {
            selectedCardName = name;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          width: double.infinity,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: isDarkMode_ ? secondaryBlack : gray200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedCardName == name
                  ? Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blue, width: 2),
                      ),
                      child: Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: blue,
                          ),
                        ),
                      ),
                    )
                  : Icon(
                      Iconsax.arrow_left_2,
                      color: isDarkMode_ ? darkGray : lightGray,
                      size: 20,
                    ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: lightGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Image.asset(image, width: 48, height: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
