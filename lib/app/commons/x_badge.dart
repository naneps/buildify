import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XBadge extends StatelessWidget {
  XBadgeType? type;
  Color? color;
  String? text;
  TextStyle? textStyle;
  XBadge({
    super.key,
    this.type,
    this.color,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    assert(
        ((type == null) != (color == null)) && (type != null || color != null),
        'You must provide either a type or a color, but not both.');
    return Container(
      constraints: BoxConstraints(minWidth: Get.width * 0.2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: (color ?? type!.color),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        text ?? '',
        textAlign: TextAlign.center,
        style:
            textStyle ?? Get.textTheme.bodySmall!.copyWith(color: Colors.white),
      ),
    );
  }
}

enum XBadgeType { primary, success, error, warning }

extension XBadgeTypeExtension on XBadgeType {
  Color get color {
    switch (this) {
      case XBadgeType.primary:
        return MainColors.primaryColor;

      case XBadgeType.success:
        return MainColors.successColor;

      case XBadgeType.error:
        return MainColors.errorColor;

      case XBadgeType.warning:
        return MainColors.warningColor;

      default:
        return Colors.transparent;
    }
  }
}
