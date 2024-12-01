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
      body: const ResponsiveLayout(
        mobile: Center(
          child: Text("Mobile View \n Coming Soon"),
        ),
        tablet: Row(
          children: [],
        ),
      ),
    );
  }
}
