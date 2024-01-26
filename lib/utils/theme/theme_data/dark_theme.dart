import 'package:superman_exchange/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: white,

  fontFamily: "Shabnam",
  hintColor: darkGray,
  scaffoldBackgroundColor: primaryBlack,
  iconTheme: const IconThemeData(color: Colors.black),
  dividerColor: secondaryBlack,
  dividerTheme: const DividerThemeData(color: secondaryBlack),

  appBarTheme: const AppBarTheme(
    backgroundColor: primaryBlack,
    surfaceTintColor: Colors.transparent,
  ),

  colorScheme: const ColorScheme.dark(
    shadow: primaryBlack,
    primary: white,
    primaryContainer: secondaryBlack,
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
  cardTheme: const CardTheme(
    color: secondaryBlack,
    surfaceTintColor: Colors.transparent,
    shadowColor: primaryBlack,
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: white,
  )),
);
