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
    return GridView.builder(
      itemCount: controller.gradients.length ?? 0,
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
        return Obx(() {
          return InkWell(
            onTap: () {
              controller.showPreview(userGradient);
            },
            child: AnimatedScale(
              scale: !(controller.previewGradient.value == userGradient)
                  ? 1.0
                  : 0.8,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutBack,
              child: UserGradientCard(
                key: ValueKey(userGradient.id!),
                userGradient: userGradient,
              )
                  .animate(
                      delay:
                          Duration(milliseconds: (100 * index).clamp(10, 500)))
                  .fade()
                  .scaleXY(
                    begin: 0.5,
                    end: 1.0,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  ),
            ),
          );
        });
      },
    );
  }
}
