import 'package:flutter/material.dart';

import 'main_colors.dart';

class InputDecorationThemes {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    filled: true,
    fillColor: MainColors.whiteColor,
    hintStyle: TextStyle(
        color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w400),
    labelStyle: TextStyle(
      color: MainColors.textColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    prefixIconColor: MainColors.darkColor,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: MainColors.darkColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: MainColors.errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: MainColors.errorColor),
    ),
  );
}
