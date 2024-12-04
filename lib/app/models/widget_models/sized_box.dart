import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class SizedBoxModel extends WidgetModel {
  double? width;
  double? height;
  WidgetModel? child;
  SizedBoxModel({this.width, this.height, this.child});
  factory SizedBoxModel.fromJson(Map<String, dynamic> json) => SizedBoxModel(
        width: json['width'],
        height: json['height'],
        child:
            json['child'] != null ? WidgetParser.fromJson(json['child']) : null,
      );

  @override
  Widget build() {
    return SizedBox(
      width: width,
      height: height,
      child: child?.build(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'child': child?.toJson(),
    }..removeWhere((key, value) => value == null);
  }
}
