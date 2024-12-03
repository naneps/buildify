import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:flutter/material.dart';

class TabBarThemes {
  static TabBarTheme tabBarTheme = TabBarTheme(
    unselectedLabelColor: MainColors.darkColor,
    indicatorColor: MainColors.primaryColor,
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: const EdgeInsets.all(0),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: MainColors.primaryColor,
        width: 2.0,
      ),
    ),
    unselectedLabelStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
    ),
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
      color: MainColors.primaryColor,
    ),
    labelColor: MainColors.primaryColor,
  );
}
