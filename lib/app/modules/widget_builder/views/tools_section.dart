import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/widget_builder_controller.dart';

class ToolsSectionView extends GetView<WidgetBuilderController> {
  const ToolsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.activeWidget.value.buildEditor(),
    );
  }
}
