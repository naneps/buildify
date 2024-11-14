import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxShadowEditorController extends GetxController {
  Rx<BoxShadowModel> boxShadow = BoxShadowModel(
    color: Colors.black,
    blurRadius: 0,
    spreadRadius: 0,
    offset: const Offset(0, 1),
  ).obs;
}
