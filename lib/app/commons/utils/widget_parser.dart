import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/widget_models/icon_model.dart';
import 'package:buildify/app/models/widget_models/sized_box.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';

typedef WidgetModelFactory = WidgetModel Function(Map<String, dynamic> json);

class WidgetParser {
  static final Map<String, WidgetModelFactory> _factories = {
    'ContainerModel': (json) => ContainerModel.fromJson(json),
    'TextModel': (json) => TextModel.fromJson(json),
    'IconModel': (json) => IconModel.fromJson(json),
    'SizedBoxModel': (json) => SizedBoxModel.fromJson(json),
  };

  static WidgetModel? fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    if (type == null) {
      print('Widget type is missing in JSON');
      return null;
    }
    final factory = _factories[type];
    if (factory == null) {
      print('Unknown widget type: $type');
      return null;
    }
    return factory(json);
  }

  static void registerWidget(String type, WidgetModelFactory factory) {
    _factories[type] = factory;
  }
}
