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
  @override
  Widget build() {
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

  Map<String, dynamic> toJson() => {
        'icon': icon?.codePoint,
        'size': size,
        'color': color?.value,
        'weight': weight,
        'applyTextScaling': applyTextScaling,
        'grade': grade,
        'fill': fill,
        'textDirection': textDirection?.index,
        'opticalSize': opticalSize,
        'semanticLabel': semanticLabel,
        'shadows': shadows?.map((e) => e.toJson()).toList(),
      };

  static IconModel fromJson(Map<String, dynamic> json) => IconModel(
        icon: IconData(
          json['icon'],
          fontFamily: 'MaterialIcons',
        ),
        size: json['size'],
        weight: json['weight'],
        color: json['color'] != null ? Color(json['color']) : null,
        applyTextScaling: json['applyTextScaling'],
        grade: json['grade'],
        fill: json['fill'],
        textDirection: json['textDirection'] != null
            ? TextDirection.values[json['textDirection']]
            : null,
        opticalSize: json['opticalSize'],
        semanticLabel: json['semanticLabel'],
        shadows: json['shadows'] != null
            ? List<BoxShadowModel>.from(json['shadows']
                .map((shadow) => BoxShadowModel.fromJson(shadow)))
            : null,
      );
}
