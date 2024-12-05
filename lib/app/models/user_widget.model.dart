import 'package:buildify/app/commons/utils/widget_parser.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';

class UserWidgetModel {
  String? id;
  String? userId;
  String? className;
  String? name;
  String? description;
  WidgetModel? widget;

  UserWidgetModel({
    this.id,
    this.userId,
    this.widget,
    this.className,
    this.name,
    this.description,
  });

  factory UserWidgetModel.fromFirestore(Map<String, dynamic> json, String id) {
    return UserWidgetModel.fromJson(json).copyWith(id: id);
  }
  factory UserWidgetModel.fromJson(Map<String, dynamic> json) {
    return UserWidgetModel(
      id: json['id'],
      userId: json['userId'],
      className: json['className'],
      name: json['name'],
      description: json['description'],
      widget: WidgetParser.fromJson(json['widget']),
    );
  }

  UserWidgetModel copyWith({String? id, String? userId, WidgetModel? widget}) {
    return UserWidgetModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      widget: widget ?? this.widget,
      className: className ?? className,
      name: name ?? name,
      description: description ?? description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId ?? '',
      'widget': widget?.toJson(),
      'className': className ?? 'ClassName',
      'name': name ?? 'Example Widget',
      'description': description ?? 'description',
    };
  }
}
