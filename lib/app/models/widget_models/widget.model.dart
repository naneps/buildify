import 'package:flutter/material.dart';

abstract class WidgetModel {
  WidgetType? typeChild;
  String? name;
  Widget build();
  Map<String, dynamic> toJson();
}

enum WidgetType { singleChild, multipleChild }
