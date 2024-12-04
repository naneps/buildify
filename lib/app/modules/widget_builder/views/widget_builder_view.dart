import 'package:buildify/app/commons/ui/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        mobile: const Center(
          child: Text("Mobile View \n Coming Soon"),
        ),
        tablet: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() {
                  return controller.widget.value.build();
                }),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
