import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class IconModel extends WidgetModel {
  IconData? icon;
  double? size;
  double? weight;
  double? grade;
  Color? color;
  double? fill;
  double? opticalSize;
  bool? applyTextScaling;
  TextDirection? textDirection;
  List<BoxShadowModel>? shadows;
  String? semanticLabel;

  IconModel({
    this.icon,
    this.size,
    this.color,
    this.shadows,
    this.weight,
    this.applyTextScaling,
    this.grade,
    this.fill,
    this.textDirection,
    this.opticalSize,
    this.semanticLabel,
  });
  factory IconModel.fromJson(Map<String, dynamic> json) => IconModel(
        icon: IconData(
          json['icon']['codePoint'],
          fontFamily: json['icon']['fontFamily'],
          fontPackage: json['icon']['fontPackage'],
          fontFamilyFallback: json['icon']['fontPackagePath'],
          matchTextDirection: false,
        ),
        size: json['size'],
        weight: json['weight'],
        color: json['color'] != null ? Color(json['color']) : null,
        applyTextScaling: json['applyTextScaling'],
        grade: json['grade'],
        fill: json['fill'],
        textDirection: json['textDirection'] != null
            ? TextDirection.values.byName(json['textDirection'])
            : null,
        opticalSize: json['opticalSize'],
        semanticLabel: json['semanticLabel'],
        shadows: json['shadows'] != null
            ? List<BoxShadowModel>.from(json['shadows']
                .map((shadow) => BoxShadowModel.fromJson(shadow)))
            : null,
      );

  @override
  Widget build(
    Function(WidgetModel model)? onTap,
  ) {
    // TODO: implement build
    return Icon(
      icon,
      size: size,
      color: color,
      weight: weight,
      applyTextScaling: applyTextScaling,
      grade: grade,
      fill: fill,
      textDirection: textDirection,
      opticalSize: opticalSize,
      semanticLabel: semanticLabel,
      shadows: shadows?.map((e) => e.toBoxShadow()).toList(),
    );
  }

  @override
  Widget buildEditor() {
    return Icon(
      icon,
      size: size,
      color: color,
      weight: weight,
      applyTextScaling: applyTextScaling,
      grade: grade,
      fill: fill,
      textDirection: textDirection,
      opticalSize: opticalSize,
      semanticLabel: semanticLabel,
      shadows: shadows?.map((e) => e.toBoxShadow()).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'icon': {
          'codePoint': icon?.codePoint,
          'fontFamily': icon?.fontFamily,
          'fontPackage': icon?.fontPackage,
          'fontPackagePath': icon?.fontFamilyFallback,
        },
        'size': size,
        'color': color?.value,
        'weight': weight,
        'applyTextScaling': applyTextScaling,
        'grade': grade,
        'fill': fill,
        'textDirection': textDirection?.name,
        'opticalSize': opticalSize,
        'semanticLabel': semanticLabel,
        'shadows': shadows?.map((e) => e.toJson()).toList(),
        'runtimeType': runtimeType.toString(),
      }..removeWhere((key, value) => value == null);
}
