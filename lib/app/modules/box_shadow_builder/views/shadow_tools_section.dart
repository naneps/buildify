import 'package:buildify/app/modules/box_shadow_builder/controllers/box_shadow_tools_controller.dart';
import 'package:buildify/app/modules/box_shadow_builder/views/box_shadow_editor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShadowToolsSection extends StatelessWidget {
  final BoxShadowToolsController controller;

  const ShadowToolsSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shadows (${controller.boxShadows.length})",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 50,
              width: Get.width,
              child: Row(
                children: [
                  // TabBar to navigate between box shadows
                  Expanded(
                    child: TabBar.secondary(
                      controller: controller.tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      splashFactory: NoSplash.splashFactory,
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Colors.grey,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      onTap: (value) {
                        controller.tabIndex.value = value;
                      },
                      tabs:
                          List.generate(controller.boxShadows.length, (index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Shadow ${index + 1}",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              child: Icon(
                                MdiIcons.close,
                                size: 15,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              onTap: () {
                                controller.removeShadow(index);
                              },
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.plus),
                    onPressed: () {
                      controller.addShadow();
                    },
                  )
                ],
              ),
            ),
            const Divider(),
            // TabBarView to display each box shadow editor
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 0; i < controller.boxShadows.length; i++)
                    BoxShadowEditorView(
                      key: ValueKey(i),
                      onChange: (value) {
                        controller.onShadowChanged(value, i);
                      },
                    ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
