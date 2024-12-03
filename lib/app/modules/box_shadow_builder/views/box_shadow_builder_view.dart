import 'package:buildify/app/commons/ui/responsive_layout.dart';
import 'package:buildify/app/modules/box_shadow_builder/views/box_shadow_tools_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/box_shadow_builder_controller.dart';

class BoxShadowBuilderView extends GetView<BoxShadowBuilderController> {
  const BoxShadowBuilderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shadow Builder'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        mobile: LayoutBuilder(builder: (context, constraints) {
          return const Center(
            child: Text(
              'Mobile View \n Coming Soon',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          );
        }),
        tablet: Row(
          children: [
            Expanded(
              flex: Get.width > 800 ? 2 : 1,
              child: Obx(
                () {
                  return Center(
                    child: controller.containerModel.value.build(),
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: BoxShadowToolsView(),
            ),
          ],
        ),
      ),
    );
  }
}
