import 'package:buildify/app/modules/gradient_builder/controllers/gradient_public_controller.dart';
import 'package:buildify/app/modules/gradient_builder/widgets/user_gradient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class GridGradientPublicView extends GetView<GradientPublicController> {
  const GridGradientPublicView({
    super.key,
  });
  @override
  get controller => Get.find<GradientPublicController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Obx(() {
        return GridView.builder(
          itemCount: controller.gradients.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width ~/ 370,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 1.2,
          ),
          shrinkWrap: true,
          cacheExtent: 1000,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final userGradient = controller.gradients[index];
            return Obx(
              () {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedScale(
                    scale: !(controller.previewGradient.value == userGradient)
                        ? 1.0
                        : 0.8,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutBack,
                    child: UserGradientCard(
                      key: ValueKey(userGradient.id!),
                      userGradient: userGradient,
                      onPreview: () => controller.showPreview(userGradient),
                    ).animate().scale(
                          delay: Duration(
                              milliseconds: (index * 100).clamp(0, 1000)),
                          begin: const Offset(0.8, 0.8),
                          end: const Offset(1.0, 1.0),
                          curve: Curves.easeInOutBack,
                        ),
                  ),
                );
              },
            );
          },
        );
      });
    });
  }
}
