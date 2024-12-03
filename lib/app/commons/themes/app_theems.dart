import 'package:buildify/app/commons/themes/tab_bar_themes.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.themes.dart';
import 'button_themes.dart';
import 'input_decoration_themes.dart';
import 'main_colors.dart';
import 'text_themes.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: MainColors.createMaterialColor(MainColors.primaryColor),
    brightness: Brightness.light,
    scaffoldBackgroundColor: MainColors.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: MainColors.primaryColor,
      foregroundColor: MainColors.whiteColor,
      titleTextStyle: TextStyle(
        color: MainColors.whiteColor,
        fontSize: 14,
      ),
    ),
    tabBarTheme: TabBarThemes.tabBarTheme,
    visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MainColors.primaryColor,
      foregroundColor: MainColors.whiteColor,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationThemes.inputDecorationTheme,
    ),
    elevatedButtonTheme: ButtonThemes.elevatedButtonTheme,
    outlinedButtonTheme: ButtonThemes.outlinedButtonTheme,
    iconButtonTheme: ButtonThemes.iconButtonTheme,
    textButtonTheme: ButtonThemes.textButtonTheme,
    canvasColor: MainColors.whiteColor,
    dividerColor: MainColors.dividerColor,
    dividerTheme: DividerThemeData(
      color: MainColors.dividerColor,
      thickness: 1,
    ),
    textTheme: TextThemes.lightTextTheme,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: MainColors.primaryColor,
      onPrimary: MainColors.whiteColor,
      primary: MainColors.primaryColor,
      secondary: MainColors.secondaryColor,
    ),
    fontFamily: 'Poppins',
    inputDecorationTheme: InputDecorationThemes.inputDecorationTheme,
    bottomNavigationBarTheme: BottomNavBarThemes.bottomNavTheme,
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: MainColors.createMaterialColor(MainColors.primaryColor),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: MainColors.primaryDarkColor,
      foregroundColor: MainColors.whiteColor,
      titleTextStyle: TextStyle(color: MainColors.whiteColor, fontSize: 14),
    ),
    canvasColor: MainColors.canvasDarkColor,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: MainColors.primaryDarkColor,
      primary: MainColors.primaryDarkColor,
      secondary: MainColors.secondaryColor,
      onPrimary: MainColors.whiteColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MainColors.primaryDarkColor,
      foregroundColor: MainColors.whiteColor,
    ),
    dividerColor: MainColors.dividerColor,
    scaffoldBackgroundColor: MainColors.scaffoldDarkBackgroundColor,
    textTheme: TextThemes.darkTextTheme,
    elevatedButtonTheme: ButtonThemes.elevatedButtonDarkTheme,
    outlinedButtonTheme: ButtonThemes.outlinedButtonDarkTheme,
    iconButtonTheme: ButtonThemes.iconButtonDarkTheme,
    textButtonTheme: ButtonThemes.textButtonDarkTheme,
    visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
    inputDecorationTheme: InputDecorationThemes.inputDecorationTheme.copyWith(
      fillColor: MainColors.primaryDarkColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade100, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MainColors.whiteColor, width: 1.0),
      ),
      prefixIconColor: MainColors.whiteColor,
      suffixIconColor: MainColors.whiteColor,
      labelStyle: TextStyle(color: MainColors.whiteColor),
    ),
    fontFamily: 'monospace',
    bottomNavigationBarTheme: BottomNavBarThemes.bottomNavDarkTheme,
  );
}
