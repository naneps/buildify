import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/builder_models/box_decoration_model.dart';
import '../../../models/builder_models/container_model.dart';

class ContainerBuilderController extends GetxController {
  Rx<ContainerModel> container = ContainerModel(
    width: RxDouble(200),
    height: RxDouble(200),
    decoration: BoxDecorationModel(
      color: Colors.red,
    ),
  ).obs;
}
