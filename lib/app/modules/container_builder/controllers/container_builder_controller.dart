import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/builder_models/container_model.dart';

class ContainerBuilderController extends GetxController {
  Rx<ContainerModel> container = ContainerModel(
    width: RxDouble(200),
    height: RxDouble(200),
    alignment: AlignmentType.topLeft,
    decoration: BoxDecorationModel(
      color: MainColors.primaryColor,
      boxShape: BoxShape.rectangle,
    ),
  ).obs;
}
