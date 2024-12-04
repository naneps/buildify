import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BorderRadiusModel {
  double? topLeft;
  double? topRight;
  double? bottomLeft;
  double? bottomRight;
  double? verticalTop;
  double? verticalBottom;
  double? horizontalLeft;
  double? horizontalRight;
  double? all;
  BorderRadiusType? type;

  BorderRadiusModel({
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
    this.all = 0.0,
    this.verticalTop = 0.0,
    this.verticalBottom = 0.0,
    this.horizontalLeft = 0.0,
    this.horizontalRight = 0.0,
    this.type = BorderRadiusType.all,
  });

  factory BorderRadiusModel.fromJson(Map<String, dynamic> json) {
    return BorderRadiusModel(
      topLeft: json['topLeft'] as double?,
      topRight: json['topRight'] as double?,
      bottomLeft: json['bottomLeft'] as double?,
      bottomRight: json['bottomRight'] as double?,
      all: json['all'] as double?,
      verticalTop: json['verticalTop'] as double?,
      verticalBottom: json['verticalBottom'] as double?,
      horizontalLeft: json['horizontalLeft'] as double?,
      horizontalRight: json['horizontalRight'] as double?,
      type: json['type'] != null
          ? BorderRadiusType.values[json['type'] as int]
          : null,
    );
  }

  factory BorderRadiusModel.zero() => BorderRadiusModel(all: 0.0);

  BorderRadiusModel copyWith({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    double? all,
    double? horizontalRight,
    double? horizontalLeft,
    double? verticalTop,
    double? verticalBottom,
    BorderRadiusType? type,
  }) {
    return BorderRadiusModel(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
      verticalTop: verticalTop ?? this.verticalTop,
      verticalBottom: verticalBottom ?? this.verticalBottom,
      horizontalLeft: horizontalLeft ?? this.horizontalLeft,
      all: all ?? this.all,
      type: type ?? this.type,
    );
  }

  BorderRadius toBorderRadius() {
    switch (type) {
      case BorderRadiusType.all:
        return BorderRadius.all(Radius.circular(all ?? 0.0));
      case BorderRadiusType.only:
        return BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? 0.0),
          topRight: Radius.circular(topRight ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? 0.0),
        );
      case BorderRadiusType.horizontal:
        return BorderRadius.horizontal(
          left: Radius.circular(horizontalLeft ?? 0.0),
          right: Radius.circular(horizontalRight ?? 0.0),
        );
      case BorderRadiusType.vertical:
        return BorderRadius.vertical(
          top: Radius.circular(verticalTop ?? 0.0),
          bottom: Radius.circular(verticalBottom ?? 0.0),
        );
      default:
        return BorderRadius.zero;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'topLeft': topLeft,
      'topRight': topRight,
      'bottomLeft': bottomLeft,
      'bottomRight': bottomRight,
      'radius': all,
      'type': type?.name,
    };
  }
}

enum BorderRadiusType { all, only, horizontal, vertical }

extension BorderRadiusTypeExtension on BorderRadiusType {
  IconData get icon => {
        BorderRadiusType.all: MdiIcons.borderAllVariant,
        BorderRadiusType.only: MdiIcons.borderLeftVariant,
        BorderRadiusType.horizontal: MdiIcons.borderHorizontal,
        BorderRadiusType.vertical: MdiIcons.borderVertical,
      }[this]!;
  String get name => toString().split('.').last;
  BorderRadiusType get type => {
        MdiIcons.borderAllVariant: BorderRadiusType.all,
        MdiIcons.borderLeftVariant: BorderRadiusType.only,
        MdiIcons.borderHorizontal: BorderRadiusType.horizontal,
        MdiIcons.borderVertical: BorderRadiusType.vertical,
      }[icon]!;
}
