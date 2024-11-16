import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:get/get.dart';

class BoxShadowBuilderController extends GetxController {
  Rx<ContainerModel> containerModel = ContainerModel(
    width: (Get.width * 0.3).obs,
    height: (Get.width * 0.3).obs,
    decoration: BoxDecorationModel(
      boxShadow: [],
      gradient: null,
      color: ThemeManager().primaryColor,
    ),
  ).obs;
}
