import 'package:buildify/app/commons/ui/inputs/picker_color.widget.dart';
import 'package:buildify/app/commons/ui/inputs/text_align_tool.dart';
import 'package:buildify/app/models/text_models/font_weight.model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/text_editor_controller.dart';

class TextEditorView extends GetView<TextEditorController> {
  final Rx<TextModel> textModel;
  const TextEditorView({super.key, required this.textModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Theme.of(context).canvasColor,
      body: ListView(
        // mainAxisSize: MainAxisSize.max,
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Text",
                      style: Get.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      initialValue: textModel.value.text,
                      onChanged: (value) => textModel.value.text = value,
                      maxLines: 20,
                      minLines: 2,
                      decoration: const InputDecoration(
                        hintText: "type here",
                        prefixIcon: Icon(Icons.text_fields),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Text Align", style: Get.textTheme.bodySmall),
                    const SizedBox(height: 5),
                    TextAlignTool(
                      textAlign:
                          Rx(textModel.value.textAlign ?? TextAlign.left),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Text Overflow",
                    style: Get.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 100,
                    child: TextOverflowTool(
                      textOverflow: Rx(
                        textModel.value.overflow ?? TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Text(
            "Style",
            style: Get.textTheme.labelSmall,
          ),
          const Divider(),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Font Size",
                        style: Get.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        initialValue: "12",
                        onChanged: (value) => textModel.value.style?.fontSize =
                            double.tryParse(value) ?? 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Font Weight",
                        style: Get.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 5),
                      DropdownButtonFormField(
                        items: [
                          ...XFontWeight.values.map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name),
                              ))
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      "Color",
                      style: Get.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    PickerColor(
                      scaffoldKey: controller.scaffoldKey,
                      initialColor:
                          textModel.value.style?.color ?? Colors.black,
                      onColorChanged: (value) {
                        textModel.value.style?.color = value;
                      },
                    ),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
