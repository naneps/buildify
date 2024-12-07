import 'package:buildify/app/models/circle_avatar_models/circle_avatar.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleAvatarEditorView extends GetView {
  Rx<CircleAvatarModel> circleAvatar;
  CircleAvatarEditorView({super.key, required this.circleAvatar});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CircleAvatarEditorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CircleAvatarEditorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
