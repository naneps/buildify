import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class IconButtonModel extends WidgetModel {
  WidgetModel? icon;
  double? iconSize;
  AlignmentType? alignment;
  EdgeInsetModel? padding;
  String? tooltip;
  Color? color;
  IconButtonModel({
    this.icon,
    this.iconSize,
    this.alignment,
    this.padding,
    this.tooltip,
    this.color,
  });
  @override
  Widget build(
    Function(WidgetModel model)? onTap,
  ) {
    return InkWell(
      onTap: () {
        onTap?.call(this);
      },
      child: IconButton(
        onPressed: () {},
        icon: icon!.build(
          onTap?.call(icon!),
        ),
        iconSize: iconSize,
        padding: padding?.toEdgeInsets(),
        alignment: alignment?.alignment,
        color: color,
        tooltip: tooltip,
      ),
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
      'icon': icon?.toJson(),
      'iconSize': iconSize,
      'alignment': alignment?.name,
      'padding': padding?.toJson(),
      'color': color?.value,
      'tooltip': tooltip,
      'runtimeType': runtimeType.toString(),
    };
  }

  static IconButtonModel fromJson(Map<String, dynamic> json) {
    return IconButtonModel(
      icon: WidgetParser.fromJson(json['icon']),
      iconSize: json['iconSize'],
      alignment: json['alignment'] != null
          ? AlignmentType.values.byName(json['alignment'])
          : null,
      padding: json['padding'] != null
          ? EdgeInsetModel.fromJson(json['padding'])
          : null,
      color: json['color'] != null ? Color(json['color']) : null,
      tooltip: json['tooltip'],
    );
  }
}
