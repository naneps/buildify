import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

abstract class FlexModel extends WidgetModel {
  List<WidgetModel>? children;
  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  MainAxisSize? mainAxisSize;
  TextDirection? textDirection;
  VerticalDirection? verticalDirection;
  TextBaseline? textBaseline;

  FlexModel({
    this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  });

  Widget buildFlex({required Axis direction}) {
    return Flex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      textDirection: textDirection,
      verticalDirection: verticalDirection ?? VerticalDirection.down,
      textBaseline: textBaseline,
      children: children?.map((child) => child.build()).toList() ?? [],
    );
  }
}
