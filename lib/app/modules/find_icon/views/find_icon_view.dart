import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/icon_map.dart';

import '../controllers/find_icon_controller.dart';

class FindIconView extends GetView<FindIconController> {
  const FindIconView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FindIconView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search Icons',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => controller.search.value = value,
                ),
              ),
              const SizedBox(height: 10),
              // Copywriter Section
              Obx(() {
                final totalIcons = controller.sourceIcons.length;
                final filteredCount = controller.filteredIcons.length;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Showing $filteredCount of $totalIcons icons.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 10),
              // Icon Grid
              Expanded(
                child: Obx(() {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.filteredIcons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth ~/ 250,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      final iconKey = controller.filteredIcons[index];
                      return Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade200, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Get.theme.canvasColor,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              iconMap[iconKey]!,
                              size: 40,
                            ),
                            const SizedBox(height: 20),
                            Text(iconKey),
                          ],
                        ),
                      );
                    },
                  );
                }),
              )
            ],
          );
        }),
      ),
    );
  }
}
