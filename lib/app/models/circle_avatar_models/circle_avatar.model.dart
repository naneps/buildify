import 'package:buildify/app/commons/utils/widget_parser.dart';
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
  factory CircleAvatarModel.fromJson(Map<String, dynamic> json) {
    return CircleAvatarModel(
      radius: json['radius'],
      maxRadius: json['maxRadius'],
      minRadius: json['minRadius'],
      backgroundImage: json['backgroundImage'] != null
          ? ImageProviderModel.fromJson(json['backgroundImage'])
          : null,
      backgroundColor: json['backgroundColor'] != null
          ? Color(json['backgroundColor'])
          : null,
      foreGroundColor: json['foreGroundColor'] != null
          ? Color(json['foreGroundColor'])
          : null,
      child:
          json['child'] != null ? WidgetParser.fromJson(json['child']) : null,
    );
  }

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

  @override
  Widget buildEditor() {
    // TODO: implement buildEditor
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'radius': radius,
      'maxRadius': maxRadius,
      'minRadius': minRadius,
      'backgroundImage': backgroundImage?.toJson(),
      'backgroundColor': backgroundColor?.value,
      'foreGroundColor': foreGroundColor?.value,
      'child': child?.toJson(),
      'runtimeType': runtimeType.toString(),
    };
  }
}
