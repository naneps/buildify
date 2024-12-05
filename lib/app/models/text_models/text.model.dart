import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class TextModel extends WidgetModel {
  String? text;
  TextStyleModel? style;
  int? maxLines;
  TextAlign? textAlign;
  TextOverflow? overflow;
  bool? softWrap;
  TextDirection? textDirection;
  TextModel({
    this.text,
    this.style,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.textDirection,
  });
  factory TextModel.fromJson(Map<String, dynamic> json) {
    return TextModel(
      text: json['text'],
      style:
          json['style'] != null ? TextStyleModel.fromJson(json['style']) : null,
      maxLines: json['maxLines'],
      //   textAlign: json['textAlign'] != null
      //       ? TextAlign.values[json['textAlign']]
      //       : null,
      //   overflow: json['overflow'] != null
      //       ? TextOverflow.values[json['overflow']]
      //       : null,
      //   softWrap: json['softWrap'],
      //   textDirection: json['textDirection'] != null
      //       ? TextDirection.values[json['textDirection']]
      //       : null,
    );
  }

  @override
  Widget build() {
    return Text(
      text ?? 'content text',
      style: style?.toTextStyle(),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
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
      'text': text,
      'style': style?.toJson(),
      'maxLines': maxLines,
      'textAlign': textAlign?.name,
      'overflow': overflow?.name,
      'softWrap': softWrap,
      'textDirection': textDirection?.name,
      'runtimeType': runtimeType.toString(),
    }..removeWhere((key, value) => value == null);
  }
}

extension TextAlignExtension on TextAlign? {
  IconData? get icon => {
        TextAlign.left: Icons.format_align_left,
        TextAlign.right: Icons.format_align_right,
        TextAlign.center: Icons.format_align_center,
        TextAlign.justify: Icons.format_align_justify,
        TextAlign.start: Icons.format_align_left,
        TextAlign.end: Icons.format_align_right,
      }[this];
}
