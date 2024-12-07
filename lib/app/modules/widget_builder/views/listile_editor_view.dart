import 'package:buildify/app/models/listile_models/listile.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileEditorView extends GetView {
  Rx<ListTileModel> listTile;
  ListTileEditorView({super.key, required this.listTile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListileEditorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListileEditorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
