import 'package:buildify/app/commons/ui/responsive_layout.dart';
import 'package:buildify/app/modules/widget_builder/views/tools_section.dart';
import 'package:buildify/app/modules/widget_builder/views/widgets_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/ui/resizedable_widget/resizable_widget.dart';
import '../controllers/widget_builder_controller.dart';

class WidgetBuilderView extends GetView<WidgetBuilderController> {
  const WidgetBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WidgetBuilderView'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        padding: const EdgeInsets.all(0),
        mobile: const Center(
          child: Text("Mobile View \n Coming Soon"),
        ),
        tablet: ResizableWidget(
          separatorColor: Theme.of(context).primaryColor,
          separatorSize: 2,
          onResized: (infoList) {},
          percentages: const [0.2, 0.6, 0.2],
          //   maxSizes: const [400, 200, 200],
          children: [
            const WidgetsSection(),
            Scaffold(
              body: Obx(() {
                return Stack(
                  children: [
                    Positioned(
                      left: controller.xAxis.value,
                      top: controller.yAxis.value,
                      child: GestureDetector(
                        onPanStart: (details) {
                          // Handle the start of the drag (if needed)
                        },
                        onPanUpdate: (details) {
                          // Update x and y axis based on drag delta
                          controller.updateYAxis(
                              controller.yAxis.value + details.delta.dy);
                          controller.updateXAxis(
                              controller.xAxis.value + details.delta.dx);
                        },
                        onPanEnd: (details) {
                          // Handle the end of the drag (if needed)
                        },
                        child: Container(
                          // Replace with your widget logic
                          child: controller.widget.value.build(),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const ToolsSectionView(),
          ],
        ),
      ),
    );
  }
}
