import 'package:get/get.dart';

import 'package:buildify/app/modules/box_shadow_builder/controllers/box_shadow_editor_controller.dart';
import 'package:buildify/app/modules/box_shadow_builder/controllers/box_shadow_tools_controller.dart';

import '../controllers/box_shadow_builder_controller.dart';

class BoxShadowBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoxShadowEditorController>(
      () => BoxShadowEditorController(),
    );
    Get.lazyPut<BoxShadowToolsController>(
      () => BoxShadowToolsController(),
    );
    Get.lazyPut<BoxShadowBuilderController>(
      () => BoxShadowBuilderController(),
    );
  }
}
