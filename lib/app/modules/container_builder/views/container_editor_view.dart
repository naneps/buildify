import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/inputs/alignment_selector.widget.dart';
import 'package:buildify/app/commons/ui/inputs/border_radius_tool.dart';
import 'package:buildify/app/commons/ui/inputs/border_side_tool.dart';
import 'package:buildify/app/commons/ui/inputs/colors_picker.widget.dart';
import 'package:buildify/app/commons/ui/inputs/edgeinset_tool.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/modules/container_builder/controllers/container_editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContainerEditorView extends GetView<ContainerEditorController> {
  const ContainerEditorView({super.key});

  @override
  get controller => Get.put(ContainerEditorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          border: ThemeManager().defaultBorder(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Width and Height',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: controller.container.value.width
                            ?.toInt()
                            .toString(),
                        decoration: const InputDecoration(
                          label: Text('Width'),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        onChanged: (value) {
                          double width = double.parse(value);
                          controller.container.value.width!.value = width;
                          controller.container.refresh();
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: controller.container.value.height
                            ?.toInt()
                            .toString(),
                        decoration: const InputDecoration(
                          label: Text('Height'),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (value) {
                          double width = double.parse(value);
                          controller.container.value.height!.value = width;
                          controller.container.refresh();
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alignment",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 10),
                    AlignmentSelector(
                      key: const ValueKey('container-alignment'),
                      onChange: (alignment) {
                        controller.container.value.alignment = alignment;
                        controller.container.refresh();
                      },
                      initialAlignment: controller.container.value.alignment,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: EdgeInsetTool(
                    key: const ValueKey('container-padding'),
                    label: 'Padding',
                    onChange: (value) {
                      controller.container.value.padding = value;
                      controller.container.refresh();
                    },
                    initValue: controller.container.value.padding!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: EdgeInsetTool(
                    key: const ValueKey('container-margin'),
                    label: 'Margin',
                    onChange: (value) {
                      controller.container.value.margin = value;
                      controller.container.refresh();
                    },
                    initValue: controller.container.value.margin!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Decoration',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 5),
                    ColorPickerWidget(
                      initialColors: [
                        controller.container.value.decoration!.color!
                      ],
                      isMultiple: false,
                      onColorsChanged: (value) {
                        controller.container.value.decoration?.color =
                            value.first;
                        controller.container.refresh();
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shape",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 5),
                    Obx(() {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...BoxShape.values.map(
                            (boxShape) => Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: ActionChip(
                                onPressed: () {
                                  controller.onBoxShapeChanged(boxShape);
                                },
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.grey.shade300,
                                ),
                                label: Icon(
                                  boxShape.icon,
                                  color: controller.container.value.decoration
                                              ?.boxShape ==
                                          boxShape
                                      ? Theme.of(context).primaryColor
                                      : MainColors.darkColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    })
                  ],
                ))
              ],
            ),
            const SizedBox(height: 10),
            Obx(() {
              return Visibility(
                visible: controller.container.value.decoration?.boxShape ==
                    BoxShape.rectangle,
                child: BorderRadiusTool(
                  initValue:
                      controller.container.value.decoration?.borderRadius,
                  key: const ValueKey('container-border-radius'),
                  onChange: (value) {
                    controller.onRadiusChanged(value);
                  },
                ),
              );
            }),
            const SizedBox(height: 10),
            BorderSideTool(
              onChange: (border) {
                controller.onBorderChanged(border);
              },
              initValue: controller.container.value.decoration?.border,
            ),
          ],
        ),
      ),
    );
  }
}
