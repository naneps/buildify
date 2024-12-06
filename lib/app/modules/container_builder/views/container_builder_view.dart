import 'package:buildify/app/commons/ui/responsive_layout.dart';
import 'package:buildify/app/modules/container_builder/views/container_editor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/container_builder_controller.dart';

class ContainerBuilderView extends GetView<ContainerBuilderController> {
  const ContainerBuilderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.canvasColor,
      appBar: AppBar(
        title: const Text('ContainerBuilderView'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        mobile: ContainerEditorView(
          key: const ValueKey('containerEditor'),
          container: controller.container,
        ),
        tablet: Obx(() {
          return Row(
            children: [
              Expanded(
                flex: Get.width > 800 ? 2 : 1,
                child: Center(child: controller.container.value.build()),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ContainerEditorView(
                  key: const ValueKey('containerEditor'),
                  container: controller.container,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
