import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/constants/iconsax_icons.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum CoinProfitState { increase, decrease }

class RegularCoinBox extends StatelessWidget {
  const RegularCoinBox({
    super.key,
    required this.name,
    required this.price,
    required this.profitPercent,
    required this.coinProfitState,
    required this.image,
    required this.selected,
  });

  final String name;
  final String price;
  final String profitPercent;
  final CoinProfitState coinProfitState;
  final String image;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode_ = AppTheme.isDarkMode(context);

    return Container(
      width: 182,
      height: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: selected ? midBlue : Colors.transparent),
        color: isDarkMode_ ? secondaryBlack : lightBlue,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/$image", width: 50, height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Text(
                    "میزان سود",
                    style: TextStyle(
                      fontSize: 12,
                      color: lightGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(fontSize: 22),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profitPercent,
                    style: TextStyle(
                        fontSize: 14,
                        color: coinProfitState == CoinProfitState.increase
                            ? green
                            : red),
                  ),
                  coinProfitState == CoinProfitState.increase
                      ? const Icon(Iconsax.arrow_up_3, size: 16, color: green)
                      : Transform.scale(
                          scaleY: -1,
                          child: const Icon(Iconsax.arrow_up_3,
                              size: 16, color: red),
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
