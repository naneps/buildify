import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/models/builder_models/box_decoration_model.dart';
import '/app/models/builder_models/container_model.dart';
import '/app/models/builder_models/gradient.model.dart';
import '../../../repositories/gradient.repository.dart';

class GradientBuilderController extends GetxController {
  final gradientRepository = Get.find<GradientRepository>();
  Rx<ContainerModel> container = ContainerModel(
    width: RxDouble(200),
    height: RxDouble(200),
    padding: EdgeInsetModel(type: EdgeInsetType.zero).obs,
    margin: EdgeInsetModel(type: EdgeInsetType.zero).obs,
    alignment: AlignmentType.topLeft.obs,
    decoration: BoxDecorationModel(
      color: Get.theme.primaryColor,
      boxShape: BoxShape.rectangle,
      borderRadius: null,
      border: null,
      image: null,
      gradient: null,
    ).obs,
  ).obs;

//   Future<Stream<List<UserGradientModel>>> getGradients() async {
//     return gradientRepository.getUserGradients();
//   }

  void onGradientChanged(GradientModel gradient) {
    container.value.decoration!.value.gradient = gradient;
    container.value.decoration!.value.color = null;
    container.refresh();
    update();
  }
}
