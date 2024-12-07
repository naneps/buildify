import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:buildify/app/modules/widget_builder/views/text_editor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextModel extends WidgetModel {
  RxString? text;
  Rx<TextStyleModel>? style;
  RxInt? maxLines;
  Rx<TextAlign>? textAlign;
  Rx<TextOverflow>? overflow;
  Rx<bool>? softWrap;
  Rx<TextDirection>? textDirection;
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
      style: json['style'] != null
          ? TextStyleModel.fromJson(json['style']).obs
          : null,
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
  Widget build(
    Function(WidgetModel model)? onTap,
  ) {
    return InkWell(
      onTap: () {
        onTap?.call(this);
      },
      child: Text(
        text?.value ?? 'content text',
        style: style?.value.toTextStyle(),
        maxLines: maxLines?.value,
        textAlign: textAlign?.value,
        overflow: overflow?.value,
        softWrap: softWrap?.value,
        textDirection: textDirection?.value,
      ),
    );
  }

  @override
  Widget buildEditor() {
    return TextEditorView(textModel: Rx(this));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text?.value,
      'style': style?.toJson(),
      'maxLines': maxLines,
      'textAlign': textAlign?.value.name,
      'overflow': overflow?.value.name,
      'softWrap': softWrap,
      'textDirection': textDirection?.value.name,
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
