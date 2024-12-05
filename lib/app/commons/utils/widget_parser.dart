import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/button_models/icon_button.model.dart';
import 'package:buildify/app/models/circle_avatar_models/circle_avatar.model.dart';
import 'package:buildify/app/models/flex_models/column.model.dart';
import 'package:buildify/app/models/flex_models/row.model.dart';
import 'package:buildify/app/models/listile_models/listile.model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/widget_models/expanded.model.dart';
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
    'ListTileModel': (json) => ListTileModel.fromJson(json),
    'CircleAvatarModel': (json) => CircleAvatarModel.fromJson(json),
    'ColumnModel': (json) => ColumnModel.fromJson(json),
    'RowModel': (json) => RowModel.fromJson(json),
    'ExpandedModel': (json) => ExpandedModel.fromJson(json),
    'IconButtonModel': (json) => IconButtonModel.fromJson(json),
  };

  static WidgetModel? fromJson(Map<String, dynamic> json) {
    final type = json['runtimeType'] as String?;
    if (type == null) {
      return null;
    }
    final factory = _factories[type];
    if (factory == null) {
      return null;
    }
    return factory(json);
  }

  static void registerWidget(String type, WidgetModelFactory factory) {
    _factories[type] = factory;
  }
}
