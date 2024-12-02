import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:buildify/app/models/widget_models/widget.%20model.dart';
import 'package:flutter/material.dart';

class TextModel extends WidgetModel {
  String? text;
  TextStyleModel? style;
  int? maxLines;
  int? minLines;
  TextModel({
    this.text,
    this.style,
    this.maxLines,
  });
  @override
  Widget build() {
    return Text(
      text ?? 'content text',
      style: style?.toTextStyle(),
      maxLines: maxLines,
    );
  }
}
