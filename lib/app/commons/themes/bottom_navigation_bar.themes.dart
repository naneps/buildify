import 'package:flutter/material.dart';

import 'main_colors.dart';

class BottomNavBarThemes {
  static BottomNavigationBarThemeData bottomNavTheme =
      BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: MainColors.whiteColor,
    selectedItemColor: MainColors.primaryColor,
    unselectedItemColor: Colors.grey.shade300,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(color: MainColors.primaryColor, size: 28),
    selectedLabelStyle: TextStyle(
      color: MainColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey.shade300,
      size: 25,
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.grey.shade300,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );

  static BottomNavigationBarThemeData bottomNavDarkTheme =
      bottomNavTheme.copyWith(
    backgroundColor: MainColors.primaryDarkColor,
    selectedItemColor: MainColors.primaryColor,
    unselectedItemColor: Colors.grey.shade400,
    selectedIconTheme: IconThemeData(color: MainColors.primaryColor, size: 28),
    selectedLabelStyle: TextStyle(
      color: MainColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    unselectedIconTheme: const IconThemeData(
      size: 25,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}
