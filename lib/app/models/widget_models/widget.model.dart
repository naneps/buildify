import 'package:flutter/material.dart';

abstract class WidgetModel {
  WidgetType? type;
  String? name;
  Widget build();
}

enum WidgetType { singleChild, multipleChild }
