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

  factory TextStyleModel.fromJson(Map<String, dynamic> json) {
    return TextStyleModel(
      fontFamily: json['fontFamily'],
      fontSize: json['fontSize'],
      fontWeight: XFontWeight.values.byName(json['fontWeight']),
      fontStyle: json['fontStyle'] != null
          ? FontStyle.values.byName(json['fontStyle'])
          : null,
      color: Color(json['color']),
      letterSpacing: json['letterSpacing'],
      wordSpacing: json['wordSpacing'],
      decoration: json['decoration'] != null
          ? XTextDecoration.values.byName(json['decoration'])
          : null,
      decorationThickness: json['decorationThickness'],
      backgroundColor: json['backgroundColor'] != null
          ? Color(json['backgroundColor'])
          : null,
      height: json['height'],
      textBaseline: json['textBaseline'] != null
          ? TextBaseline.values.byName(json['textBaseline'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'fontWeight': fontWeight?.name,
      'fontStyle': fontStyle?.name,
      'color': color?.value,
      'letterSpacing': letterSpacing,
      'wordSpacing': wordSpacing,
      'decoration': decoration?.name,
      'decorationThickness': decorationThickness,
      'backgroundColor': backgroundColor?.value,
      'height': height,
      'textBaseline': textBaseline?.name,
    }..removeWhere((key, value) => value == null);
  }

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
