import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/circle_avatar_models/circle_avatar.model.dart';
import 'package:buildify/app/models/flex_models/column.model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetBuilderController extends GetxController {
  Rx<WidgetModel> widget = ContainerModel(
    width: RxDouble(300),
    height: RxDouble(500),
    padding: EdgeInsetModel.all(20),
    decoration: BoxDecorationModel(
      border: BorderModel(),
      borderRadius: BorderRadiusModel(all: 20),
    ),
    child: ColumnModel(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatarModel(),
        TextModel(
          text: 'Ahmed Mohamed',
        )
      ],
    ),
  ).obs;
}
