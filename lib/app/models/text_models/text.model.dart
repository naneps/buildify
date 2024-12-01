import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:flutter/material.dart';

class TextModel {
  String? text;
  TextModel({this.text, TextStyleModel? style});
  TextStyleModel? style;
  int? maxLines;
  int? minLines;
  Widget toWidget() {
    return Text(
      text ?? 'content text',
      style: style?.toTextStyle(),
      maxLines: maxLines,
    );
  }
}
