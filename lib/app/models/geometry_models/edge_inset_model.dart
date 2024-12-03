import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EdgeInsetModel {
  EdgeInsetType type;
  double? all;
  double? left;
  double? top;
  double? right;
  double? bottom;
  double? horizontal;
  double? vertical;

  EdgeInsetModel({
    required this.type,
    this.all,
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
    this.horizontal = 0.0,
    this.vertical = 0.0,
  });

  /// Factory constructors for convenience
  factory EdgeInsetModel.all(double value) {
    return EdgeInsetModel(type: EdgeInsetType.all, all: value);
  }

  /// Creates an instance from JSON
  factory EdgeInsetModel.fromJson(Map<String, dynamic> json) {
    EdgeInsetType type = EdgeInsetType.values.firstWhere(
      (e) => e.toString() == json['type'],
      orElse: () => EdgeInsetType.all,
    );

    return EdgeInsetModel(
      type: type,
      all: json['all']?.toDouble(),
      left: json['left']?.toDouble(),
      top: json['top']?.toDouble(),
      right: json['right']?.toDouble(),
      bottom: json['bottom']?.toDouble(),
      horizontal: json['horizontal']?.toDouble(),
      vertical: json['vertical']?.toDouble(),
    );
  }

  factory EdgeInsetModel.only({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsetModel(
      type: EdgeInsetType.only,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  factory EdgeInsetModel.symmetric({
    double? horizontal,
    double? vertical,
  }) {
    return EdgeInsetModel(
      type: EdgeInsetType.symmetric,
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  /// Converts the model to an EdgeInsets object
  EdgeInsets toEdgeInsets() {
    switch (type) {
      case EdgeInsetType.all:
        return EdgeInsets.all(all ?? 0.0);
      case EdgeInsetType.only:
        return EdgeInsets.only(
          left: left ?? 0.0,
          top: top ?? 0.0,
          right: right ?? 0.0,
          bottom: bottom ?? 0.0,
        );
      case EdgeInsetType.symmetric:
        return EdgeInsets.symmetric(
          horizontal: horizontal ?? 0.0,
          vertical: vertical ?? 0.0,
        );
    }
  }

  /// Converts to JSON for serialization
  Map<String, dynamic> toJson() {
    return {
      'type': type.toString(),
      'all': all,
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
      'horizontal': horizontal,
      'vertical': vertical,
    };
  }
}

enum EdgeInsetType { all, only, symmetric }

extension EdgeInsetTypeExtension on EdgeInsetType {
  IconData get icon => {
        EdgeInsetType.all: MdiIcons.borderAllVariant,
        EdgeInsetType.only:
            MdiIcons.borderLeftVariant, // atau ikon untuk sisi spesifik
        EdgeInsetType.symmetric: MdiIcons.borderStyle, // atau borderVertical
      }[this]!;
  String get name => toString().split('.').last;
}
