import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

import 'flex.model.dart';

class ColumnModel extends FlexModel {
  ColumnModel({
    super.children,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  });

  factory ColumnModel.fromJson(Map<String, dynamic> json) {
    return ColumnModel(
      children: json['children'] != null
          ? List<WidgetModel>.from(
              json['children'].map((child) => WidgetParser.fromJson(child)))
          : null,
      mainAxisAlignment: MainAxisAlignment.values
          .byName(json['mainAxisAlignment'] ?? 'center'),
      crossAxisAlignment: CrossAxisAlignment.values
          .byName(json['crossAxisAlignment'] ?? 'start'),
      mainAxisSize: MainAxisSize.values.byName(json['mainAxisSize'] ?? 'max'),
      textDirection:
          TextDirection.values.byName(json['textDirection'] ?? 'ltr'),
      verticalDirection:
          VerticalDirection.values.byName(json['verticalDirection'] ?? 'down'),
      //       : null,
      textBaseline:
          TextBaseline.values.byName(json['textBaseline'] ?? 'alphabetic'),
    );
  }

  @override
  Column build() {
    return Column(
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
