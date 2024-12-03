import 'package:buildify/app/models/text_models/font_weight.model.dart';
import 'package:flutter/material.dart';

class TextStyleModel {
  String? fontFamily;
  double? fontSize;
  FontStyle? fontStyle;
  Color? color;
  double? letterSpacing;
  double? wordSpacing;
  XTextDecoration? decoration;
  double? decorationThickness;
  XFontWeight? fontWeight;
  Color? backgroundColor;
  double? height;
  TextBaseline? textBaseline;
  TextStyleModel({
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.color,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
    this.backgroundColor,
    this.decorationThickness,
    this.height,
    this.textBaseline,
  });

  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight?.fontWeight,
      fontStyle: fontStyle,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      decoration: decoration?.textDecoration,
      decorationThickness: decorationThickness,
      backgroundColor: backgroundColor,
      height: height,
      textBaseline: textBaseline,
    );
  }
}

enum XTextDecoration {
  none,
  underline,
  overline,
  lineThrough,
}

extension TextDecorationExtension on XTextDecoration {
  TextDecoration get textDecoration {
    switch (this) {
      case XTextDecoration.none:
        return TextDecoration.none;
      case XTextDecoration.underline:
        return TextDecoration.underline;
      case XTextDecoration.overline:
        return TextDecoration.overline;
      case XTextDecoration.lineThrough:
        return TextDecoration.lineThrough;
    }
  }
}
