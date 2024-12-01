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
            Text(
              'Width and Height',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: XInput(
                    label: 'Width',
                    keyboardType: TextInputType.number,
                    initialValue:
                        controller.container.value.width!.value.toString(),
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: Icon(MdiIcons.squareOutline),
                    onChanged: (value) {
                      double width = double.parse(value);
                      controller.container.value.width!.value = width;
                      controller.container.refresh();
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: XInput(
                    label: 'Height',
                    contentPadding: const EdgeInsets.all(20),
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
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Color',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ColorPickerWidget(
              initialColors: [controller.container.value.decoration!.color!],
              isMultiple: false,
              onColorsChanged: (value) {
                controller.container.value.decoration?.color = value.first;
                controller.container.refresh();
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Decoration',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
