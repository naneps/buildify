import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEditorController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Rx<TextModel> textModel;
  TextEditorController({required this.textModel});

  void onFontSizeChange(String value) {
    textModel.update(
      (textModel) => textModel?.style?.value.fontSize = double.parse(value),
    );
    textModel.value.style?.refresh();
  }

  void onTextAlignChange(TextAlign value) {
    textModel.update(
      (textModel) => textModel!.textAlign?.value = value,
    );
    textModel.refresh();
  }

  void onTextChange(String value) {
    if (textModel.value.textAlign?.value == null) {
      textModel.update(
        (textModel) => textModel?.textAlign?.value = TextAlign.left,
      );
      textModel.refresh();
    }
    textModel.update(
      (textModel) => textModel?.text?.value = value,
    );

    textModel.refresh();
  }
}
