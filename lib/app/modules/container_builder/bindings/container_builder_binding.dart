import 'package:get/get.dart';

import 'package:buildify/app/modules/container_builder/controllers/container_editor_controller.dart';

import '../controllers/container_builder_controller.dart';

class ContainerBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContainerEditorController>(
      () => ContainerEditorController(),
    );
    Get.lazyPut<ContainerBuilderController>(
      () => ContainerBuilderController(),
    );
  }
}
