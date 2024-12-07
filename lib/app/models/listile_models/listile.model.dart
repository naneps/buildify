import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/models/builder_models/visual_density.model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:buildify/app/modules/widget_builder/views/listile_editor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ListTileModel extends WidgetModel {
  WidgetModel? leading;
  WidgetModel? title;
  WidgetModel? subtitle;
  WidgetModel? trailing;
  EdgeInsetModel? contentPadding;
  bool? dense;
  bool? selected;
  bool? enabled;
  Color? focusColor;
  Color? hoverColor;
  Color? tileColor;
  Color? selectedTileColor;
  VisualDensityModel? visualDensity;
  ListTileModel({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.contentPadding,
    this.dense,
    this.visualDensity,
    this.selected,
    this.enabled,
    this.focusColor,
    this.hoverColor,
    this.tileColor,
  });

  factory ListTileModel.fromJson(Map<String, dynamic> json) {
    return ListTileModel(
      leading: WidgetParser.fromJson(json['leading']),
      title: WidgetParser.fromJson(json['title']),
      subtitle: WidgetParser.fromJson(json['subtitle']),
      trailing: WidgetParser.fromJson(json['trailing']),
      contentPadding: json['contentPadding'] != null
          ? EdgeInsetModel.fromJson(json['contentPadding'])
          : null,
      //   dense: json['dense'],
      //   selected: json['selected'],
      //   enabled: json['enabled'],
      //   focusColor: json['focusColor'] != null ? Color(json['focusColor']) : null,
      //   hoverColor: json['hoverColor'] != null ? Color(json['hoverColor']) : null,
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
      child: ListTile(
        leading: leading?.build(onTap),
        title: title?.build(onTap?.call(title!)),
        subtitle: subtitle?.build(onTap?.call(subtitle!)),
        trailing: trailing?.build(onTap?.call(trailing!)),
        contentPadding: contentPadding?.toEdgeInsets(),
        dense: dense ?? false,
        selected: selected ?? false,
        enabled: enabled ?? true,
        focusColor: focusColor,
        hoverColor: hoverColor,
        tileColor: tileColor,
        visualDensity: visualDensity?.toVisualDensity(),
      ),
    );
  }

  @override
  Widget buildEditor() {
    // TODO: implement buildEditor
    return ListTileEditorView(listTile: Rx(this));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'leading': leading?.toJson(),
      'title': title?.toJson(),
      'subtitle': subtitle?.toJson(),
      'trailing': trailing?.toJson(),
      'contentPadding': contentPadding?.toJson(),
      'dense': dense,
      'selected': selected,
      'enabled': enabled,
      'focusColor': focusColor?.value,
      'hoverColor': hoverColor?.value,
      'tileColor': tileColor?.value,
      'visualDensity': visualDensity?.toJson(),
      'runtimeType': runtimeType.toString(),
    }..removeWhere((key, value) => value == null);
  }
}
