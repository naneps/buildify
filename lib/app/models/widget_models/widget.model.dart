import 'package:flutter/material.dart';

abstract class WidgetModel {
  WidgetType? typeChild;
  String? name;
  String? id;

  Widget build();
  Widget buildEditor();
  Map<String, dynamic> toJson();
}

enum WidgetType { singleChild, multipleChild }
