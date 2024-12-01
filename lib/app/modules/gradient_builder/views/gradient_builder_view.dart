import 'package:buildify/app/commons/ui/custom_appbar.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/ui/responsive_layout.dart';
import '../../../modules/gradient_builder/views/gradient_template_view.dart';
import '../../../modules/gradient_builder/views/gradient_tools_view.dart';
import '../controllers/gradient_builder_controller.dart';

class GradientBuilderView extends GetView<GradientBuilderController> {
  const GradientBuilderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: SizedBox(
          height: Get.height,
          width: Get.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("UNDER CONSTRUCTION"),
              Text("COMING SOON"),
              //     const Expanded(
              //       flex: 2,
              //       child: GradientTemplateView(),
              //     ),
              //     const SizedBox(height: 20),
              //     Expanded(
              //       flex: 5,
              //       child: Container(
              //         alignment: Alignment.center,
              //         child: Obx(() {
              //           return controller.container.value.widget();
              //         }),
              //       ),
              //     ),
              //     const SizedBox(height: 20),
              //     const Expanded(
              //       flex: 3,
              //       child: GradientToolsView(),
              //     ),
            ],
          ),
        ),
        tablet: Column(
          children: [
            const SizedBox(height: 90, child: CustomAppBar()),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: GradientTemplateView(),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Obx(() {
                            return controller.container.value.build();
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    flex: 3,
                    child: GradientToolsView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
