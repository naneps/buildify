import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:flutter/material.dart';

class TooltipThemes {
  static final lightTooltip = TooltipThemeData(
    decoration: BoxDecoration(
      color: MainColors.canvasColor,
      border: Border.all(color: Colors.grey.shade300, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    textStyle: TextStyle(
      color: MainColors.darkColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );

  static final darkTooltip = TooltipThemeData(
    decoration: BoxDecoration(
      color: MainColors.canvasDarkColor,
      border: Border.all(color: Colors.grey.shade300, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    textStyle: TextStyle(
      color: MainColors.whiteColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
}
