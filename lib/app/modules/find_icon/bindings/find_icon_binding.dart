import 'package:get/get.dart';

import '../controllers/find_icon_controller.dart';

class FindIconBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindIconController>(
      () => FindIconController(),
    );
  }
}
