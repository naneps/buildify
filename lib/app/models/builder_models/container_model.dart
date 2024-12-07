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
  Rx<Color>? color;
  Rx<BoxDecorationModel>? decoration;
  Rx<Clip>? clipBehavior;
  Rx<AlignmentType>? alignment;
  Rx<WidgetModel>? child;
  Rx<EdgeInsetModel>? padding;
  Rx<EdgeInsetModel>? margin;
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
      color: json['color'] != null ? Color(json['color']).obs : null,
      alignment: AlignmentType.values.byName(json['alignment']).obs,
      decoration: BoxDecorationModel.fromJson(json['decoration']).obs,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values.byName(json['clipBehavior']).obs
          : null,
      child: json['child'] != null
          ? WidgetParser.fromJson(json['child'])?.obs
          : null,
      padding: json['padding'] != null
          ? EdgeInsetModel.fromJson(json['padding']).obs
          : null,
      margin: json['margin'] != null
          ? EdgeInsetModel.fromJson(json['margin']).obs
          : null,
      //   clipBehavior: json['clipBehavior'] != null
      //       ? Clip.values[json['clipBehavior']]
      //       : null,
    );
  }

  @override
  Widget build(
    Function(WidgetModel model)? onTap,
  ) {
    return InkWell(
      onTap: () {
        onTap?.call(this);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        clipBehavior: clipBehavior?.value ?? Clip.none,
        width: width?.value,
        height: height?.value,
        padding: padding?.value.toEdgeInsets(),
        alignment: alignment?.value.alignment,
        color: decoration != null ? null : color?.value,
        margin: margin?.value.toEdgeInsets(),
        decoration: decoration?.value.toBoxDecoration(),
        child: child?.value.build(onTap),
      ),
    );
  }

  @override
  Widget buildEditor() {
    return ContainerEditorView(
      container: Rx(this),
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
      decoration: decoration?.obs ?? this.decoration,
      alignment: alignment?.obs ?? this.alignment,
      color: color?.obs ?? this.color,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'width': width?.value,
      'height': height?.value,
      'color': color?.value,
      'alignment': alignment?.value.name,
      'decoration': decoration?.value.toJson(),
      'child': child?.value.toJson(),
      'padding': padding?.value.toJson(),
      'margin': margin?.value.toJson(),
      'clipBehavior': clipBehavior?.value.name,
      'runtimeType': runtimeType.toString(),
    }..removeWhere((key, value) => value == null);
  }
}

extension ContainerModelExtension on ContainerModel {
  String toCode() {
    return '';
    // return '```dart\n${build(this).toString()}\n```';
  }
}
