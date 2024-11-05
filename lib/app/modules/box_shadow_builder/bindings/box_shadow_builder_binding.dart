import 'package:get/get.dart';

import '../controllers/box_shadow_builder_controller.dart';

class BoxShadowBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoxShadowBuilderController>(
      () => BoxShadowBuilderController(),
    );
  }
}
