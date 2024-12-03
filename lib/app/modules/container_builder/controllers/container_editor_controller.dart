import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerEditorController extends GetxController {
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

  void onBorderChanged(BorderModel border) {
    container.value.decoration?.border = border;
    container.refresh();
  }

  void onBoxShapeChanged(BoxShape boxShape) {
    if (boxShape == BoxShape.circle) {
      container.value.decoration!.borderRadius = null;
    }
    container.value.decoration!.boxShape = boxShape;
    container.refresh();
  }

  void onRadiusChanged(BorderRadiusModel value) {
    if (container.value.decoration?.borderRadius == null) {
      container.value.decoration!.borderRadius = value;
    } else {
      container.value.decoration!.borderRadius = value;
    }

    container.refresh();
  }
}
