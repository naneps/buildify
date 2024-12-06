import 'package:flutter/material.dart';

class VisualDensityModel {
  double? horizontal;
  double? vertical;
  VisualDensityType? type;
  VisualDensityModel({
    this.horizontal = 0.0,
    this.vertical = 0.0,
    this.type = VisualDensityType.standard,
  });

  factory VisualDensityModel.fromJson(Map<String, dynamic> json) {
    return VisualDensityModel(
      horizontal: json['horizontal']?.toDouble(),
      vertical: json['vertical']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['horizontal'] = horizontal;
    data['vertical'] = vertical;
    return data;
  }

  VisualDensity toVisualDensity() {
    switch (type) {
      case VisualDensityType.standard:
        return VisualDensity.standard;
      case VisualDensityType.compact:
        return VisualDensity.compact;
      case VisualDensityType.comfortable:
        return VisualDensity.comfortable;
      case VisualDensityType.custom:
        return VisualDensity(horizontal: horizontal!, vertical: vertical!);
      default:
        return VisualDensity.standard;
    }
  }
}

enum VisualDensityType { standard, compact, comfortable, custom }

extension VisualDensityTypeExtension on VisualDensityType {
  String get name => toString().split('.').last;
  VisualDensityType get type => {
        VisualDensity.standard: VisualDensityType.standard,
        VisualDensity.compact: VisualDensityType.compact,
        VisualDensity.comfortable: VisualDensityType.comfortable,
      }[this]!;
  VisualDensity get visualDensity => {
        VisualDensityType.standard: VisualDensity.standard,
        VisualDensityType.compact: VisualDensity.compact,
        VisualDensityType.comfortable: VisualDensity.comfortable,
      }[this]!;
}
