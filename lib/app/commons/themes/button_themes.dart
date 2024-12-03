import 'package:flutter/material.dart';

import 'main_colors.dart';

class ButtonThemes {
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MainColors.primaryColor,
      foregroundColor: MainColors.whiteColor,
      disabledBackgroundColor: Colors.grey.shade100,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      elevation: 0,
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(30, 20),
      fixedSize: const Size(double.infinity, 40),
    ),
  );
  static ElevatedButtonThemeData elevatedButtonDarkTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MainColors.primaryDarkColor,
      foregroundColor: MainColors.whiteColor,
      disabledBackgroundColor: MainColors.darkColor,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      elevation: 0,
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(30, 20),
      fixedSize: const Size(double.infinity, 40),
    ),
  );
  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: MainColors.whiteColor,
      foregroundColor: MainColors.primaryColor,
      disabledBackgroundColor: Colors.grey.shade100,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      side: BorderSide(color: MainColors.primaryColor),
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(30, 20),
      fixedSize: const Size(double.infinity, 40),
    ),
  );
  static OutlinedButtonThemeData outlinedButtonDarkTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: MainColors.whiteColor,
      disabledBackgroundColor: MainColors.darkColor,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      side: BorderSide(color: MainColors.whiteColor),
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(30, 20),
      fixedSize: const Size(double.infinity, 40),
    ),
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: MainColors.primaryColor,
      disabledBackgroundColor: Colors.grey.shade100,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(30, 20),
      fixedSize: const Size(double.infinity, 40),
    ),
  );
  static TextButtonThemeData textButtonDarkTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: MainColors.whiteColor,
      disabledBackgroundColor: MainColors.darkColor,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(30, 20),
      fixedSize: const Size(double.infinity, 40),
    ),
  );

  static IconButtonThemeData iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      backgroundColor: MainColors.primaryColor,
      foregroundColor: MainColors.whiteColor,
      disabledBackgroundColor: Colors.grey.shade100,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      padding: const EdgeInsets.all(5),
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(10, 10),
      fixedSize: const Size(40, 40),
    ),
  );

  static IconButtonThemeData iconButtonDarkTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      backgroundColor: MainColors.primaryDarkColor,
      foregroundColor: MainColors.primaryColor,
      disabledBackgroundColor: MainColors.darkColor,
      disabledForegroundColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(5),
      elevation: 0,
      animationDuration: const Duration(milliseconds: 500),
      minimumSize: const Size(10, 10),
      fixedSize: const Size(40, 40),
    ),
  );
}
