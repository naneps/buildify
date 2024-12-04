import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';

class ListTileModel extends WidgetModel {
  WidgetModel? leading;
  WidgetModel? title;
  WidgetModel? subtitle;
  WidgetModel? trailing;

  ListTileModel({this.leading, this.title, this.subtitle, this.trailing});

  @override
  Widget build() {
    return ListTile(
      leading: leading?.build(),
      title: title?.build(),
      subtitle: subtitle?.build(),
      trailing: trailing?.build(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'leading': leading?.toJson(),
      'title': title?.toJson(),
      'subtitle': subtitle?.toJson(),
      'trailing': trailing?.toJson(),
    };
  }
}
