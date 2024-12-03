import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'box_decoration_model.dart';

class ContainerModel extends WidgetModel {
  RxDouble? width;
  RxDouble? height;
  Color? color;

  BoxDecorationModel? decoration;
  Clip? clipBehavior;
  AlignmentType? alignment;
  WidgetModel? child;
  EdgeInsetModel? padding;
  EdgeInsetModel? margin;
  ContainerModel({
    this.width,
    this.height,
    this.color,
    this.decoration,
    this.alignment,
    this.child,
    this.clipBehavior,
    this.margin,
    this.padding,
  });

  @override
  Widget build() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      clipBehavior: clipBehavior ?? Clip.none,
      width: width?.value,
      height: height?.value,
      padding: padding?.toEdgeInsets(),
      alignment: alignment?.alignment,
      color: decoration != null ? null : color,
      margin: margin?.toEdgeInsets(),
      decoration: decoration?.toBoxDecoration(),
      child: child?.build(),
    );
  }

  ContainerModel copyWith({
    double? width,
    double? height,
    Color? color,
    AlignmentType? alignment,
    BoxDecorationModel? decoration,
  }) {
    return ContainerModel(
      width: RxDouble(width ?? this.width!.value),
      height: RxDouble(height ?? this.height!.value),
      decoration: decoration ?? this.decoration,
      alignment: alignment ?? this.alignment,
      color: color ?? this.color,
    );
  }
}

extension ContainerModelExtension on ContainerModel {
  ContainerModel fromJson(Map<String, dynamic> json) {
    return ContainerModel(
      width: RxDouble(json['width']),
      height: RxDouble(json['height']),
      color: json['color'] != null ? Color(json['color']) : null,
      alignment: json['alignment'] != null
          ? AlignmentType.values[json['alignment']]
          : null,
    );
  }

  String toCode() {
    return '```dart\n${build().toString()}\n```';
  }
}
