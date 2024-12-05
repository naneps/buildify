import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/modules/box_shadow_builder/controllers/box_shadow_builder_controller.dart';
import 'package:buildify/app/modules/box_shadow_builder/controllers/box_shadow_tools_controller.dart';
import 'package:buildify/app/modules/box_shadow_builder/views/shadow_tools_section.dart';
import 'package:buildify/app/modules/container_builder/views/container_editor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxShadowToolsView extends GetView<BoxShadowToolsController> {
  const BoxShadowToolsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: ThemeManager().defaultBorder(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              controller: controller.mainTabController,
              tabs: const [
                Tab(text: "Box Shadow"),
                Tab(text: "Shape"),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.mainTabController,
                children: [
                  ShadowToolsSection(controller: controller),
                  ContainerEditorView(
                      key: const ValueKey("shape"),
                      container:
                          Get.find<BoxShadowBuilderController>().containerModel)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
