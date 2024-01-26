import 'package:flutter/material.dart';

class PersianNumber extends StatelessWidget {
  const PersianNumber({
    super.key,
    required this.number,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.right,
    this.overflow = TextOverflow.ellipsis,
    this.style = const TextStyle(),
  });

  final String number;
  final TextStyle style;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextOverflow overflow;

  String persianNumber(String enNumber) {
    String date = enNumber;
    Map numbers = {
      "0": "۰",
      "1": "۱",
      "2": "۲",
      "3": "۳",
      "4": "۴",
      "5": "۵",
      "6": "۶",
      "7": "۷",
      "8": "۸",
      "9": "۹",
    };

    for (String i in numbers.keys) {
      date = date.replaceAll(RegExp(i), numbers[i]);
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      persianNumber(number),
      textDirection: textDirection,
      style: style,
    );
  }
}
