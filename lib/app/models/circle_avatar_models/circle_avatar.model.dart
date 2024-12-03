import 'package:buildify/app/models/image_provider_model/image_provider.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class CircleAvatarModel extends WidgetModel {
  double? radius;
  double? maxRadius;
  double? minRadius;
  ImageProviderModel? backgroundImage;
  Color? backgroundColor;
  Color? foreGroundColor;

  WidgetModel? child;
  CircleAvatarModel(
      {this.backgroundColor,
      this.radius,
      this.maxRadius,
      this.minRadius,
      this.backgroundImage,
      this.foreGroundColor,
      this.child});
  @override
  Widget build() {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius ?? 20,
      backgroundImage: backgroundImage?.toImageProvider(),
      foregroundColor: foreGroundColor,
      maxRadius: maxRadius,
      child: child?.build(),
    );
  }
}
