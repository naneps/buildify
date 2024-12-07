import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class MainWidgetModel extends WidgetModel {
  @override
  Widget build(Function(WidgetModel p1)? onTap) {
    return InkWell(
      onTap: () {
        onTap?.call(this);
      },
      child: const SizedBox(),
    );
  }

  @override
  Widget buildEditor() {
    return const SizedBox();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
