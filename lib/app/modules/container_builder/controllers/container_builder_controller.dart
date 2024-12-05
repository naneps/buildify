import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/circle_avatar_models/circle_avatar.model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/image_provider_model/image_provider.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/builder_models/container_model.dart';

class ContainerBuilderController extends GetxController {
  Rx<ContainerModel> container = ContainerModel(
    width: RxDouble(200),
    height: RxDouble(200),
    padding: EdgeInsetModel(type: EdgeInsetType.all),
    margin: EdgeInsetModel(type: EdgeInsetType.all),
    alignment: AlignmentType.topLeft,
    decoration: BoxDecorationModel(
      color: Get.theme.primaryColor,
      boxShape: BoxShape.rectangle,
      borderRadius: null,
      border: null,
      image: null,
      gradient: null,
    ),
    child: CircleAvatarModel(
      radius: 20,
      backgroundColor: Get.theme.canvasColor,
      backgroundImage: ImageProviderModel(
        pathImage: 'https://avatars.githubusercontent.com/u/72372613?v=4',
        type: ImageProviderType.network,
      ),
    ),
  ).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Get.put(ContainerEditorController(), tag: "containerEditor")
    //     .container
    //     .listen(
    //   (value) {
    //     container.update(
    //       (val) {
    //         val!.width!.value = value.width!.value;
    //         val.height!.value = value.height!.value;
    //         val.padding = value.padding;
    //         val.margin = value.margin;
    //         val.alignment = value.alignment;
    //         val.decoration!.color = value.decoration?.color;
    //         val.decoration?.boxShape = value.decoration!.boxShape;
    //         val.decoration?.borderRadius = value.decoration?.borderRadius;
    //         val.decoration!.border = value.decoration?.border;
    //         val.decoration?.image = value.decoration?.image;
    //         // print(val.decoration!.image);
    //       },
    //     );
    //   },
    // );
  }
}
