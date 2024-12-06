import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/models/flex_models/flex.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class RowModel extends FlexModel {
  RowModel({
    super.children,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  });

  factory RowModel.fromJson(Map<String, dynamic> json) {
    return RowModel(
        children: json['children'] != null
            ? List<WidgetModel>.from(
                json['children'].map((child) => WidgetParser.fromJson(child)))
            : null,
        mainAxisAlignment: MainAxisAlignment.values.firstWhere(
            (element) => element.name == json['mainAxisAlignment'],
            orElse: () => MainAxisAlignment.center),
        crossAxisAlignment: CrossAxisAlignment.values.firstWhere(
          (element) => element.name == json['crossAxisAlignment'],
          orElse: () => CrossAxisAlignment.start,
        ),
        mainAxisSize: MainAxisSize.values.firstWhere(
          (element) => element.name == json['mainAxisSize'],
          orElse: () => MainAxisSize.max,
        ),
        textDirection: TextDirection.values.firstWhere(
          (element) => element.name == json['textDirection'],
        ),
        verticalDirection: VerticalDirection.values.firstWhere(
          (element) => element.name == json['verticalDirection'],
        ),
        textBaseline: TextBaseline.values.firstWhere(
          (element) => element.name == json['textBaseline'],
        ));
  }

  @override
  Row build() {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      textDirection: textDirection,
      verticalDirection: verticalDirection ?? VerticalDirection.down,
      textBaseline: textBaseline,
      children: children?.map((child) => child.build()).toList() ?? [],
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
      'mainAxisAlignment': mainAxisAlignment?.name,
      'crossAxisAlignment': crossAxisAlignment?.name,
      'mainAxisSize': mainAxisSize?.name,
      'textDirection': textDirection?.name,
      'verticalDirection': verticalDirection?.name,
      'textBaseline': textBaseline?.name,
      'children': children?.map((child) => child.toJson()).toList(),
      'runtimeType': runtimeType.toString(),
    }..removeWhere((key, value) => value == null);
  }
}
