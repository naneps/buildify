import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:buildify/app/models/builder_models/gradient.model.dart';
import 'package:flutter/material.dart';

class BoxDecorationModel {
  Color? color;
  List<BoxShadowModel>? boxShadow;
  GradientModel? gradient;
  BlendMode? backgroundBlendMode;
  BorderModel? border;
  BoxDecorationModel({
    this.color,
    this.backgroundBlendMode,
    this.boxShadow,
    this.gradient,
    this.border,
  });

  BoxDecoration toBoxDecoration() {
    return BoxDecoration(
      color: color,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: boxShadow?.map((e) => e.toBoxShadow()).toList(),
      gradient: gradient?.toGradient().value,
      borderRadius: BorderRadius.circular(20),
      border: border?.toBorder,
    );
  }
}
