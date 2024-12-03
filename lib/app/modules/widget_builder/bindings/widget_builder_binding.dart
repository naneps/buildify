import 'package:get/get.dart';

import '../controllers/widget_builder_controller.dart';

class WidgetBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetBuilderController>(
      () => WidgetBuilderController(),
    );
  }
}
