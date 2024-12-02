import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:flutter/material.dart';

enum TypeButton { primary, secondary, tertiary, danger, warning, success, none }

extension TypeButtonExtension on TypeButton {
  Color get color {
    switch (this) {
      case TypeButton.primary:
        return MainColors.primaryColor;
      case TypeButton.secondary:
        return MainColors.secondaryColor;
      case TypeButton.tertiary:
        return MainColors.tertiaryColor;
      case TypeButton.danger:
        return MainColors.errorColor;
      case TypeButton.warning:
        return MainColors.warningColor;
      case TypeButton.success:
        return MainColors.successColor;
      case TypeButton.none:
        return Colors.transparent;
    }
  }
}
