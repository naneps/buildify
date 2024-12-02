import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/flex_models/column.model.dart';
import 'package:buildify/app/models/widget_models/widget.%20model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/builder_models/container_model.dart';

class ContainerBuilderController extends GetxController {
  Rx<ContainerModel> container = ContainerModel(
    width: RxDouble(200),
    height: RxDouble(200),
    alignment: AlignmentType.topLeft,
    decoration: BoxDecorationModel(
      color: Get.theme.primaryColor,
      boxShape: BoxShape.rectangle,
    ),
  ).obs;
  WidgetModel container2 = ContainerModel(
    decoration: BoxDecorationModel(
      border: BorderModel(
        all: BorderSideModel(),
      ),
    ),
    child: ColumnModel(),
  );
}
