import 'package:superman_exchange/constants/colors.dart';
import 'package:superman_exchange/utils/theme/app_theme.dart';
import 'package:superman_exchange/widgets/persian_number.dart';
import 'package:superman_exchange/widgets/regular_coin_box.dart';
import 'package:flutter/material.dart';

class FullDetailsCoinBox extends StatelessWidget {
  const FullDetailsCoinBox({
    super.key,
    required this.name,
    required this.price,
    required this.priceFa,
    required this.profitPercent,
    required this.coinProfitState,
    required this.image,
    required this.chartImage,
  });

  final String name;
  final String price;
  final String priceFa;
  final String profitPercent;
  final CoinProfitState coinProfitState;
  final String image;
  final String chartImage;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode_ = AppTheme.isDarkMode(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 88,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: isDarkMode_ ? secondaryBlack : lightBlue,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset("assets/images/$image", width: 50, height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    profitPercent,
                    style: TextStyle(
                        fontSize: 14,
                        color: coinProfitState == CoinProfitState.increase
                            ? green
                            : red),
                  ),
                ],
              ),
            ],
          ),
          // Image.asset("assets/images/$chartImage", width: 50, height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              PersianNumber(
                number: priceFa,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 12,
                  color: lightGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
