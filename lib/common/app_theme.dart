// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.goldColor),
    scaffoldBackgroundColor: AppColor.blackColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.blackColor,
      iconTheme: IconThemeData(color: AppColor.goldColor),
      titleTextStyle: TextStyle(
        color: AppColor.goldColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.goldColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColor.blackColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
