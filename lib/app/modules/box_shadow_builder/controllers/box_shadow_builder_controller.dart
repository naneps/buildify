import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/text_models/font_weight.model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:buildify/app/modules/container_builder/controllers/container_editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxShadowBuilderController extends GetxController {
  final containerEditorController =
      Get.put(ContainerEditorController(), tag: 'shape');
  Rx<ContainerModel> containerModel = ContainerModel(
      width: (Get.width * 0.3).obs,
      height: (Get.width * 0.3).obs,
      decoration: BoxDecorationModel(
        boxShadow: [],
        gradient: null,
        image: null,
        border: null,
        color: MainColors.primaryColor,
      ),
      child: TextModel(
        text: 'Buildify',
        style: TextStyleModel(
          color: Colors.white,
          fontSize: 20,
          fontWeight: XFontWeight.w600,
        ),
      )).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    containerEditorController.container.listen(
      (container) {
        containerModel.update(
          (val) {
            val!.width!.value = container.width!.value;
            val.height!.value = container.height!.value;
            val.padding = container.padding;
            val.margin = container.margin;
            val.alignment = container.alignment;
            val.decoration!.color = container.decoration?.color;
            val.decoration?.boxShape = container.decoration!.boxShape;
            val.decoration?.borderRadius = container.decoration?.borderRadius;
            val.decoration!.border = container.decoration?.border;
            val.decoration?.image = container.decoration?.image;
          },
        );
      },
    );
  }
}
