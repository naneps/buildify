import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IconEditorView extends GetView {
  const IconEditorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IconEditorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IconEditorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
