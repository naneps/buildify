import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:buildify/app/modules/container_builder/views/container_editor_view.dart';
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
  }) : super();

  factory ContainerModel.fromJson(Map<String, dynamic> json) {
    return ContainerModel(
      width: json['width'] != null ? RxDouble(json['width']) : null,
      height: json['height'] != null ? RxDouble(json['height']) : null,
      color: json['color'] != null ? Color(json['color']) : null,
      alignment: AlignmentType.values[json['alignment'] ?? 0],
      decoration: BoxDecorationModel.fromJson(json['decoration']),
      child:
          json['child'] != null ? WidgetParser.fromJson(json['child']) : null,
      padding: json['padding'] != null
          ? EdgeInsetModel.fromJson(json['padding'])
          : null,
      //   margin: EdgeInsetModel.fromJson(json['margin']),
      //   clipBehavior: json['clipBehavior'] != null
      //       ? Clip.values[json['clipBehavior']]
      //       : null,
    );
  }

  @override
  Widget build() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      clipBehavior: clipBehavior ?? Clip.none,
      width: width?.value ?? 0.0,
      height: height?.value ?? 0.0,
      padding: padding?.toEdgeInsets(),
      alignment: alignment?.alignment,
      color: decoration != null ? null : color,
      margin: margin?.toEdgeInsets(),
      decoration: decoration?.toBoxDecoration(),
      child: child?.build(),
    );
  }

  @override
  Widget buildEditor() {
    // TODO: implement buildEditor
    return ContainerEditorView(
      container: Rx<ContainerModel>(this),
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'width': width?.value,
      'height': height?.value,
      'color': color?.value,
      'alignment': alignment?.index,
      'decoration': decoration?.toJson(),
      'child': child?.toJson(),
      'padding': padding?.toJson(),
      'margin': margin?.toJson(),
      'clipBehavior': clipBehavior?.index,
      'runtimeType': runtimeType.toString(),
    }..removeWhere((key, value) => value == null);
  }
}

extension ContainerModelExtension on ContainerModel {
  String toCode() {
    return '```dart\n${build().toString()}\n```';
  }
}
