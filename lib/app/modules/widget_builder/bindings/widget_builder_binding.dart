import 'package:get/get.dart';

import 'package:buildify/app/modules/widget_builder/controllers/text_editor_controller.dart';
import 'package:buildify/app/repositories/widget.repository.dart';

import '../controllers/widget_builder_controller.dart';

class WidgetBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextEditorController>(
      () => TextEditorController(),
    );
    Get.lazyPut<WidgetBuilderController>(() => WidgetBuilderController());
    Get.lazyPut<WidgetRepository>(() => WidgetRepository());
  }
}
