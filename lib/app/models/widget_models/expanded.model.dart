import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class ExpandedModel extends WidgetModel {
  int? flex;
  WidgetModel? child;

  ExpandedModel({this.flex, this.child});
  factory ExpandedModel.fromJson(Map<String, dynamic> json) {
    return ExpandedModel(
      flex: json['flex'] ?? 1,
      child: WidgetParser.fromJson(
        json['child'] as Map<String, dynamic>,
      )!,
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
      child: Expanded(
        flex: flex ?? 1,
        child: child!.build(onTap?.call(child!)),
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
      'flex': flex,
      'child': child?.toJson(),
      'runtimeType': runtimeType.toString(),
    }..removeWhere((key, value) => value == null);
  }
}
