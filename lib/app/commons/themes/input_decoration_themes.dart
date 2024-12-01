import 'package:flutter/material.dart';

import 'main_colors.dart';

class InputDecorationThemes {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: MainColors.whiteColor,
    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
    labelStyle: TextStyle(
      color: MainColors.textColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    prefixIconColor: MainColors.darkColor,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: MainColors.darkColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade100),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: MainColors.errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: MainColors.errorColor),
    ),
  );
}
