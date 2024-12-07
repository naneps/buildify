import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/inputs/alignment_selector.widget.dart';
import 'package:buildify/app/commons/ui/inputs/border_radius_tool.dart';
import 'package:buildify/app/commons/ui/inputs/border_side_tool.dart';
import 'package:buildify/app/commons/ui/inputs/edgeinset_tool.dart';
import 'package:buildify/app/commons/ui/inputs/image_decoration_tool.dart';
import 'package:buildify/app/commons/ui/inputs/picker_color.widget.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/modules/container_builder/controllers/container_editor_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContainerEditorView extends GetView<ContainerEditorController> {
  final Rx<ContainerModel> container;
  const ContainerEditorView({
    super.key,
    required this.container,
  });

  @override
  get controller => Get.put(ContainerEditorController(container));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          border: ThemeManager().defaultBorder(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
              multitouchDragStrategy: MultitouchDragStrategy.latestPointer),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Width and Height',
                            style: Theme.of(context).textTheme.labelSmall),
                        const SizedBox(height: 10),
                        TextFormField(
                          initialValue: controller.container.value.width
                              ?.toInt()
                              .toString(),
                          decoration:
                              const InputDecoration(label: Text('Width')),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ],
                          onChanged: controller.updateWidth,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          initialValue: controller.container.value.height
                              ?.toInt()
                              .toString(),
                          decoration:
                              const InputDecoration(label: Text('Height')),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ],
                          onChanged: controller.updateHeight,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alignment',
                          style: Theme.of(context).textTheme.labelSmall),
                      const SizedBox(height: 10),
                      AlignmentSelector(
                        key: const ValueKey('container-alignment'),
                        onChange: controller.updateAlignment,
                        initialAlignment:
                            controller.container.value.alignment?.value,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: EdgeInsetTool(
                      key: const ValueKey('container-padding'),
                      label: 'Padding',
                      onChange: controller.updatePadding,
                      initValue: controller.container.value.padding?.value ??
                          EdgeInsetModel(
                            type: EdgeInsetType.zero,
                          ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: EdgeInsetTool(
                      key: const ValueKey('container-margin'),
                      label: 'Margin',
                      onChange: controller.updateMargin,
                      initValue: controller.container.value.margin?.value ??
                          EdgeInsetModel(
                            type: EdgeInsetType.zero,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Decoration', style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Color',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 5),
                      PickerColor(
                        key: const ValueKey('container-color'),
                        scaffoldKey: controller.scaffoldKey,
                        initialColor:
                            controller.container.value.decoration?.value.color,
                        onColorChanged: (color) {
                          controller.updateDecorationColor(color);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shape',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 5),
                        Obx(() {
                          return Row(
                            children: BoxShape.values.map((shape) {
                              return Tooltip(
                                message: shape.name,
                                child: InkWell(
                                  onTap: () {
                                    controller.updateBoxShape(shape);
                                  },
                                  child: Icon(
                                    shape.icon,
                                    color: shape ==
                                            controller.container.value
                                                .decoration?.value.boxShape
                                        ? MainColors.primaryColor
                                        : Colors.grey,
                                    size: 25,
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() {
                return Visibility(
                  visible:
                      controller.container.value.decoration?.value.boxShape ==
                          BoxShape.rectangle,
                  child: BorderRadiusTool(
                    key: const ValueKey('container-border-radius'),
                    initValue: controller
                        .container.value.decoration?.value.borderRadius,
                    onChange: controller.updateBorderRadius,
                  ),
                );
              }),
              const SizedBox(height: 10),
              BorderSideTool(
                key: const ValueKey('container-border'),
                scaffoldKey: controller.scaffoldKey,
                onChange: (val) {
                  controller.updateBorder(val);
                },
                initValue:
                    controller.container.value.decoration?.value.border?.obs,
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Image Decoration",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 10),
                  ImageDecorationTool(
                    key: const ValueKey('container-image-decoration'),
                    initialValue:
                        controller.container.value.decoration?.value.image,
                    onChange: (value) {
                      controller.updateDecorationImage(value);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
