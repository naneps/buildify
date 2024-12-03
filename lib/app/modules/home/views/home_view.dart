import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/ui/buttons/neo_icon_button.dart';
import 'package:buildify/app/commons/ui/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  pinned: false,
                  expandedHeight: 80,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: CustomAppBar(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'A suite of tools to accelerate your workflow:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search for tools...',
                              contentPadding: const EdgeInsets.all(20),
                              prefixIcon: Icon(MdiIcons.magnify),
                            ),
                            onChanged: (value) {
                              // Handle search
                              controller.search(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        NeoIconButton(
                            icon: Icon(
                              MdiIcons.filterVariant,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 370,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: controller.navigationItems.length,
                    itemBuilder: (context, index) {
                      final feature = controller.navigationItems[index];
                      return _buildFeatureCard(
                        icon: feature.iconData!,
                        label: feature.title!,
                        description: "description",
                        onPressed: () {
                          // Open feature page
                          if (feature.route != null) {
                            Get.toNamed(feature.route!);
                          }
                        },
                      );
                    }),
                const SliverFillRemaining(),
                // Footer Section
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Get.theme.canvasColor,
                      borderRadius: BorderRadius.circular(10),
                      border: ThemeManager().defaultBorder(),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Buildify - Build your work faster',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Crafted with Flutter. Visit our GitHub for more information.',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                MdiIcons.github,
                              ),
                              onPressed: () {
                                // Open GitHub link
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String label,
    required String description,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          border: ThemeManager().defaultBorder(color: Get.theme.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(
              label,
              style: Get.textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: Get.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
