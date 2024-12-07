import 'package:buildify/app/models/flex_models/flex.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlexEditorView extends GetView {
  Rx<FlexModel> flexModel;
  FlexEditorView({super.key, required this.flexModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlexrEditorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FlexrEditorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
