import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/builder_models/decoration_image.model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerEditorController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<ContainerModel> container = ContainerModel(
    width: RxDouble(200),
    height: RxDouble(200),
    padding: EdgeInsetModel(type: EdgeInsetType.all, all: 0),
    margin: EdgeInsetModel(type: EdgeInsetType.all, all: 0),
    alignment: AlignmentType.topLeft,
    decoration: BoxDecorationModel(
      color: Get.theme.primaryColor,
      boxShape: BoxShape.rectangle,
      borderRadius: null,
      border: null,
      boxShadow: null,
      gradient: null,
    ),
    child: TextModel(
      text: "Buildify",
      style: TextStyleModel(fontSize: 20, color: Colors.white),
    ),
  ).obs;

  void updateAlignment(AlignmentType alignment) {
    container.value.alignment = alignment;
    container.refresh();
  }

  void updateBorder(BorderModel border) {
    container.value.decoration?.border = border;
    container.refresh();
  }

  void updateBorderRadius(BorderRadiusModel borderRadius) {
    container.value.decoration?.borderRadius = borderRadius;
    container.refresh();
  }

  void updateBoxShape(BoxShape boxShape) {
    if (boxShape == BoxShape.circle) {
      container.value.decoration?.borderRadius = null;
    }
    container.value.decoration?.boxShape = boxShape;
    container.refresh();
  }

  void updateDecorationColor(Color color) {
    container.value.decoration?.color = color;
    container.refresh();
  }

  void updateDecorationImage(DecorationImageModel value) {
    container.value.decoration?.image = value;
    container.refresh();
  }

  void updateHeight(String value) {
    final height = double.tryParse(value) ?? 0.0;
    container.value.height!.value = height;
    container.refresh();
  }

  void updateMargin(EdgeInsetModel value) {
    container.value.margin = value;
    container.refresh();
  }

  void updatePadding(EdgeInsetModel value) {
    container.value.padding = value;
    container.refresh();
  }

  // Methods for handling container updates
  void updateWidth(String value) {
    final width = double.tryParse(value) ?? 0.0;
    container.value.width!.value = width;
    container.refresh();
  }
}
