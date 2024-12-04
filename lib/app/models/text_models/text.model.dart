import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
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
  factory TextModel.fromJson(Map<String, dynamic> json) {
    return TextModel(
      text: json['text'],
      style:
          json['style'] != null ? TextStyleModel.fromJson(json['style']) : null,
      maxLines: json['maxLines'],
    );
  }

  @override
  Widget build() {
    return Text(
      text ?? 'content text',
      style: style?.toTextStyle(),
      maxLines: maxLines,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'style': style?.toJson(),
      'maxLines': maxLines,
      'minLines': minLines
    };
  }
}
