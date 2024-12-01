import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:buildify/app/models/builder_models/gradient.model.dart';
import 'package:flutter/material.dart';

class BoxDecorationModel {
  Color? color;
  List<BoxShadowModel>? boxShadow;
  GradientModel? gradient;
  BlendMode? backgroundBlendMode;
  BorderRadiusModel? borderRadius;
  BorderModel? border;
  BoxShape boxShape;

  BoxDecorationModel({
    this.color,
    this.backgroundBlendMode,
    this.boxShadow,
    this.gradient,
    this.border,
    this.borderRadius,
    this.boxShape = BoxShape.rectangle,
  });

  BoxDecoration toBoxDecoration() {
    return BoxDecoration(
      color: color,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: boxShadow?.map((e) => e.toBoxShadow()).toList(),
      gradient: gradient?.toGradient().value,
      borderRadius: borderRadius?.toBorderRadius(),
      shape: boxShape,
      border: border?.toBorder(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color?.value,
      'backgroundBlandMode': backgroundBlendMode?.index,
      'boxShadow': boxShadow?.map((shadow) => shadow.toJson()),
      'gradient': gradient?.toJson(),
      'borderRadius': borderRadius?.toJson()
    };
  }
}
