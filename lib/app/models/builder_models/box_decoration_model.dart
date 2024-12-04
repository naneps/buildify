import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:buildify/app/models/builder_models/decoration_image.model.dart';
import 'package:buildify/app/models/builder_models/gradient.model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BoxDecorationModel {
  Color? color;
  List<BoxShadowModel>? boxShadow;
  GradientModel? gradient;
  BlendMode? backgroundBlendMode;
  BorderRadiusModel? borderRadius;
  BorderModel? border;
  BoxShape boxShape;
  DecorationImageModel? image;
  BoxDecorationModel(
      {this.color,
      this.backgroundBlendMode,
      this.boxShadow,
      this.gradient,
      this.border,
      this.borderRadius,
      this.boxShape = BoxShape.rectangle,
      this.image});

  factory BoxDecorationModel.fromJson(Map<String, dynamic> json) {
    return BoxDecorationModel(
      color: json['color'] != null ? Color(json['color']) : null,
      backgroundBlendMode: json['backgroundBlendMode'] != null
          ? BlendMode.values[json['backgroundBlendMode']]
          : null,
      boxShadow: json['boxShadow'] != null
          ? List<BoxShadowModel>.from(json['boxShadow']
              .map((shadow) => BoxShadowModel.fromJson(shadow)))
          : null,
      gradient: json['gradient'] != null
          ? GradientModel.fromJson(json['gradient'])
          : null,
      borderRadius: json['borderRadius'] != null
          ? BorderRadiusModel.fromJson(json['borderRadius'])
          : null,
      border:
          json['border'] != null ? BorderModel.fromJson(json['border']) : null,
      boxShape: json['boxShape'] != null
          ? BoxShape.values[json['boxShape']]
          : BoxShape.rectangle,
      image: json['image'] != null
          ? DecorationImageModel.fromJson(json['image'])
          : null,
    );
  }

  BoxDecoration toBoxDecoration() {
    return BoxDecoration(
      color: color,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: boxShadow?.map((e) => e.toBoxShadow()).toList(),
      gradient: gradient?.toGradient().value,
      borderRadius: borderRadius?.toBorderRadius(),
      shape: boxShape,
      image: image?.toDecorationImage(),
      border: border?.toBorder(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color?.value,
      'backgroundBlandMode': backgroundBlendMode?.name,
      'boxShadow': boxShadow?.map((shadow) => shadow.toJson()),
      'gradient': gradient?.toJson(),
      'borderRadius': borderRadius?.toJson(),
      'border': border?.toJson(),
      'boxShape': boxShape.name,

      // 'boxShape': boxShape.index,
      // 'border': border?.toJson(),q
    };
  }
}

extension BoxShapeExtension on BoxShape {
  IconData get icon {
    switch (this) {
      case BoxShape.circle:
        return MdiIcons.circle;
      case BoxShape.rectangle:
        return MdiIcons.rectangleOutline;
      default:
        return MdiIcons.circle;
    }
  }

  BoxShape get shape => BoxShape.values[index];

  bool isSame(BoxShape shape) => this == shape;
}
