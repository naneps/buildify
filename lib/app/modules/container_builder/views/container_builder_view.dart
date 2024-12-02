import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../commons/ui/inputs/colors_picker.widget.dart';
import '../../../commons/ui/inputs/x_input.dart';
import '../controllers/container_builder_controller.dart';

class ContainerBuilderView extends GetView<ContainerBuilderController> {
  const ContainerBuilderView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.canvasColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.container2.build(),
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
                      XInput(
                        label: 'Width',
                        keyboardType: TextInputType.number,
                        initialValue:
                            controller.container.value.width!.value.toString(),
                        prefixIcon: Icon(MdiIcons.squareOutline),
                        onChanged: (value) {
                          double width = double.parse(value);
                          controller.container.value.width!.value = width;
                          controller.container.refresh();
                        },
                      ),
                      const SizedBox(height: 10),
                      XInput(
                        label: 'Height',
                        initialValue:
                            controller.container.value.height!.value.toString(),
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(MdiIcons.squareOutline),
                        onChanged: (value) {
                          double height = double.parse(value);
                          controller.container.value.height!.value = height;
                          controller.container.refresh();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alignment",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.grey.shade200, width: 1),
                          ),
                          child: Obx(() {
                            return GridView.count(
                              crossAxisCount: 3,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(5),
                              shrinkWrap: true,
                              children: [
                                ...AlignmentType.values
                                    .map((alignmentType) => InkWell(
                                          onTap: () {
                                            controller.container.value
                                                .alignment = alignmentType;
                                            controller.container.refresh();
                                          },
                                          child: Icon(controller.container.value
                                                      .alignment ==
                                                  alignmentType
                                              ? MdiIcons.circle
                                              : MdiIcons.circleOutline),
                                        ))
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10,
            ),
            Text(
              'Decoration',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Row(
                        children: [
                          ...BoxShape.values.map((boxShape) => Expanded(
                                child: ActionChip(
                                  padding: const EdgeInsets.all(15),
                                  onPressed: () {
                                    controller.container.value.decoration
                                        ?.boxShape = boxShape;
                                    controller.container.refresh();
                                  },
                                  label: Icon(boxShape.icon),
                                  backgroundColor: controller.container.value
                                              .decoration?.boxShape ==
                                          boxShape
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                ),
                              ))
                        ],
                      );
                    })
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
