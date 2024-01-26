import 'package:superman_exchange/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: "Shabnam",
  hintColor: lightGray,
  scaffoldBackgroundColor: white,
  primaryColor: blue,
  iconTheme: const IconThemeData(color: Colors.black),
  dividerColor: gray100,
  dividerTheme: const DividerThemeData(color: gray100),
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    surfaceTintColor: Colors.transparent,
  ),
  colorScheme: ColorScheme.light(
    shadow: Colors.white.withOpacity(0.6),
    primary: primaryBlack,
    primaryContainer: Colors.white,
  ),
  // -------------------------------------------------------

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: white,
      backgroundColor: blue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      surfaceTintColor: Colors.transparent,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      surfaceTintColor: Colors.transparent,
    ),
  ),
  cardTheme: CardTheme(
    color: white,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.white.withOpacity(0.6),
  ),

  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: Colors.black,
  )),
);
