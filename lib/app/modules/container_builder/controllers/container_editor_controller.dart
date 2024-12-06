import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/builder_models/decoration_image.model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerEditorController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Rx<ContainerModel> container;

  ContainerEditorController(this.container);

  void updateAlignment(AlignmentType alignment) {
    container.value.alignment?.value = alignment;
    container.value.alignment?.refresh();
  }

  void updateBorder(BorderModel border) {
    container.value.decoration?.value.border = border;
    container.value.decoration?.refresh();
  }

  void updateBorderRadius(BorderRadiusModel borderRadius) {
    container.value.decoration?.value.borderRadius = borderRadius;
    container.value.decoration?.refresh();
  }

  void updateBoxShape(BoxShape boxShape) {
    if (boxShape == BoxShape.circle) {
      container.value.decoration?.value.borderRadius = null;
      container.value.decoration?.refresh();
    }

    container.value.decoration?.value.boxShape = boxShape;
    container.value.decoration?.refresh();
  }

  void updateDecorationColor(Color color) {
    container.value.decoration?.value.color = color;
    container.value.decoration?.refresh();
  }

  void updateDecorationImage(DecorationImageModel value) {
    container.value.decoration?.value.image = value;
    container.value.decoration?.refresh();
  }

  void updateHeight(String value) {
    final height = double.tryParse(value) ?? 0.0;
    container.value.height!.value = height;
  }

  void updateMargin(EdgeInsetModel value) {
    container.value.margin?.value = value;
    container.value.margin?.refresh();
  }

  void updatePadding(EdgeInsetModel value) {
    container.value.padding?.value = value;
    container.value.padding?.refresh();
  }

  // Methods for handling container updates
  void updateWidth(String value) {
    final width = double.tryParse(value) ?? 0.0;
    container.value.width!.value = width;
  }
}
