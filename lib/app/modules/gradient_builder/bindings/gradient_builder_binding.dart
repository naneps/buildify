import 'package:buildify/app/modules/gradient_builder/controllers/gradient_public_controller.dart';
import 'package:buildify/app/services/user_service.dart';
import 'package:get/get.dart';

import '../../../repositories/gradient.repository.dart';
import '../controllers/gradient_builder_controller.dart';
import '../controllers/gradient_editor_controller.dart';
import '../controllers/gradient_tools_controller.dart';

class GradientBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserService());
    Get.lazyPut(() => GradientBuilderController());
    Get.lazyPut(() => GradientToolsController());
    Get.lazyPut(() => GradientEditorController());
    Get.lazyPut(() => GradientRepository());
    Get.lazyPut(() => GradientPublicController());
  }
}
