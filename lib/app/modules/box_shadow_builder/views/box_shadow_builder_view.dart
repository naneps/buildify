import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/box_shadow_builder_controller.dart';

class BoxShadowBuilderView extends GetView<BoxShadowBuilderController> {
  const BoxShadowBuilderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoxShadowBuilderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BoxShadowBuilderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
