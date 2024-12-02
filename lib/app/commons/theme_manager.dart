import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  Border defaultBorder({Color? color}) {
    return Border(
      top: BorderSide(
        width: 2,
        color: color ?? MainColors.darkColor,
      ),
      left: BorderSide(
        width: 2,
        color: color ?? MainColors.darkColor,
      ),
      bottom: BorderSide(
        width: 5,
        color: color ?? MainColors.darkColor,
      ),
      right: BorderSide(
        width: 5,
        color: color ?? MainColors.darkColor,
      ),
    );
  }

  BoxShadow defaultShadow({Color? color}) {
    return BoxShadow(
      color: color ?? MainColors.darkColor,
      blurRadius: 0,
      spreadRadius: 1,
      offset: const Offset(2, 3),
      blurStyle: BlurStyle.solid,
    );
  }
}
