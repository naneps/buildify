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
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                expandedHeight: 80,
                flexibleSpace: CustomAppBar(),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'A suite of tools to accelerate your workflow:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
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
                            color: ThemeManager().blackColor,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
              // Feature Grid
              SliverFillRemaining(
                //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() {
                  return GridView.builder(
                    itemCount: controller.navigationItems.length,
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = controller.navigationItems[index];
                      return _buildFeatureCard(
                        icon: item.iconData!,
                        label: item.title!,
                        description: 'Description for ${item.title}',
                        onPressed: () {
                          // Handle feature click
                          Get.toNamed(item.route!);
                        },
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.0,
                    ),
                  );
                }),
              ),

              // Footer Section
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ThemeManager().scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: ThemeManager().defaultBorder(),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Buildify - Build your work faster',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Crafted with Flutter. Visit our GitHub for more information.',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(MdiIcons.github, color: Colors.white),
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
          ),
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
          border:
              ThemeManager().defaultBorder(color: ThemeManager().primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
