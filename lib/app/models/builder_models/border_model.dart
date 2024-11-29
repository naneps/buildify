import 'package:flutter/material.dart';

class BorderModel {
  BorderType? type;
  BorderSideModel? all;
  BorderSideModel? top;
  BorderSideModel? bottom;
  BorderSideModel? left;
  BorderSideModel? right;

  BorderModel({
    this.type = BorderType.all,
    this.all,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  BorderModel copyWith({
    BorderType? type,
    BorderSideModel? all,
    BorderSideModel? top,
    BorderSideModel? bottom,
    BorderSideModel? left,
    BorderSideModel? right,
  }) {
    return BorderModel(
      type: type ?? this.type,
      all: all ?? this.all,
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }

  BoxBorder toBorder() {
    switch (type) {
      case BorderType.all:
        return Border.all(
          color: all?.color ?? Colors.black,
          width: all?.width ?? 1.0,
          style: all?.style ?? BorderStyle.solid,
        );
      case BorderType.only:
        return Border(
          top: top?.toBorderSide() ?? BorderSide.none,
          bottom: bottom?.toBorderSide() ?? BorderSide.none,
          left: left?.toBorderSide() ?? BorderSide.none,
          right: right?.toBorderSide() ?? BorderSide.none,
        );
      default:
        return Border.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        );
    }
  }

  @override
  String toString() {
    return 'BorderModel{type: $type, all: $all, top: $top, bottom: $bottom, left: $left, right: $right}';
  }
}

class BorderSideModel {
  Color? color;
  double? width;
  BorderStyle? style;

  BorderSideModel({
    this.color = Colors.black,
    this.width = 1.0,
    this.style = BorderStyle.solid,
  });

  BorderSideModel copyWith({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideModel(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
    );
  }

  BorderSide toBorderSide() {
    return BorderSide(
      color: color ?? Colors.black,
      width: width ?? 1.0,
      style: style ?? BorderStyle.solid,
    );
  }

  @override
  String toString() {
    return 'BorderSideModel{color: $color, width: $width, style: $style}';
  }
}

enum BorderType { all, only }
