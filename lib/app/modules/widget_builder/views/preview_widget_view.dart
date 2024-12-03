import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PreviewWidgetView extends GetView {
  const PreviewWidgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreviewWidgetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PreviewWidgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
