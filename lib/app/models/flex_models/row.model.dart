import 'package:buildify/app/models/flex_models/flex.model.dart';
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
  Map<String, dynamic> toJson() {
    return {
      'mainAxisAlignment': mainAxisAlignment?.index,
      'crossAxisAlignment': crossAxisAlignment?.index,
      'mainAxisSize': mainAxisSize?.index,
      'textDirection': textDirection?.index,
      'verticalDirection': verticalDirection?.index,
      'textBaseline': textBaseline?.index,
      'children': children?.map((child) => child.toJson()).toList(),
    };
  }
}
