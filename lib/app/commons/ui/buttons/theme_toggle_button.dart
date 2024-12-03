import 'package:buildify/app/commons/themes/theme.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeToggleButton extends GetView<ThemeController> {
  const ThemeToggleButton({super.key});
  @override
  get controller => Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: IconButton(
          key: ValueKey<bool>(controller.isDarkMode.value),
          icon: Icon(
            controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
            size: 24,
          ),
          onPressed: controller.toggleTheme,
        ),
      );
    });
  }
}
