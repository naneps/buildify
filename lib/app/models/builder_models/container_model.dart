import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'box_decoration_model.dart';

class ContainerModel {
  RxDouble? width;
  RxDouble? height;
  Color? color;
  BoxDecorationModel? decoration;
  AlignmentType? alignment;
  ContainerModel({
    this.width,
    this.height,
    this.color,
    this.decoration,
    this.alignment,
  });

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
  Widget build() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width!.value,
      height: height!.value,
      alignment: alignment?.alignment,
      color: decoration != null ? null : color,
      decoration: decoration?.toBoxDecoration(),
    );
  }

  String toCode() {
    return '```dart\n${build().toString()}\n```';
  }

  ContainerModel fromJson(Map<String, dynamic> json) {
    return ContainerModel(
      width: RxDouble(json['width']),
      height: RxDouble(json['height']),
      color: json['color'] != null ? Color(json['color']) : null,
      // decoration: json['decoration'] != null
      //     ? BoxDecorationModel.fromJson(json['decoration'])
      //     : null,
      alignment: json['alignment'] != null
          ? AlignmentType.values[json['alignment']]
          : null,
    );
  }
}
