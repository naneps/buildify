import 'package:flutter/material.dart';

class BorderRadiusModel {
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final double? radius;
  final BorderRadiusType? type;

  BorderRadiusModel({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.radius,
    this.type,
  });

  factory BorderRadiusModel.fromJson(Map<String, dynamic> json) {
    return BorderRadiusModel(
      topLeft: json['topLeft'] as double?,
      topRight: json['topRight'] as double?,
      bottomLeft: json['bottomLeft'] as double?,
      bottomRight: json['bottomRight'] as double?,
      type: json['type'] != null
          ? BorderRadiusType.values[json['type'] as int]
          : null,
    );
  }

  BorderRadiusModel copyWith({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    double? radius,
    BorderRadiusType? type,
  }) {
    return BorderRadiusModel(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
      radius: radius ?? this.radius,
      type: type ?? this.type,
    );
  }

  BorderRadius toBorderRadius() {
    switch (type) {
      case BorderRadiusType.all:
        return BorderRadius.all(Radius.circular(radius ?? 0.0));
      case BorderRadiusType.only:
        return BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? 0.0),
          topRight: Radius.circular(topRight ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? 0.0),
        );
      case BorderRadiusType.horizontal:
        return BorderRadius.horizontal(
          left: Radius.circular(topLeft ?? 0.0),
          right: Radius.circular(topRight ?? 0.0),
        );
      case BorderRadiusType.vertical:
        return BorderRadius.vertical(
          top: Radius.circular(topLeft ?? 0.0),
          bottom: Radius.circular(bottomRight ?? 0.0),
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
      'radius': radius,
      'type': type?.index,
    };
  }
}

enum BorderRadiusType { all, only, horizontal, vertical }
