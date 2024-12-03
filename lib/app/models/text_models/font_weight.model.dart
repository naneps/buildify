import 'package:flutter/material.dart';

enum XFontWeight { w100, w200, w300, w400, w500, w600, w700, w800, w900 }

extension FontWeightExtension on XFontWeight {
  FontWeight get fontWeight => FontWeight.values[index];
}
