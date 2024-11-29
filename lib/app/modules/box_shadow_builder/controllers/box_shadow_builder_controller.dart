import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/modules/container_builder/controllers/container_builder_controller.dart';
import 'package:get/get.dart';

class BoxShadowBuilderController extends GetxController {
  final containerBuilderController = Get.find<ContainerBuilderController>();
  Rx<ContainerModel> containerModel = ContainerModel(
    width: (Get.width * 0.3).obs,
    height: (Get.width * 0.3).obs,
    decoration: BoxDecorationModel(
      boxShadow: [],
      gradient: null,
      color: ThemeManager().primaryColor,
    ),
  ).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    containerBuilderController.container.listen(
      (container) {
        containerModel.update(
          (val) {
            val!.width!.value = container.width!.value;
            val.height!.value = container.height!.value;
            val.decoration!.color = container.decoration!.color;
            val.decoration?.boxShape = container.decoration!.boxShape;
          },
        );
      },
    );
  }
}
